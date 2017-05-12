#! /usr/bin/make -f

ifndef configure.mk
include configure.mk
endif

#include days.mk

#####################################################################
# Daily Mapset files
#####################################################################
tension:=10
zmult:=1
smooth:=0.05

#v.surf.rst:=v.surf.rst maskmap=state@4km tension=${tension} \
#            zmult=${zmult} smooth=${smooth}
v.surf.rst:=v.surf.rst --o tension=${tension} zmult=${zmult} smooth=${smooth}

.PHONY: delta

ncdc_name_Tx:=TMAX
ncdc_name_Tn:=TMIN
ncdc_name_PCP:=PRCP

define set_vect
g.remove vect=$1;\
g.region -d;g.region rast=state@4km; \
db.connect driver=sqlite database='$$$$GISDBASE/$$$$LOCATION_NAME/$$$$MAPSET/sqlite.db';
endef

INFO::
	echo ${days};


define ncdc

.PHONY: delta
delta::d$2
.PHONY: d$2
d$2:${loc}/$1/cellhd/d$2

${loc}/$1/vector/d$2:
	g.mapset $1;\
	$(call set_vect,d$2) \
	[[ -d ${loc}/$1/site_lists ]] || mkdir ${loc}/$1/site_lists; \
	${PG-SITE} -c "select st_x(centroid),st_y(centroid),'#'||station_id||' %'||dv from ncdc.station join ncdc.delta_weather_j using (station_id) where day='$1' and elem='$${ncdc_name_$2}'" > ${loc}/$1/site_lists/d$2;\
	v.in.sites input=d$2 output=d$2; \
	g.remove site=d$2

${loc}/$1/cellhd/d$2: ${loc}/$1/vector/d$2
	g.mapset $1; \
	${NOMASK}; \
	${v.surf.rst} input=d$2 zcolumn=flt1 elev=d$2 >/dev/null 2>/dev/null

endef

define mult-day
.PHONY: day
$2::${loc}/$1/cellhd/$2
day: ${loc}/$1/cellhd/$2

${loc}/$1/cellhd/$2: ${loc}/$1/cellhd/d$2 ${loc}/$(word 1,$(subst -,  ,$1))-$(word 2,$(subst -, ,$1))/cellhd/m$2
	g.mapset $1; ${NOMASK};\
	r.mapcalc '$2=if(d$2<0.0,0.0,d$2)*"m$2@$(word 1,$(subst -,  ,$1))-$(word 2,$(subst -, ,$1))"' >/dev/null 2>/dev/null

endef

define add-day
.PHONY: day
$2::${loc}/$1/cellhd/$2
day: ${loc}/$1/cellhd/$2

${loc}/$1/cellhd/$2: ${loc}/$1/cellhd/d$2 ${loc}/$(word 1,$(subst -,  ,$1))-$(word 2,$(subst -, ,$1))/cellhd/m$2
	g.mapset $1; ${NOMASK}; \
	r.mapcalc '$2=d$2+"m$2@$(word 1,$(subst -,  ,$1))-$(word 2,$(subst -, ,$1))"' >/dev/null 2>/dev/null

endef

define daily
.PHONY:csv TnTxPCPEToRF.csv
csv:: TnTxPCPEToRF.csv

TnTxPCPEToRF.csv:${loc}/$1/etc/TnTxPCPEToRF.csv
${loc}/$1/etc/TnTxPCPEToRF.csv: ${loc}/$1/cellhd/Tn ${loc}/$1/cellhd/Tx ${loc}/$1/cellhd/PCP ${loc}/$1/cellhd/ETo ${loc}/$1/cellhd/RF
	@[[ -d $$(dir $$@) ]]  || mkdir $$(dir $$@);\
	g.mapset $1;\
	g.region rast=state@4km;\
	r.mask -o input=MASK@4km >/dev/null 2>/dev/null; \
	date=`g.gisenv MAPSET`;\
	r.stats -1 -n -x Tn,Tx,PCP,ETo,RF 2>/dev/null | sed -e "s/^/$$$$date /" | tr ' ' ',' > $$@;\
	g.region -d;

.PHONY:Tm
Tm:${loc}/$1/cellhd/Tm
${loc}/$1/cellhd/Tm: ${loc}/$1/cellhd/Tx ${loc}/$1/cellhd/Tn
	g.mapset $1; ${NOMASK}; \
	r.mapcalc "Tm=(Tx+Tn)/2";

.PHONY:ETh
ETh:${loc}/$1/cellhd/ETh
${loc}/$1/cellhd/ETh: ${loc}/$1/cellhd/Tm ${loc}/$1/cellhd/Tx ${loc}/$1/cellhd/Tn ${loc}/$1/cellhd/Ra
	g.mapset $1; ${NOMASK};\
	r.mapcalc "ETh=if(Tx<Tn,0,0.408*(0.0023*Ra*(Tm+17.8))*(sqrt(Tx-Tn)))" 2>/dev/null;

.PHONY:ETo
ETo:${loc}/$1/cellhd/ETo
${loc}/$1/cellhd/ETo:${loc}/$1/cellhd/ETh
	g.mapset $1; ${NOMASK};\
	r.mapcalc "ETo=ETh*cfhs@4km" 2>/dev/null;\

.PHONY:RF
RF:${loc}/$1/cellhd/RF
${loc}/$1/cellhd/RF: ${loc}/$1/cellhd/ETo ${loc}/$1/cellhd/PCP
	g.mapset $1; ${NOMASK}; \
	r.mapcalc "RF=if(isnull(ETo),if(PCP>0,1,0),if(ETo>PCP,0,1))" >/dev/null 2>/dev/null;

endef


$(foreach d,${days},$(eval $(call daily,${d})) $(foreach p,Tx Tn PCP,$(eval $(call ncdc,${d},$(p)))) $(foreach p,PCP,$(eval $(call mult-day,${d},$(p)))) $(foreach p,Tx Tn,$(eval $(call add-day,${d},$(p)))))

${loc}/%/cellhd/srha:
	@g.mapset mapset=$*;\
	${NOMASK};\
	pi=3.14159265;\
	julian=`date --date="$*" +%j`;\
	jul_deg="(360*($$julian/365.0))";\
	dr="(1.0+0.033*cos($$jul_deg))";\
	declination="180.0/$$pi*0.409*sin($$jul_deg-79.64)";\
	r.mapcalc "srha=acos(-tan(latitude_deg@4km)*tan($$declination))";

${loc}/%/cellhd/Ra:${loc}/%/cellhd/srha
	@g.mapset mapset=$*;
	${NOMASK};\
	pi=3.14159265; Gsc=0.082; \
	julian=`date --date="$*" +%j`;\
	jul_deg="(360*($$julian/365.0))";\
	dr="(1.0+0.033*cos($$jul_deg))";\
	declination="180.0/$$pi*0.409*sin($$jul_deg-79.64)";\
	r.mapcalc "Ra=(24.0*60.0/$$pi)*$$Gsc*$$dr*((srha*$$pi/180.0)*sin($$declination)*sin(latitude_deg@4km)+cos(latitude_deg@4km)*cos($$declination)*sin(srha))";

.PHONY: Ra
Ra:: $(patsubst %,${loc}/%/cellhd/Ra,${days})
