#! /usr/bin/make -f 

ifndef configure.mk
include configure.mk
endif

define ymd
ymd.$1:=$(filter $1-%,${days})

.PHONY:stats 
stats::${loc}/$1/etc/sum/mPCP.csv ${loc}/$1/etc/hist/mPCP.csv

${loc}/$1/etc/sum/mPCP.csv:${loc}/$1/cellhd/mPCP
	[[ -d ${loc}/$1/etc/sum ]] || mkdir ${loc}/$1/etc/sum;\
	g.mapset $1;\
	${MASK};\
	r.stats -1 -n mPCP  | perl -a -n -e '$$$$cnt++; $$$$sum+=$$$$F[0]; $$$$sum2+=$$$$F[0]*$$$$F[0]; END {printf "%d,%f,%f\n",$$$$cnt,$$$$sum,$$$$sum2; }' | sed -e "s/^/mPCP,$1,/" > $$@

${loc}/$1/etc/hist/mPCP.csv:${loc}/$1/cellhd/mPCP
	[[ -d ${loc}/$1/etc/hist ]] || mkdir ${loc}/$1/etc/hist;\
	g.mapset $1;\
	${MASK};\
	r.stats -1 -n mPCP | perl -a -n -e '$$$$n=sprintf("%d",$$$$F[0]); $$$$hist{$$$$n}++; END {foreach (sort { $$$$a <=> $$$$b } keys %hist) { printf "%s,%d\n",$$$$_,$$$$hist{$$$$_};} }' | sed -e "s/^/mPCP,$1,/" > $$@

endef

define monthly

.PHONY: $2RF
$2RF::${loc}/$1/cellhd/$2RF
${loc}/$1/cellhd/$2RF:
	g.mapset $*;\
	${NOMASK};\
	r.mapcalc 'aRF=$(patsubst %,"aRF@%"+,${ymd.$1})0'

.PHONY: $2PCP_summed
$2PCP_summed::${loc}/$1/cellhd/$2PCP_summed
${loc}/$1/cellhd/$2PCP_summed:
	g.mapset $1;\
	${NOMASK}; \
	r.mapcalc '$2PCP_summed=($(patsubst %,"$2PCP@%"+,${ymd.$1})0)'

.PHONY: $2PCP_frac
$2PCP_frac::${loc}/$1/cellhd/$2PCP_frac
${loc}/$1/cellhd/$2PCP_frac:
	g.mapset $1;\
	${NOMASK}; \
	r.mapcalc '$2PCP_frac=($(patsubst %,"$2PCP@%"+,${ymd.$1})0)/mPCP'

.PHONY: stats
stats:: ${loc}/$1/etc/sum/$2PCP_frac.csv ${loc}/$1/etc/hist/$2PCP_frac.csv
${loc}/$1/etc/sum/$2PCP_frac.csv:${loc}/$1/cellhd/$2PCP_frac
	[[ -d ${loc}/$1/etc/sum ]] || mkdir ${loc}/$1/etc/sum;\
	g.mapset $1;\
	${MASK};\
	r.stats -1 -n $2PCP_frac  | perl -a -n -e '$$$$cnt++; $$$$sum+=$$$$F[0]; $$$$sum2+=$$$$F[0]*$$$$F[0]; END {printf "%d,%f,%f\n",$$$$cnt,$$$$sum,$$$$sum2; }' | sed -e "s/^/$2PCP_frac,$1,/" > $$@

${loc}/$1/etc/hist/$2PCP_frac.csv:${loc}/$1/cellhd/$2PCP_frac
	[[ -d ${loc}/$1/etc/hist ]] || mkdir ${loc}/$1/etc/hist;\
	g.mapset $1;\
	${MASK};\
	r.stats -1 -n $2PCP_frac | perl -a -n -e '$$$$n=sprintf("%.2f",$$$$F[0]); $$$$hist{$$$$n}++; END {foreach (sort { $$$$a <=> $$$$b } keys %hist) { printf "%s,%d\n",$$$$_,$$$$hist{$$$$_};} }' | sed -e "s/^/$2PCP_frac,$1,/" > $$@

endef

# Could also be like this
#${loc}/%/cellhd/aRF:
#	g.mapset $*;\
#	${NOMASK};\
#	r.mapcalc 'aRF=$(patsubst %,"aRF@%"+,${ymd.$*})0'
#.PHONY:aRF
#aRF:$(patsubst %,${loc}/%/cellhd/aRF,${yms})


$(foreach ym,${yms},$(eval $(call ymd,${ym},${t})))

$(foreach t,j a,$(foreach ym,${yms},$(eval $(call monthly,${ym},${t}))))

.PHONY: pcp
pcp:: aRF jRF aPCP_summed aPCP_frac 

