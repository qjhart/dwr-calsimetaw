#! /usr/bin/make -f
configure.mk:=1

ifndef no-dates

#start_year:=1920
start_year:=1921
end_year:=1929
mid_years:= $(shell seq `echo ${start_year}+1 | bc` `echo ${end_year}-1 | bc`)
years:=${start_year} ${mid_years} ${end_year}

months:=10 11 12 01 02 03 04 05 06 07 08 09

yms:=$(patsubst %,${start_year}-%,10 11 12) \
$(foreach y,${mid_years},$(patsubst %,$y-%,01 02 03 04 05 06 07 08 09 10 11 12)) \
$(patsubst %,${end_year}-%,01 02 03 04 05 06 07 08 09)

ifndef no-days
days:=$(shell for ym in ${yms}; do for dom in `seq 0 31`; do date --date="$${ym}-01 + $${dom} days" +%Y-%m-%d; done ; done | sort -u )
endif

endif

SHELL:=/bin/bash

# Filesystem
fs-root:=/home/quinn/calsimetaw
out:=${fs-root}/output

# Input Postgres DB
PG:=psql service=calsimetaw
PG-CSV:= ${PG} -A -F',' --pset footer
PG-LIST:=${PG} -A -R' ' -t 
PG-SITE:= ${PG} -A -F'|' -t

# Row splitting data
rows:=$(shell seq -f %03g 0 299)

v.in.ogr:=v.in.ogr -e dsn="PG:service=calsimetaw"

# Grass specific functions
define grass_or_die
$(if ifndef GISRC,$(error Must be running in GRASS))
endef

ifdef GISRC

GISDBASE:=$(shell g.gisenv get=GISDBASE)
LOCATION_NAME:=$(shell g.gisenv get=LOCATION_NAME)
MAPSET:=$(shell g.gisenv get=MAPSET)

# Shortcut Directories
loc:=$(GISDBASE)/$(LOCATION_NAME)

##############################################################################
# MASK defines
##############################################################################
define MASK
g.region rast=state@4km; r.mask -o input=MASK@4km
endef

define NOMASK
g.region rast=state@4km; r.mask -r
endef

endif

yms:
	@echo ${yms}
