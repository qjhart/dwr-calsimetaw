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

${loc}/%/etc/aTnTxPCPEToRF.csv:
	g.mapset $*;\
	g.region rast=state@4km; \
	db.connect driver=sqlite;\
	g.remove vect=adTn;
	[[ -d ${loc}/$*/site_lists ]] || mkdir ${loc}/$*/site_lists; \
	${PG-SITE} -c "select st_x(centroid),st_y(centroid),'#'||station_id||' %'||dv from ncdc.station join ncdc.delta_weather_a using (station_id) where day='$*' and elem='TMIN'" > ${loc}/$*/site_lists/adTn;\
	v.in.sites input=adTn output=adTn; \
	${v.surf.rst} input=adTn zcolumn=flt1 elev=adTn;\
	r.mapcalc 'aTn=adTn+"mTn@$(word 1,$(subst -,  ,$*))-$(word 2,$(subst -, ,$*))"';\
	g.remove site=adTn;\
	g.remove vect=adTx;\
	${PG-SITE} -c "select st_x(centroid),st_y(centroid),'#'||station_id||' %'||dv from ncdc.station join ncdc.delta_weather_a using (station_id) where day='$*' and elem='TMAX'" > ${loc}/$*/site_lists/adTx;\
	v.in.sites input=adTx output=adTx; \
	${v.surf.rst} input=adTx zcolumn=flt1 elev=adTx;\
	r.mapcalc 'aTx=adTx+"mTx@$(word 1,$(subst -,  ,$*))-$(word 2,$(subst -, ,$*))"';\
	g.remove site=adTx;\
	g.remove vect=adPCP;\
	${PG-SITE} -c "select st_x(centroid),st_y(centroid),'#'||station_id||' %'||dv from ncdc.station join ncdc.delta_weather_a using (station_id) where day='$*' and elem='PRCP'" > ${loc}/$*/site_lists/adPCP;\
	v.in.sites input=adPCP output=adPCP; \
	${v.surf.rst} input=adPCP zcolumn=flt1 elev=adPCP;\
	g.remove site=adPCP;\
	r.mapcalc 'aPCP=if(adPCP<0.0,0.0,adPCP)*"mPCP@$(word 1,$(subst -,  ,$*))-$(word 2,$(subst -, ,$*))"';
	r.mapcalc "aTm=(aTx+aTn)/2";
	r.mapcalc "aETh=if(aTx<aTn,0,0.408*(0.0023*Ra*(aTm+17.8))*(sqrt(aTx-aTn)))" 2>/dev/null;
	r.mapcalc "aETo=aETh*cfhs@4km" 2>/dev/null;\
	r.mapcalc "aRF=if(isnull(aETo),if(aPCP>0,1,0),if(aETo>aPCP,0,1))" >/dev/null 2>/dev/null;
	[[ -d ${loc}/$*/etc ]]  || mkdir ${loc}/$*/etc;\
	r.mask -o input=MASK@4km >/dev/null 2>/dev/null; \
	date=`g.gisenv MAPSET`;\
	r.stats -1 -n -x aTn,aTx,aPCP,aETo,aRF 2>/dev/null | sed -e "s/^/$* /" | tr ' ' ',' > ${loc}/$*/etc/aTnTxPCPEToRF.csv;


${loc}/%/etc/jTnTxPCPEToRF.csv:
	g.mapset $*;\
	g.region rast=state@4km; \
	db.connect driver=sqlite;\
	r.mask -r; \
	g.remove vect=jdTn;\
	[[ -d ${loc}/$*/site_lists ]] || mkdir ${loc}/$*/site_lists; \
	${PG-SITE} -c "select st_x(centroid),st_y(centroid),'#'||station_id||' %'||dv from ncdc.station join ncdc.delta_weather_j using (station_id) where day='$*' and elem='TMIN'" > ${loc}/$*/site_lists/jdTn;\
	v.in.sites input=jdTn output=jdTn; \
	${v.surf.rst} input=jdTn zcolumn=flt1 elev=jdTn;\
	r.mapcalc 'jTn=jdTn+"mTn@$(word 1,$(subst -,  ,$*))-$(word 2,$(subst -, ,$*))"';\
	g.remove site=jdTn;
	g.remove vect=jdTx;\
	${PG-SITE} -c "select st_x(centroid),st_y(centroid),'#'||station_id||' %'||dv from ncdc.station join ncdc.delta_weather_j using (station_id) where day='$*' and elem='TMAX'" > ${loc}/$*/site_lists/jdTx;\
	v.in.sites input=jdTx output=jdTx; \
	${v.surf.rst} input=jdTx zcolumn=flt1 elev=jdTx;\
	r.mapcalc 'jTx=jdTx+"mTx@$(word 1,$(subst -,  ,$*))-$(word 2,$(subst -, ,$*))"';\
	g.remove site=jdTx;\
	g.remove vect=jdPCP;\
	${PG-SITE} -c "select st_x(centroid),st_y(centroid),'#'||station_id||' %'||dv from ncdc.station join ncdc.delta_weather_j using (station_id) where day='$*' and elem='PRCP'" > ${loc}/$*/site_lists/jdPCP;\
	v.in.sites input=jdPCP output=jdPCP; \
	${v.surf.rst} input=jdPCP zcolumn=flt1 elev=jdPCP;\
	g.remove site=jdPCP;\
	r.mapcalc 'jPCP=if(jdPCP<0.0,0.0,jdPCP)*"mPCP@$(word 1,$(subst -,  ,$*))-$(word 2,$(subst -, ,$*))"';
	r.mapcalc "jTm=(jTx+jTn)/2";
	r.mapcalc "jETh=if(jTx<jTn,0,0.408*(0.0023*Ra*(jTm+17.8))*(sqrt(jTx-jTn)))" 2>/dev/null;
	r.mapcalc "jETo=jETh*cfhs@4km" 2>/dev/null;\
	r.mapcalc "jRF=if(isnull(jETo),if(jPCP>0,1,0),if(jETo>jPCP,0,1))" >/dev/null 2>/dev/null;
	[[ -d ${loc}/$*/etc ]]  || mkdir ${loc}/$*/etc;\
	r.mask -o input=MASK@4km >/dev/null 2>/dev/null; \
	date=`g.gisenv MAPSET`;\
	r.stats -1 -n -x jTn,jTx,jPCP,jETo,jRF 2>/dev/null | sed -e "s/^/$* /" | tr ' ' ',' > ${loc}/$*/etc/jTnTxPCPEToRF.csv;


${loc}/%/cellhd/Ra:
	@g.mapset mapset=$*;\
	${NOMASK};\
	pi=3.14159265; Gsc=0.082; \
	julian=`date --date="$*" +%j`;\
	jul_deg="(360*($$julian/365.0))";\
	dr="(1.0+0.033*cos($$jul_deg))";\
	declination="180.0/$$pi*0.409*sin($$jul_deg-79.64)";\
	r.mapcalc "srha=acos(-tan(latitude_deg@4km)*tan($$declination))"; 
	r.mapcalc "Ra=(24.0*60.0/$$pi)*$$Gsc*$$dr*((srha*$$pi/180.0)*sin($$declination)*sin(latitude_deg@4km)+cos(latitude_deg@4km)*cos($$declination)*sin(srha))";


.PHONY: Ra
Ra:: $(patsubst %,${loc}/%/cellhd/Ra,${days})

.PHONY: acsv
acsv:: $(patsubst %,${loc}/%/etc/aTnTxPCPEToRF.csv,${days})

.PHONY: jcsv
jcsv:: $(patsubst %,${loc}/%/etc/jTnTxPCPEToRF.csv,${days})
