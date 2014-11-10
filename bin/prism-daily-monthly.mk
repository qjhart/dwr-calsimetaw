#! /usr/bin/make -f 
SHELL:=/bin/bash

start_year:=1981
end_year:=2012
mid_years:= $(shell seq `echo ${start_year}+1 | bc` `echo ${end_year}-1 | bc`)
years:=${start_year} ${mid_years} ${end_year}

months:=10 11 12 01 02 03 04 05 06 07 08 09

yms:=$(patsubst %,${start_year}-%,10 11 12) \
$(foreach y,${mid_years},$(patsubst %,$y-%,01 02 03 04 05 06 07 08 09 10 11 12)) \
$(patsubst %,${end_year}-%,01 02 03 04 05 06 07 08 09)

ifndef no-days
#days:=$(shell for ym in ${yms}; do for dom in `seq 0 31`; do date --date="$${ym}-01 + $${dom} days" +%Y-%m-%d; done ; done | sort -u )
days:=$(shell for ym in ${yms}; do for dom in `seq 0 31`; do date --date="$${ym}-01 + $${dom} days" +%Y%m%d; done ; done | sort -u )
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
ymd.$1:=$(filter $(subst -,,$1)%,${days})
$(warningNO $(subst -,,$1):=$(filter $(subst -,,$1)%,${days}))
endef 

.PHONY: yms

yms:
	@echo ${yms}

define monthly

.PHONY: ppt_summed
ppt_summed::${loc}/$1/cellhd/ppt_summed
${loc}/$1/cellhd/ppt_summed:
	g.mapset $1;\
	${NOMASK}; \
	r.mapcalc 'ppt_summed=($(patsubst %,"ppt@%"+,${ymd.$1})0)'

.PHONY: ppt_frac
ppt_frac::${loc}/$1/cellhd/ppt_frac
${loc}/$1/cellhd/ppt_frac:
	g.mapset $1;\
	${NOMASK}; \
	r.mapcalc 'ppt_frac=($(patsubst %,"ppt@%"+,${ymd.$1})0)/mPCP'

.PHONY: stats
stats:: ${loc}/$1/etc/sum/ppt_frac.csv ${loc}/$1/etc/hist/ppt_frac.csv
${loc}/$1/etc/sum/ppt_frac.csv:${loc}/$1/cellhd/ppt_frac
	[[ -d ${loc}/$1/etc/sum ]] || mkdir -p ${loc}/$1/etc/sum;\
	g.mapset $1;\
	${MASK};\
	r.stats -1 -n ppt_frac  | perl -a -n -e '$$$$cnt++; $$$$sum+=$$$$F[0]; $$$$sum2+=$$$$F[0]*$$$$F[0]; END {printf "%d,%f,%f\n",$$$$cnt,$$$$sum,$$$$sum2; }' | sed -e "s/^/ppt_frac,$1,/" > $$@

${loc}/$1/etc/hist/ppt_frac.csv:${loc}/$1/cellhd/ppt_frac
	[[ -d ${loc}/$1/etc/hist ]] || mkdir ${loc}/$1/etc/hist;\
	g.mapset $1;\
	${MASK};\
	r.stats -1 -n ppt_frac | perl -a -n -e '$$$$n=sprintf("%.2f",$$$$F[0]); $$$$hist{$$$$n}++; END {foreach (sort { $$$$a <=> $$$$b } keys %hist) { printf "%s,%d\n",$$$$_,$$$$hist{$$$$_};} }' | sed -e "s/^/ppt_frac,$1,/" > $$@

stats:: ${loc}/$1/etc/sum/ppt_summed.csv ${loc}/$1/etc/hist/ppt_summed.csv
${loc}/$1/etc/sum/ppt_summed.csv:${loc}/$1/cellhd/ppt_summed
	[[ -d ${loc}/$1/etc/sum ]] || mkdir -p ${loc}/$1/etc/sum;\
	g.mapset $1;\
	${MASK};\
	r.stats -1 -n ppt_summed  | perl -a -n -e '$$$$cnt++; $$$$sum+=$$$$F[0]; $$$$sum2+=$$$$F[0]*$$$$F[0]; END {printf "%d,%f,%f\n",$$$$cnt,$$$$sum,$$$$sum2; }' | sed -e "s/^/ppt_summed,$1,/" > $$@

${loc}/$1/etc/hist/ppt_summed.csv:${loc}/$1/cellhd/ppt_summed
	[[ -d ${loc}/$1/etc/hist ]] || mkdir ${loc}/$1/etc/hist;\
	g.mapset $1;\
	${MASK};\
	r.stats -1 -n ppt_summed | perl -a -n -e '$$$$n=sprintf("%.2f",$$$$F[0]); $$$$hist{$$$$n}++; END {foreach (sort { $$$$a <=> $$$$b } keys %hist) { printf "%s,%d\n",$$$$_,$$$$hist{$$$$_};} }' | sed -e "s/^/ppt_summed,$1,/" > $$@

endef

$(foreach ym,${yms},$(eval $(call ymd,${ym},${t})))

$(foreach ym,${yms},$(eval $(call monthly,${ym},${t})))

.PHONY: ppt
ppt:: ppt_summed ppt_frac
