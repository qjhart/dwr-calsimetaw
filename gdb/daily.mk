#! /usr/bin/make -f
#ifndef configure.mk
#include ../configure.mk
#endif
SHELL:=/bin/bash

# Grass specific functions
ifndef GISRC
$(error Must be running in GRASS)
endif

#type:=stable
#type:=provisional
type:=$(shell g.gisenv LOCATION_NAME |  cut -f2 -d-)

kind.stable:=recent
kind.provisional:=6months

base:=https://prism.oregonstate.edu/fetchData.php?type=bil&kind=${kind.${type}}&range=daily

GISDBASE:=$(shell g.gisenv get=GISDBASE)
LOCATION_NAME:=$(shell g.gisenv get=LOCATION_NAME)
mapset:=$(shell g.gisenv MAPSET)
year:=$(shell echo ${mapset} | cut -b1-4)
el:=$(shell echo ${mapset} | cut -b5-8)

url.stable:=${base}&temporal=${mapset}
url.provisional:=${base}&temporal=${el}&year=${year}

rast:=${GISDBASE}/${LOCATION_NAME}/${mapset}/cellhd
ptt:=ppt tmin tmax
pttr:=$(patsubst %,${rast}/%,${ptt})

.PHONY:def

def:ETo rf

INFO:
	echo ptt:${ptt}
	echo pttr:${pttr}

.PHONY:${ptt}

${ptt}:%:${rast}/%

${pttr}:${rast}/%:
	f=`mktemp -d --tmpdir=/tmp/`; \
	echo $f; \
	curl '${url.${type}}&elem=$*' > $$f/$*.zip; \
	cd $$f; \
	unzip $*.zip; \
	if [[ -f PRISM_$*_${type}_4kmD1_${mapset}_bil.bil ]]; then \
	  r.in.gdal input=PRISM_$*_${type}_4kmD1_${mapset}_bil.bil output=$*; \
	else \
	  r.in.gdal input=PRISM_$*_${type}_4kmD2_${mapset}_bil.bil output=$*; \
	fi; \
	cd; rm -rf $$f;

# Reproject for CSTARS
# for d in `seq 0 365`; do date=`date --date="2013-01-01 + $d days" +%Y%m%d`; g.mapset -c $date; g.region rast=state@4km; for r in tmin tmax ppt; do r.proj input=$r location=prism-daily; done; done

is_daily:=MAPSET

ifdef is_daily

.PHONY:srha
srha:${rast}/srha
${rast}/srha:
	pi=3.14159265;\
	julian=`date --date="${MAPSET}" +%j`;\
	jul_deg="(360*($$julian/365.0))";\
	dr="(1.0+0.033*cos($$jul_deg))";\
	declination="360.0/$$pi*0.409*sin($$jul_deg-79.64)";\
	r.mapcalc "srha=acos(-tan(latitude_deg@4km)*tan($$declination))";

.PHONY:Ra
Ra:${rast}/Ra
${rast}/Ra:${rast}/srha
	pi=3.14159265; Gsc=0.082; \
	julian=`date --date="${MAPSET}" +%j`;\
	jul_rad="(360*($$julian/365.0))";\
	dr="(1.0+0.033*cos($$jul_rad))";\
	declination="360.0/$$pi*0.409*sin($$jul_rad-79.64)";\
	r.mapcalc "Ra=(24.0*60.0/$$pi)*$$Gsc*$$dr*((srha*$$pi/180.0)*sin($$declination)*sin(latitude_deg@4km*$$pi/180.0)+cos(latitude_deg@4km*$$pi/180.0)*cos($$declination)*sin(srha))";\

.PHONY:Tm
Tm:$(rast)/Tm
$(rast)/Tm: $(rast)/tmin $(rast)/tmax
	r.mapcalc "Tm=(tmin+tmax)/2";

.PHONY:ETh
ETh:$(rast)/ETh
$(rast)/ETh: $(rast)/Tm $(rast)/tmax $(rast)/tmin $(rast)/Ra
	@r.mapcalc "ETh=if(tmax<tmin,0,0.408*(0.0023*Ra*(Tm+17.8))*(sqrt(tmax-tmin)))"

.PHONY:ETo
ETo:$(rast)/ETo
$(rast)/ETo:$(rast)/ETh
	@r.mapcalc "ETo=ETh*cfhs@4km" 2>/dev/null;\

.PHONY:rf
rf:$(rast)/rf
$(rast)/rf:$(rast)/ETo $(rast)/ppt
	@r.mapcalc "rf=if(ppt>ETo,1,0)" 2>/dev/null;\

endif
