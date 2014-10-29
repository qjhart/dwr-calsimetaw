#! /usr/bin/make -f

# This setup was for a multi-day setup.  I'm not sure that's the best
# idea, so some of this is going in the daily.mk file as well.  (one
# mapset only
#yr=1948; for d in `seq 0 3285`; do m=`date --date="${yr}-01-01 + $d days" --rfc-3339=date`; y=${m%%-*};  g.mapset location=$y mapset=$m; time ~/etosimetaw/bin/daily.mk ETo RF; done

ifndef configure.mk
include configure.mk
endif

#####################################################################
# Daily Mapset files
#####################################################################
tension:=10
zmult:=1
smooth:=0.05

#v.surf.rst:=v.surf.rst maskmap=state@4km tension=${tension} \
#            zmult=${zmult} smooth=${smooth}
v.surf.rst:=v.surf.rst tension=${tension} zmult=${zmult} smooth=${smooth}

.PHONY: delta

ncdc_name_Tx:=TMAX
ncdc_name_Tn:=TMIN
ncdc_name_PCP:=PRCP

define set_vect
g.remove vect=$1;\
g.region -d;g.region rast=state@4km; \
db.connect driver=sqlite database='$$$$GISDBASE/$$$$LOCATION_NAME/$$$$MAPSET/sqlite.db'; 
endef

define ncdc

.PHONY: $1
$1::${vect}/$1

${vect}/$1:
	${v.in.ogr} layer=ncdc.weather \
	where="day='${MAPSET}' and elem='$${ncdc_name_$1}' and m NOT IN ('E','M','S','(');" \
	output=$1 >/dev/null 2>/dev/null

.PHONY: delta
delta::$2d$1
.PHONY: $2d$1
d$1:${rast}/$2d$1

${vect}/$2d$1:
	$(call set_vect,$2d$1)
	[[ -d ${map}/site_lists ]] || mkdir ${map}/site_lists; \
	${PG-SITE} -c "select st_x(centroid),st_y(centroid),'#'||station_id||' %'||dv from ncdc.station join ncdc.delta_weather_$2 using (station_id) where day='${MAPSET}' and elem='$${ncdc_name_$1}'" > ${map}/site_lists/$2d$1;\
	v.in.sites input=$2d$1 output=$2d$1; \
	g.remove site=$2d$1

${rast}/$2d$1: ${vect}/$2d$1
	${NOMASK}; \
	${v.surf.rst} input=$2d$1 zcolumn=flt1 elev=$2d$1 >/dev/null 2>/dev/null

endef

define mult-day
.PHONY: day
$2$1::${rast}/$2$1
day: ${rast}/$2$1

${rast}/$2$1: ${rast}/$2d$1 ${monthly-rast}/m$1
	${NOMASK};
	r.mapcalc '$2$1=if($2d$1<0.0,0.0,$2d$1)*"m$1@${monthly-mapset}"' >/dev/null 2>/dev/null

endef

define add-day
.PHONY: day
$2$1::${rast}/$2$1
day: ${rast}/$2$1

${rast}/$2$1: ${rast}/$2d$1 ${monthly-rast}/m$1
	${NOMASK}; \
	r.mapcalc '$2$1=$2d$1+"m$1@${monthly-mapset}"' >/dev/null 2>/dev/null

endef

define solr

.PHONY:sretr
sretr:${rast}/srha
${rast}/srha:
	@${NOMASK};\
	pi=3.14159265;\
	julian=`date --date="${MAPSET}" +%j`;\
	jul_deg="(360*($$$$julian/365.0))";\
	dr="(1.0+0.033*cos($$$$jul_deg))";\
	declination="180.0/$$$$pi*0.409*sin($$$$jul_deg-79.64)";\
	r.mapcalc "srha=acos(-tan(latitude_deg@4km)*tan($$$$declination))"; 

.PHONY:Ra
Ra:${rast}/Ra
${rast}/Ra:${rast}/srha
	@${NOMASK};\
	pi=3.14159265; Gsc=0.082; \
	julian=`date --date="${MAPSET}" +%j`;\
	jul_deg="(360*($$$$julian/365.0))";\
	dr="(1.0+0.033*cos($$$$jul_deg))";\
	declination="180.0/$$$$pi*0.409*sin($$$$jul_deg-79.64)";\
	r.mapcalc "Ra=(24.0*60.0/$$$$pi)*$$$$Gsc*$$$$dr*((srha*$$$$pi/180.0)*sin($$$$declination)*sin(latitude_deg@4km)+cos(latitude_deg@4km)*cos($$$$declination)*sin(srha))";
endef

define daily 
.PHONY:csv $1TnTxPCPEToRF.csv
csv:: $1TnTxPCPEToRF.csv

$1TnTxPCPEToRF.csv:${etc}/$1TnTxPCPEToRF.csv
${etc}/$1TnTxPCPEToRF.csv: ${rast}/$1Tn ${rast}/$1Tx ${rast}/$1PCP ${rast}/$1ETo ${rast}/$1RF
	@[[ -d $$(dir $$@) ]]  || mkdir $$(dir $$@);\
	g.region rast=state@4km;\
	r.mask -o input=MASK@4km >/dev/null 2>/dev/null; \
	date=`g.gisenv MAPSET`;\
	r.stats -1 -n -x $1Tn,$1Tx,$1PCP,$1ETo,$1RF 2>/dev/null | sed -e "s/^/$$$$date /" | tr ' ' ',' > $$@;\
	g.region -d;

.PHONY:$1Tm
$1Tm:$(rast)/$1Tm
$(rast)/$1Tm: $(rast)/$1Tx $(rast)/$1Tn
	@${NOMASK}; \
	r.mapcalc "$1Tm=($1Tx+$1Tn)/2";

.PHONY:$1ETh
$1ETh:$(rast)/$1ETh
$(rast)/$1ETh: $(rast)/$1Tm $(rast)/$1Tx $(rast)/$1Tn $(rast)/Ra
	@${NOMASK};\
	r.mapcalc "$1ETh=if($1Tx<$1Tn,0,0.408*(0.0023*Ra*($1Tm+17.8))*(sqrt($1Tx-$1Tn)))" 2>/dev/null;

.PHONY:$1ETo
$1ETo:$(rast)/$1ETo
$(rast)/$1ETo:$(rast)/$1ETh 
	@${NOMASK};\
	r.mapcalc "$1ETo=$1ETh*cfhs@4km" 2>/dev/null;\

.PHONY:$1RF
$1RF:$(rast)/$1RF
$(rast)/$1RF: $(rast)/$1ETo $(rast)/$1PCP
	@${NOMASK}; \
	r.mapcalc "$1RF=if(isnull($1ETo),if($1PCP>0,1,0),if($1ETo>$1PCP,0,1))" >/dev/null 2>/dev/null;

endef

ifdef is_daily

$(eval $(call solr))
$(foreach t,a p j,$(eval $(call daily,$(t))) $(foreach p,Tx Tn PCP,$(eval $(call ncdc,$(p),${t}))) $(foreach p,PCP,$(eval $(call mult-day,$(p),${t}))) $(foreach p,Tx Tn,$(eval $(call add-day,$(p),${t}))))
endif


