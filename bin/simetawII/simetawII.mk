#! /usr/bin/make -f 
SHELL:=/bin/bash

start_year:=1921
end_year:=2006
mid_years:= $(shell seq `echo ${start_year}+1 | bc` `echo ${end_year}-1 | bc`)
years:=${start_year} ${mid_years} ${end_year}

months:=10 11 12 01 02 03 04 05 06 07 08 09

yms:=$(patsubst %,${start_year}-%,10 11 12) \
$(foreach y,${mid_years},$(patsubst %,$y-%,01 02 03 04 05 06 07 08 09 10 11 12)) \
$(patsubst %,${end_year}-%,01 02 03 04 05 06 07 08 09)

ifndef no-days
days:=$(shell for ym in ${yms}; do for dom in `seq 0 31`; do date --date="$${ym}-01 + $${dom} days" +%Y-%m-%d; done ; done | sort -u )
endif

# Grass specific functions
define grass_or_die
$(if ifndef GISRC,$(error Must be running in GRASS))
endef

ifdef GISRC

GISDBASE:=$(shell g.gisenv get=GISDBASE)
LOCATION_NAME:=$(shell g.gisenv get=LOCATION_NAME)
MAPSET:=$(shell g.gisenv get=MAPSET)

# Shortcut Directories
gdb:=${GISDBASE}
loc:=$(GISDBASE)/$(LOCATION_NAME)

endif

##############################################################################
# MASK defines
##############################################################################

define MASK
g.region rast=state@4km; r.mask -o input=MASK@4km
endef

define NOMASK
g.region rast=state@4km; r.mask -r
endef

#################
# End Configure
#################

define ymd
ymd.$1:=$(filter $1-%,${days})
endef 

.PHONY: yms

yms:
	@echo ${yms}

define monthly

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
	[[ -d ${loc}/$1/etc/sum ]] || mkdir -p ${loc}/$1/etc/sum;\
	g.mapset $1;\
	${MASK};\
	r.stats -1 -n PCP_frac  | perl -a -n -e '$$$$cnt++; $$$$sum+=$$$$F[0]; $$$$sum2+=$$$$F[0]*$$$$F[0]; END {printf "%d,%f,%f\n",$$$$cnt,$$$$sum,$$$$sum2; }' | sed -e "s/^/PCP_frac,$1,/" > $$@

${loc}/$1/etc/hist/PCP_frac.csv:${loc}/$1/cellhd/PCP_frac
	[[ -d ${loc}/$1/etc/hist ]] || mkdir ${loc}/$1/etc/hist;\
	g.mapset $1;\
	${MASK};\
	r.stats -1 -n PCP_frac | perl -a -n -e '$$$$n=sprintf("%.2f",$$$$F[0]); $$$$hist{$$$$n}++; END {foreach (sort { $$$$a <=> $$$$b } keys %hist) { printf "%s,%d\n",$$$$_,$$$$hist{$$$$_};} }' | sed -e "s/^/PCP_frac,$1,/" > $$@

stats:: ${loc}/$1/etc/sum/PCP_summed.csv ${loc}/$1/etc/hist/PCP_summed.csv
${loc}/$1/etc/sum/PCP_summed.csv:${loc}/$1/cellhd/PCP_summed
	[[ -d ${loc}/$1/etc/sum ]] || mkdir -p ${loc}/$1/etc/sum;\
	g.mapset $1;\
	${MASK};\
	r.stats -1 -n PCP_summed  | perl -a -n -e '$$$$cnt++; $$$$sum+=$$$$F[0]; $$$$sum2+=$$$$F[0]*$$$$F[0]; END {printf "%d,%f,%f\n",$$$$cnt,$$$$sum,$$$$sum2; }' | sed -e "s/^/PCP_summed,$1,/" > $$@

${loc}/$1/etc/hist/PCP_summed.csv:${loc}/$1/cellhd/PCP_summed
	[[ -d ${loc}/$1/etc/hist ]] || mkdir ${loc}/$1/etc/hist;\
	g.mapset $1;\
	${MASK};\
	r.stats -1 -n PCP_summed | perl -a -n -e '$$$$n=sprintf("%d",$$$$F[0]/5); $$$$hist{$$$$n}++; END {foreach (sort { $$$$a <=> $$$$b } keys %hist) { printf "%d,%d\n",$$$$_*5,$$$$hist{$$$$_};} }' | sed -e "s/^/PCP_summed,$1,/" > $$@

endef

$(foreach ym,${yms},$(eval $(call ymd,${ym},${t})))

$(foreach ym,${yms},$(eval $(call monthly,${ym},${t})))

.PHONY: PCP
PCP:: PCP_summed PCP_frac

.PHONY: monthly-stats

monthly-stats:: sum_PCP_frac.csv hist_PCP_frac.csv sum_PCP_summed.csv hist_PCP_summed.csv

sum_PCP_frac.csv:
	cat $(patsubst %,${loc}/%/etc/sum/PCP_frac.csv,${yms}) > $@

hist_PCP_frac.csv:
	cat $(patsubst %,${loc}/%/etc/hist/PCP_frac.csv,${yms}) > $@

sum_PCP_summed.csv:
	cat $(patsubst %,${loc}/%/etc/sum/PCP_summed.csv,${yms}) > $@

hist_PCP_summed.csv:
	cat $(patsubst %,${loc}/%/etc/hist/PCP_summed.csv,${yms}) > $@
