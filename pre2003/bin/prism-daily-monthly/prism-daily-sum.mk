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

define daily

.PHONY: stats
stats:: ${loc}/$1/etc/sum/ppt.csv ${loc}/$1/etc/hist/ppt.csv

${loc}/$1/etc/sum/ppt.csv ${loc}/$1/etc/hist/ppt.csv:${loc}/$1/cellhd/ppt
	[[ -d ${loc}/$1/etc/sum ]] || mkdir -p ${loc}/$1/etc/sum;\
	g.mapset $1;\
	${MASK};\
	date=`echo $1 | sed -e 's/\(....\)\(..\)\(..\)/\1-\2-\3/'`;\
	r.stats -1 -n ppt  | perl -a -n -e '$$$$cnt++; $$$$sum+=$$$$F[0]; END {printf "%d,%0.2f\n",$$$$cnt,$$$$sum; }' | sed -e "s/^/ppt,$$$$date,/" > ${loc}/$1/etc/sum/ppt.csv;\
	[[ -d ${loc}/$1/etc/hist ]] || mkdir ${loc}/$1/etc/hist;\
	r.stats -1 -n ppt | perl -a -n -e '$$$$n=sprintf("%d",$$$$F[0]/2); $$$$hist{$$$$n}++; END {foreach (sort { $$$$a <=> $$$$b } keys %hist) { printf "%d,%d\n",$$$$_*2,$$$$hist{$$$$_};} }' | sed -e "s/^/ppt,$$$$date,/" > ${loc}/$1/etc/hist/ppt.csv;

endef

$(foreach d,${days},$(eval $(call daily,${d})))

daily_sum_ppt.csv: stats
	cat $(patsubst %,${loc}/%/etc/sum/ppt.csv,${days}) > $@

daily_hist_ppt.csv: stats
	cat $(patsubst %,${loc}/%/etc/hist/ppt.csv,${days}) > $@

