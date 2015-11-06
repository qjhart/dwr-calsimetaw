#! /usr/bin/make -f 

ifndef configure.mk
include ../configure.mk
endif

define monthly

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

.PHONY: RF
RF::${loc}/$1/cellhd/RF
${loc}/$1/cellhd/RF:
	g.mapset $1;\
	${NOMASK};\
	r.mapcalc 'RF=$(patsubst %,"RF@%"+,${ymd.$1})0'

.PHONY: PCP_summed
PCP_summed::${loc}/$1/cellhd/PCP_summed
${loc}/$1/cellhd/PCP_summed:
	g.mapset $1;\
	${NOMASK}; \
	r.mapcalc 'PCP_summed=($(patsubst %,"PCP@%"+,${ymd.$1})0)'

.PHONY: PCP_frac
PCP_frac::${loc}/$1/cellhd/PCP_frac
${loc}/$1/cellhd/PCP_frac:
	g.mapset $1;\
	${NOMASK}; \
	r.mapcalc 'PCP_frac=($(patsubst %,"PCP@%"+,${ymd.$1})0)/mPCP'

.PHONY: stats
stats:: ${loc}/$1/etc/sum/PCP_frac.csv ${loc}/$1/etc/hist/PCP_frac.csv
${loc}/$1/etc/sum/PCP_frac.csv:${loc}/$1/cellhd/PCP_frac
	[[ -d ${loc}/$1/etc/sum ]] || mkdir ${loc}/$1/etc/sum;\
	g.mapset $1;\
	${MASK};\
	r.stats -1 -n PCP_frac  | perl -a -n -e '$$$$cnt++; $$$$sum+=$$$$F[0]; $$$$sum2+=$$$$F[0]*$$$$F[0]; END {printf "%d,%f,%f\n",$$$$cnt,$$$$sum,$$$$sum2; }' | sed -e "s/^/PCP_frac,$1,/" > $$@

${loc}/$1/etc/hist/PCP_frac.csv:${loc}/$1/cellhd/PCP_frac
	[[ -d ${loc}/$1/etc/hist ]] || mkdir ${loc}/$1/etc/hist;\
	g.mapset $1;\
	${MASK};\
	r.stats -1 -n PCP_frac | perl -a -n -e '$$$$n=sprintf("%.2f",$$$$F[0]); $$$$hist{$$$$n}++; END {foreach (sort { $$$$a <=> $$$$b } keys %hist) { printf "%s,%d\n",$$$$_,$$$$hist{$$$$_};} }' | sed -e "s/^/PCP_frac,$1,/" > $$@

endef

$(foreach ym,${yms},$(eval $(call monthly,${ym})))

.PHONY: pcp
pcp:: RF PCP_summed PCP_frac

sum_PCP_frac.csv: $(patsubst %,${loc}/%/etc/sum/PCP_frac.csv,${yms})
	cat $^ > $@

hist_PCP_frac.csv: $(patsubst %,${loc}/%/etc/hist/PCP_frac.csv,${yms})
	cat $^ > $@
