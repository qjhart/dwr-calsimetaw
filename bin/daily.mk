#! /usr/bin/make -f

ifndef configure.mk
include configure.mk
endif

include days.mk

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

INFO::
	echo ${days};


define ncdc

.PHONY: delta
delta::$3d$2
.PHONY: $3d$2
d$2:${loc}/$1/cellhd/$3d$2

${loc}/$1/vector/$3d$2:
	g.mapset $1;\
	$(call set_vect,$3d$2) \
	[[ -d ${loc}/$1/site_lists ]] || mkdir ${loc}/$1/site_lists; \
	${PG-SITE} -c "select st_x(centroid),st_y(centroid),'#'||station_id||' %'||dv from ncdc.station join ncdc.delta_weather_$3 using (station_id) where day='$1' and elem='$${ncdc_name_$2}'" > ${loc}/$1/site_lists/$3d$2;\
	v.in.sites input=$3d$2 output=$3d$2; \
	g.remove site=$3d$2

${loc}/$1/cellhd/$3d$2: ${loc}/$1/vector/$3d$2
	g.mapset $1; \
	${NOMASK}; \
	${v.surf.rst} input=$3d$2 zcolumn=flt1 elev=$3d$2 >/dev/null 2>/dev/null

endef

define mult-day
.PHONY: day
$3$2::${loc}/$1/cellhd/$3$2
day: ${loc}/$1/cellhd/$3$2

${loc}/$1/cellhd/$3$2: ${loc}/$1/cellhd/$3d$2 ${loc}/$(word 1,$(subst -,  ,$1))-$(word 2,$(subst -, ,$1))/cellhd/m$2
	g.mapset $1; ${NOMASK};\
	r.mapcalc '$3$2=if($3d$2<0.0,0.0,$3d$2)*"m$2@$(word 1,$(subst -,  ,$1))-$(word 2,$(subst -, ,$1))"' >/dev/null 2>/dev/null

endef

define add-day
.PHONY: day
$3$2::${loc}/$1/cellhd/$3$2
day: ${loc}/$1/cellhd/$3$2

${loc}/$1/cellhd/$3$2: ${loc}/$1/cellhd/$3d$2 ${loc}/$(word 1,$(subst -,  ,$1))-$(word 2,$(subst -, ,$1))/cellhd/m$2
	g.mapset $1; ${NOMASK}; \
	r.mapcalc '$3$2=$3d$2+"m$2@$(word 1,$(subst -,  ,$1))-$(word 2,$(subst -, ,$1))"' >/dev/null 2>/dev/null

endef

define daily 
.PHONY:csv $2TnTxPCPEToRF.csv
csv:: $2TnTxPCPEToRF.csv

$2TnTxPCPEToRF.csv:${loc}/$1/etc/$2TnTxPCPEToRF.csv
${loc}/$1/etc/$2TnTxPCPEToRF.csv: ${loc}/$1/cellhd/$2Tn ${loc}/$1/cellhd/$2Tx ${loc}/$1/cellhd/$2PCP ${loc}/$1/cellhd/$2ETo ${loc}/$1/cellhd/$2RF
	@[[ -d $$(dir $$@) ]]  || mkdir $$(dir $$@);\
	g.mapset $1;\
	g.region rast=state@4km;\
	r.mask -o input=MASK@4km >/dev/null 2>/dev/null; \
	date=`g.gisenv MAPSET`;\
	r.stats -1 -n -x $2Tn,$2Tx,$2PCP,$2ETo,$2RF 2>/dev/null | sed -e "s/^/$$$$date /" | tr ' ' ',' > $$@;\
	g.region -d;

.PHONY:$2Tm
$2Tm:${loc}/$1/cellhd/$2Tm
${loc}/$1/cellhd/$2Tm: ${loc}/$1/cellhd/$2Tx ${loc}/$1/cellhd/$2Tn
	g.mapset $1; ${NOMASK}; \
	r.mapcalc "$2Tm=($2Tx+$2Tn)/2";

.PHONY:$2ETh
$2ETh:${loc}/$1/cellhd/$2ETh
${loc}/$1/cellhd/$2ETh: ${loc}/$1/cellhd/$2Tm ${loc}/$1/cellhd/$2Tx ${loc}/$1/cellhd/$2Tn ${loc}/$1/cellhd/Ra
	g.mapset $1; ${NOMASK};\
	r.mapcalc "$2ETh=if($2Tx<$2Tn,0,0.408*(0.0023*Ra*($2Tm+17.8))*(sqrt($2Tx-$2Tn)))" 2>/dev/null;

.PHONY:$2ETo
$2ETo:${loc}/$1/cellhd/$2ETo
${loc}/$1/cellhd/$2ETo:${loc}/$1/cellhd/$2ETh 
	g.mapset $1; ${NOMASK};\
	r.mapcalc "$2ETo=$2ETh*cfhs@4km" 2>/dev/null;\

.PHONY:$2RF
$2RF:${loc}/$1/cellhd/$2RF
${loc}/$1/cellhd/$2RF: ${loc}/$1/cellhd/$2ETo ${loc}/$1/cellhd/$2PCP
	g.mapset $1; ${NOMASK}; \
	r.mapcalc "$2RF=if(isnull($2ETo),if($2PCP>0,1,0),if($2ETo>$2PCP,0,1))" >/dev/null 2>/dev/null;

endef


$(foreach d,${days},$(foreach t,a j,$(eval $(call daily,${d},$(t))) $(foreach p,Tx Tn PCP,$(eval $(call ncdc,${d},$(p),${t}))) $(foreach p,PCP,$(eval $(call mult-day,${d},$(p),${t}))) $(foreach p,Tx Tn,$(eval $(call add-day,${d},$(p),${t})))))

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
