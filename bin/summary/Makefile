#! /usr/bin/make -f 

INC:=/home/quinn/etosimetaw/bin
ifndef configure.mk
include ${INC}/configure.mk
endif

schema:=summary

daily-rowtables:=$(patsubst %,${db}/${schema}.daily%,${rows})
dailyM-rowtables:=$(patsubst %,${db}/${schema}.dailyM%,${rows})
daily-rowtables-data:=$(patsubst %,${db}/${schema}.daily%.data,${rows})


db:: ${db}/${schema}.dailyM

${db}/${schema}:${db}/%:
	${PG} -f schema.sql
	touch $@

${db}/${schema}.dailyM:${db}/${schema}.dailyM_only ${dailyM-rowtables}
	touch $@

${db}/${schema}.dailyM_only:${db}/${schema}
	${PG} -f dailyM.sql
	touch $@

${dailyM-rowtables}:${db}/${schema}.dailyM%:${db}/${schema}
	${PG} --variable=r=$* -f add_dailyM.sql
	touch $@

.PHONY:data
data::${daily-rowtables-data}
daily-rowtables-data:${daily-rowtables-data}
${daily-rowtables-data}:${db}/${schema}.daily%.data:${db}/${schema}.dailyM_only
	${PG} --variable=r=$* -f add_daily_data.sql
	touch $@

cimisM-rowtables:=$(patsubst %,${db}/${schema}.cimisM%,${rows})
cimis-rowtables-data:=$(patsubst %,${db}/${schema}.cimisM%.data,${rows})

db:: ${db}/${schema}.cimisM

${db}/${schema}.cimisM:${db}/${schema}.cimisM_only ${cimisM-rowtables}
	touch $@

${db}/${schema}.cimisM_only:${db}/${schema}
	${PG} -f cimisM.sql
	touch $@

${cimisM-rowtables}:${db}/${schema}.cimisM%:${db}/${schema}
	${PG} --variable=r=$* -f add_cimisM.sql
	touch $@

.PHONY:data
data::${cimis-rowtables-data}
cimis-rowtables-data:${cimis-rowtables-data}
${cimis-rowtables-data}:${db}/${schema}.cimisM%.data:${db}/${schema}.cimisM_only
	${PG} --variable=r=$* -f add_cimis_data.sql
	touch $@

data::${db}/summary.eto_yearly_seasonal_sum

eto_calcs:=$(patsubst %,${db}/summary.eto_yearly_seasonal_sum.%,${rows})
${db}/summary.eto_yearly_seasonal_sum:${eto_calcs}
${eto_calcs}:${db}/summary.eto_yearly_seasonal_sum.%:
	${PG} -c 'insert into summary.eto_yearly_seasonal_sum select * from summary.eto_yearly_seasonal_sum_row($*);'
	touch $@


#
# Now these data need to go back in grass (mapset=4km) so we can visualize them
#

PHONY:png
define png
png::eto_$1_$2.png
eto_$1_$2.png:%.png:
	export GRASS_WIDTH=1104; export GRASS_HEIGHT=1000;\
	export GRASS_TRUECOLOR=TRUE; \
	export GRASS_PNGFILE=$$@;\
	d.mon start=PNG; \
	g.region rast=state@4km; \
	${PG} -t -c "select east,north,s.$1 from summary.eto_seasonal_sum s join daily4km.pixels using (x,y) where season='$2' order by east,north" |\
	r.in.xyz input="-" output="$$*" method="mean" type="FCELL"\
	fs="|" x=1 y=2 z=3 zscale=1.0 percent=100;\
	r.colors map=$$* rules=eto.rules;\
	d.rast $$*; \
	d.legend map=$$* at=0,50,0,8 range=100,1900 labelnum=7;\
	d.mon stop=PNG;
endef

season:=YR JFM AMJ JAS OND

$(foreach v,cimis daily_season daily_single,$(foreach s,${season},$(eval $(call png,$v,$s))))