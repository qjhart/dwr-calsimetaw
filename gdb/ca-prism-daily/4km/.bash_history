g.list rast
make -f 4km.mk db/4km.cfhs -n
make -f 4km.mk db/4km.cfhs 
g.list rast 
g.region rast=state
g.region -p
r.stats --help
r.stats -1 -x -g state | less
r.stats -1 -x -g state | head
r.stats -1 -x -g state | head -13
cdm
g.list 
g.list rast
g.mapset 1987-10
g.gisenv
g.list rast
make -f mapsets.mk info -n
make -f mapsets.mk years -n
make -f mapsets.mk years 
pwd
cdm
cd ..
;ls
ls
cd ..
ls
cd gdb/
ls
cd etosimetaw/
ls
ls 1997
ls -l 1997
for y in `seq 1920 2007`; do if [[ -d ${y} ]] ; then echo $Y is DONE ; else echo $y is NOT done; fi; done
for y in `seq 1920 2007`; do if [[ -d ${y} ]] ; then echo $y is DONE ; else echo $y is NOT done; fi; done
make -f ~/etosimetaw/bin/mapsets.mk info -n
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk info -n
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n
g.mapset -c mapset=1996
ls
ls 1996
ls 1997
ls
ls 4km/VAR 
cat 4km/VAR 
cat 2km/VAR 
ls -l */VAR
cat PERMANENT/VAR
ls */cellhd
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n
rm -rf 1996
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets 
g.mapset 4km
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets 
g.mapset location=1920 mapset=4km
ls 1920
g.gisenv
g.mapset gisdbase=/home/quinn/gdb/etosimetaw location=1920 mapset=4km
g.list rast
cd ../gdb
ls
cd ..
ls
cd ~/gdb/etosimetaw/

ls -l 1997
ls -l 1997-12
ls -l 1997/1997-12
cat 1997/1997-12/VAR
ls
ls 1997
ls 1997/1997-01
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n
g.gisenv
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n
g.gisenv
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n
g.list rast
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n
ls -l /home/quinn/gdb/etosimetaw/2007/2007-12
cd ~/gdb/etosimetaw/
ls
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk info -n
g.gisenv
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk info -n
ls 2007
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n
cat /home/quinn/gdb/etosimetaw/2km/
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets
g.region -d
g.list rast
g.mapset -c gisdbase=/home/quinn/gdb/etosimetaw location=1920 mapset=1920-10
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets
ls
ls 1920
ls 1921
cd 1920
ls
rm -rf 1920-10-??
ls
cd ..
g.gisenv
g.mapset gisbase=/home/quinn/gdb location=etosimetaw mapset=4km
cd ~/gdb/etosimetaw/
ls
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n | head -2
g.mapset -c gisdbase=/home/quinn/gdb/etosimetaw location=1920 mapset=1920-11
g.region -d
g.mapset -c gisdbase=/home/quinn/gdb/etosimetaw location=1920 mapset=1920-11
g.mapset -c gisdbase=/home/quinn/gdb/etosimetaw location=1920 mapset=1920-12
g.region -p
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n | head -2
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n 
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n | head
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk info 
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk info | less
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk info 2>&1 | less
g.gisenv
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk info 2>&1 | less
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets 
g.gisenv 
ls
g.mapset -c gisdbase=/home/quinn/gdb/etosimetaw location=1921 mapset=1921-01
g.region -d
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets 
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets 
ls 1922
ls 1922/1922-03
ls 1922/1922-01
cd 1920
ls
ls 1920-12
cd ../1921
ls
ls 1921-01
ls 1921-*
cd ../1922
ls
ls 1992-01
ls
ls -l
ls 1922-01
rmdir 1922-01
rmdir 1922-02
rmdir 1922-03
g.gisenv
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets -n | head -3
g.mapset -c gisdbase=/home/quinn/gdb/etosimetaw location=1922 mapset=1922-01
g.mapset -c gisdbase=/home/quinn/gdb/etosimetaw location=1922 mapset=4km
g.mapset -c gisdbase=/home/quinn/gdb/etosimetaw location=1922 mapset=1922-01
make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/mapsets.mk mapsets 
g.gisenv
g.list rast
/home/quinn/gdb/etosimetaw
cd ..
ls
for y in ????; do for ym in (cd $y; echo $y-??); do echo g.mapset location=${y} mapset=${m}; done; done
for y in ????; do for ym in $(cd $y; echo $y-??); do echo g.mapset location=${y} mapset=${m}; done; done
for y in ????; do for ym in $(cd $y; echo $y-??); do echo g.mapset location=${y} mapset=${ym}; done; done
for y in ????; do for ym in $(cd $y; echo $y-??); do g.mapset location=${y} mapset=${ym};  done; done
for y in 2007; do for ym in $(cd $y; echo $y-??); do g.mapset location=${y} mapset=${ym}; make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/prism.mk prism -n  done; done
for y in 2007; do for ym in $(cd $y; echo $y-??); do g.mapset location=${y} mapset=${ym}; make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/prism.mk prism -n;  done; done
for y in 1920; do for ym in $(cd $y; echo $y-??); do g.mapset location=${y} mapset=${ym}; make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/prism.mk prism -n;  done; done
for y in 1920; do for ym in $(cd $y; echo $y-??); do g.mapset location=${y} mapset=${ym}; make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/prism.mk prism;  done; done
g.list rast
g.list rast | cat -
r.info mPCP
g.mapset location=2007 mapset=2007-01
g.list bast
g.list rast
r.info mPCP
r.info NRF
for y in ????; do for ym in $(cd $y; echo $y-??); do g.mapset location=${y} mapset=${ym}; make -I ~/etosimetaw/bin -f ~/etosimetaw/bin/prism.mk prism;  done; done
cd ~/etosimetaw/bin
ls
cd ..
ls
cd data
ls
cd ..
ls
cd ..
g.list rast
r.out.xyz --help
r.out.xyz input=state output=state.4km
ls -lrt
less state.4km 
r.in.xyz ==help
less state.4km 
cd 
ls -lrt
mv dylan.xyz\; dylan.xyz
less dylan.xyz 
cd 
g.list rast
r.in.xyz --help
r.in.xyz input=~/dylan.xyz output=dylan -s
r.in.xyz -s input=~/dylan.xyz output=dylan
emacs -nw dylan.xyz 
r.in.xyz -s input=~/dylan.xyz output=dylan
emacs -nw dylan.xyz 
r.in.xyz -s input=~/dylan.xyz output=dylan
g.region -p
g.region rast=state@4km
g.region -p
g.region n=454000
g.region -p
r.in.xyz input=~/dylan.xyz output=dylan
r.stats --help
r.stats -1 input=state,dylan 
r.stats -1 input=state,dylan  | less
r.stats -1 input=state,dylan  | grep '*'
r.stats -1 input=state,dylan  | grep '*' | wc -l
r.stats -1 input=state,dylan  | wc -l
g.region -r
g.region -p
emacs -nw dylan.xyz 
rm ~/dylan.xyz
rm ~/dylan.xyz\;
rm ~/dylan.xyz~ 
emacs -nw dylan.xyz 
g.remove dylan
r.in.xyz input=~/dylan.xyz output=dylan.composite
r.stats -1 input=state,dylan  | wc -l
r.stats -1 input=state,dylan.composite  | wc -l
r.stats -1 input=state,dylan.composite  | less
r.stats -1 input=state,dylan.composite  | grep '* 1'
r.stats -1 input=state,dylan.composite  | grep '* 1' | wc -l
g.list rast
g.rename state,cimis.state
r.stats --help
r.stats -1 -x -n dylan.composite
r.stats -1 -x -n dylan.composite cimis.state | less
r.stats -1 -x -n input=dylan.composite,cimis.state | less
r.stats -1 -x  input=dylan.composite,cimis.state 
r.stats --help
g.list rast
g.rename cimis.state,original_cimis_mask
g.copy dylan.composite,state
g.list rast
r.info cfhs
g.region rast=state
g.region -p
cd bin
ls -lrt
make db -n
make -f 4km.mk db -n
make -f 4km.mk db
r.info longitude
r.stats -1 -x -n -g longitude_deg@4km,latitude_deg@4km | less
r.stats -1 -x -n -g state | less
r.stats -1 -x -n -g | less
rm db/4km.pixels 
rm db/4km.cfhs 
r.stats -1 -x -n -g state@4km | less
r.stats -1 -x -n -g state@4km | sed -e 's/ 1$//' | less
make -f 4km.mk db
rm db/4km
make -f 4km.mk db
rm db/4km
make -f 4km.mk db
cdm
cd ~/gdb/
ls
cd etosimetaw/
ls
cd ~/etosimetaw/bin
ls
./doit-month 1987-2007
./doit-month 1987 2007
g.gisenv
g.list rast
make -f 4km.mk prism -n
make -f 4km.mk prism
./doit-month 1997 2007
g.list rast
make -f 4km.mk prism
./doit-month 1997 2007
g.list rast
g.region rast=state@4km
r.stats -1 NRF
r.stats -1 NRF | wc -l
r.stats -1 -N NRF | wc -l
r.stats -1 -N mTz | wc -l
r.stats -1 -N mTx | wc -l
g.gisenv 
g.mapset location=1987 mapset=1987-10
g.list rast
g.mapset location=1996 mapset=1996-10
g.list rast
g.gisenv
g.mapset location=1997 mapset=1997-10
r.stats -1 -N mTx | wc -l
r.stats -1 -N state@4km | wc -l
g.gisenv
g.list rast
r.stats -1 -N NRF | wc -l
r.info NRF
r.stats -1  NRF | wc -l
r.stats -1 -N state@4km | wc -l
r.stats -1 -N RF@1997-10-01 | wc -l
g.gisenv
g.list rast
r.stats -1 -N Tx@1997-10-01 | wc -l
r.stats -1 -N cimis@4km | wc -l
g.list type=rast mapset=4km
r.stats -1 -N original_cimis_mask@4km | wc -l
ls -lrt
g.gisenv
g.mapset 1997-10-01
g.list rast
g.mapset mapset=2007-01-01 location=2007
g.list rast
less doit-day 
g.gisenv
g.mapset mapset=1997-10-01 location=1997
g.list rast
r.stats -1 dPCP | wc -l
r.stats -1 -N dPCP | wc -l
r.info dPCP
g.gisenv
g.mapset mapset=2km location=etosimetaw GISDBASE=/home/quinn/gdb
g.mapset mapset=2km location=etosimetaw gisdbase=/home/quinn/gdb
g.list rasat
g.list rast
g.rename state,orginal_cimis_mask;
r.stats latitude_deg;
r.stats -1 latitude_deg | wc -l
r.stats -1 -N latitude_deg | wc -l
r.info latitude_deg
g.region rast=latitude_deg;
r.info latitude_deg
r.stats -1 -N latitude_deg | wc -l
g.gisenv
g.region rast=state@4km;
g.copy state@4km,state
g.region rast=state@4km;
g.region res=2000
g.region -p
g.copy state@4km,state
g.remove state
g.copy state@4km,state
r.info state;
g.remove rast
g.remove state
r.mapcalc state='if(state@4km)'
r.info state
r.info latitude;
r.info latitude_deg;
g.gisenv
g.gisenv mapset=1997-10-01 location=/home/quinn/gdb/etosimetaw
g.gisenv mapset=1997-10-01 location=1997 gisbase=/home/quinn/gdb/etosimetaw
g.gisenv mapset=1997-10-01 location=1997 gisdbase=/home/quinn/gdb/etosimetaw
g.mapset mapset=1997-10-01 location=1997 gisdbase=/home/quinn/gdb/etosimetaw
g.list rast
g.list vect
r.info dTn
g.region rast=state@4km
r.stats -1 -N dTn | wc -l
g.list rast
g.copy prism@quinn,prism_mask
r.stats -1 -x -n -g state@4km,prism_mask@4km,original_cimis_mask@4km | ess
r.stats -1 -x -n -g state@4km,prism_mask@4km,original_cimis_mask@4km | less
r.stats -1 -x -N -g state@4km,prism_mask@4km,original_cimis_mask@4km | less
r.null --help
r.null map=prism_mask setnull=0
r.stats -1 -x -N -g state@4km,prism_mask@4km,original_cimis_mask@4km | less
pwd
ls -lrt
cd etosimetaw/bin
ls
ls -lrt
make -f 4km.mk db/4km.npixels -n
make -f 4km.mk db/4km.npixels 
create table npixels (
x integer,
y integer,
east integer,
north integer,
longitude float,
latitude float,
dwr boolean,
prism boolean,
cimis boolean,
primary key(x,y)
);
r.stats -1 -x -n -g state@4km | sed -e 's/\*/0/' | less
r.stats -1 -x -n -g state@4km | sed -e 's/\*/0/g' | less
r.stats -1 -x -n -g state@4km | less
g.list rast
g.rename original_cimis_mask,cimis_mask
make -f 4km.mk db/4km.npixels 
rm ../db/4km.npixels 
make -f 4km.mk db/4km.npixels 
r.stats -c state@4km
r.mask -r
rm ../db/4km.npixels 
make -f 4km.mk db/4km.npixels 
rm ../db/4km.npixels 
make -f 4km.mk db/4km.npixels 
ls
cd ../output/
ls
cd 4km
ls
ls -lrt
mv prism.csv.gz prism.csv.gz.old
gzip -d prism.csv.gz.old | wc -l
mv prism.csv.gz.old old.prism.csv.gz
gzip -d prism.csv.gz.old | wc -l
gzip -d old.prism.csv.gz | wc -l
wc -l old.prism.csv 
cd ../..
cd bin
ls
make -f 4km.mk out/prism.csv -n
make -f 4km.mk exchange -n
cd ../output/4km
ls
cd ..
ls
mv 4km 4km.old
mkdir 4km
cd ../bin
make -f 4km.mk exchange -n
make -f 4km.mk exchange
cd ../output
ls
cd 4km.old/
ls
mv old.prism.csv prism.csv
wc -l prism.csv
wc -l ../4km/prism.csv 
cd ..
ls
ls -lrt
rm 4km.zip
zip 4km.zip 4km
zip -r 4km.zip 4km
less 4km/pixels.csv
rm 4km.zip
cd ../bin
rm ../output/4km/pixels.csv 
make -f 4km.mk exchange
cd ../output
ls
zip -r 4km.zip 4km
g.gisenv
pwd
cd ~/etosimetaw/
ls
cd bin
ls
ls -lrt
emacs doit-dm
doit-dm
./doit-dm
./doit-dm 2005 2005
./doit-dm 2006 2007
./doit-dm 2007 2007
pg_dump --help
pg_dump --database=etosimetaw --no-tablespaces --schema=ncdc --table=units
pg_dump --no-tablespaces --schema=ncdc --table=units etosimetaw
pg_dump --help
top
g.list rast
cd bin
make -f mapsets.mk mapsets -n
g.list rast
r.in.xyz --help
g.region -e
g.region -g
psql --cluster 8.4/eto -d etosimetaw -c 'select x,y,m_0 from cfhs.new_factors order by x,y)'
psql --cluster 8.4/eto -d etosimetaw -c 'select x,y,m_0 from cfhs.new_factors order by x,y'
psql --cluster 8.4/eto -d etosimetaw -c 'select east,north,m_0 from cfhs.new_factors order by east,north' | less
psql --cluster 8.4/eto -d etosimetaw -t -c 'select east,north,m_0 from cfhs.new_factors order by east,north' | less
psql -a --cluster 8.4/eto -d etosimetaw -t -c 'select east,north,m_0 from cfhs.new_factors order by east,north' | less
psql -A --cluster 8.4/eto -d etosimetaw -t -c 'select east,north,m_0 from cfhs.new_factors order by east,north' | less
psql -A --cluster 8.4/eto -d etosimetaw -t -c 'select east,north,m_0 from cfhs.new_factors order by east,north' | less
r.in.xyz --help
psql -A --cluster 8.4/eto -d etosimetaw -t -c 'select east,north,m_0 from cfhs.new_factors order by east,north' | r.in.xyz input=- output=test_cfhs method=mean
r.info test_cfhs
d.mon test_cfhs
d.mon start=x0
g.list rast
r.info test_cfhs
y=2010; s=JFB; psql -A --cluster 8.4/eto -d etosimetaw -t -c "select east,north,m_0 from cfhs.row_factors where year=$y and season='$s' order by east,north" | r.in.xyz input=- output=cfhs.$y.$s method=mean
y=2010; s=JFB; psql -A --cluster 8.4/eto -d etosimetaw -t -c "select east,north,m_0 from cfhs.row_factors where year=$y and season='$s' order by east,north" | less
y=2010; s=JFB; psql -A --cluster 8.4/eto -d etosimetaw -t -c "select east,north,1.0/m_0 from cfhs.row_factors join daily4km.pixels p using (x,y) where year=$y and season='$s' order by east,north" | less
y=2010; s=JFM; psql -A --cluster 8.4/eto -d etosimetaw -t -c "select east,north,1.0/m_0 from cfhs.row_factors join daily4km.pixels p using (x,y) where year=$y and season='$s' Order by east,north" | less
y=2010; s=JFM; psql -A --cluster 8.4/eto -d etosimetaw -t -c "select east,north,1.0/m_0 from cfhs.row_factors join daily4km.pixels p using (x,y) where year=$y and season='$s' order by east,north" | r.in.xyz input=- output=cfhs.$y.$s method=mean
g.list rast
g.remove cfhs.2010.JFB
g.remove cfhs.2010.JFM
y=2010; for s in JFM AMJ JAS OND; do psql -A --cluster 8.4/eto -d etosimetaw -t -c "select east,north,1.0/m_0 from cfhs.row_factors join daily4km.pixels p using (x,y) where year=$y and season='$s' order by east,north" | r.in.xyz input=- output=cfhs.m_0.$y.$s method=mean;for v in m b; do psql -A --cluster 8.4/eto -d etosimetaw -t -c "select east,north,$v from cfhs.row_factors join daily4km.pixels p using (x,y) where year=$y and season='$s' order by east,north" | r.in.xyz input=- output=cfhs.$v.$y.$s method=mean; done; done
g.list rast
for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do psql -A --cluster 8.4/eto -d etosimetaw -t -c "select east,north,1.0/m_0 from cfhs.row_factors join daily4km.pixels p using (x,y) where year=$y and season='$s' order by east,north" | r.in.xyz input=- output=cfhs.m_0.$y.$s method=mean;for v in m b; do psql -A --cluster 8.4/eto -d etosimetaw -t -c "select east,north,$v from cfhs.row_factors join daily4km.pixels p using (x,y) where year=$y and season='$s' order by east,north" | r.in.xyz input=- output=cfhs.$v.$y.$s method=mean; done; done; done
g.list rast
for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do for v in m_0 m b; do r.info -r cfhs.$v.$y.$s  done; done; done; done
for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do for v in m_0 m b; do r.info -r cfhs.$v.$y.$s;  done; done; done;
for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do for v in m_0 m b; do eval `r.info -r cfhs.$v.$y.$s;` echo $y $s $v $min $max;  done; done; done;
for v in m_0 m b; do for y in 2004 2005 2006 2007 2008 2009 2010; do for s in JFM JAS do for v in m_0 m b; do r.info -r cfhs.$v.$y.$s; echo $y $s $v $min $max;  done; done; done;
for v in m_0 m b; do for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do eval `r.info -r cfhs.$v.$y.$s;` echo $v $y $s $min $max;  done; done; done;
for v in m_0 m b; do for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do eval `r.info -r cfhs.$v.$y.$s`; echo $v $y $s $min $max;  done; done; done;
r.colors
r.colors --help
r.colors --help | less
r.colors map=cfhs.2010.b.JFM color=gyr
r.colors map=cfhs.2010.b.JFM color=gyr
r.colors map=cfhs.b.2010.JFM color=gyr
for v in m_0 m b; do for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do eval `r.info -r cfhs.$v.$y.$s`; echo $v $y $s $min $max;  done; done; done;
r.colors map=cfhs.m_0.2010.JFM color=gyr
r.colors map=cfhs.m.2010.JFM color=gyr
for v in m_0 m b; do for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do eval `r.info -r cfhs.$v.$y.$s`; echo $v $y $s $min $max;  done; done; done;
for v in m_0 m b; do for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do eval `r.info -r cfhs.$v.$y.$s`; echo $v $y $s $min $max;  done; done; done; | less
for v in m_0 m b; do for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do eval `r.info -r cfhs.$v.$y.$s`; echo $v $y $s $min $max;  done; done; done | less
for v in m_0 m b; do for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do r.colors map=cfhs.$v.$y.$s rast=chfs.$v.2010.JFM;  done; done; done;
g.list rast
r.info chfs.b.2010.JFM
for v in m_0 m b; do for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do r.colors map=cfhs.$v.$y.$s rast=cfhs.$v.2010.JFM;  done; done; done;
cd 
ls
for v in m_0 m b; do for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do r.out.png map=cfhs.$v.$y.$s output=cfhs.$v.$y.$s.png ;  done; done; done;
for v in m_0 m b; do for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do r.out.png input=cfhs.$v.$y.$s output=cfhs.$v.$y.$s.png ;  done; done; done;
pwd
ls
for v in m_0 m b; do for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do eval `r.info -r cfhs.$v.$y.$s`; echo $v $y $s $min $max;  done; done; done | less
for v in m_0 m b; do for y in 2004 2005 2006 2007 2008 2009; do for s in JFM AMJ JAS OND; do r.colors map=cfhs.$v.$y.$s rast=cfhs.$v.2010.JFM;  done; done; done;

pwd
cd etosimetaw/
ls
cd bin
cd cfhs
ls
less schema.sql 
grep row_factor ../cfhs.mk
psql --cluster 8.4/eto -d etosimetaw -c 'insert into cfhs.cfhs_all_year select * from all_row_factor(2)'
psql --cluster 8.4/eto -d etosimetaw -c 'insert into cfhs.cfhs_all_year select * from cfhs.all_row_factor(2)'
for i in `seq 1 300`; do psql --cluster 8.4/eto -d etosimetaw -c "insert into cfhs.cfhs_all_year select * from cfhs.all_row_factor($i)"; done
do for s in YR JFM AMJ JAS OND; do for v in m_0 m b; do psql -A --cluster 8.4/eto -d etosimetaw -t -c "select east,north,$v from cfhs.cfhs_all join daily4km.pixels p using (x,y) where year=$y and season='$s' order by east,north" | r.in.xyz input=- output=cfhs.$v.$y.$s method=mean; done; done; done
do for s in YR JFM AMJ JAS OND; do for v in m_0 m b; do psql -A --cluster 8.4/eto -d etosimetaw -t -c "select east,north,$v from cfhs.cfhs_all_year join daily4km.pixels p using (x,y) where season='$s' order by east,north" | r.in.xyz input=- output=cfhs.$v.$s method=mean; done; done
for s in YR JFM AMJ JAS OND; do for v in m_0 m b; do psql -A --cluster 8.4/eto -d etosimetaw -t -c "select east,north,$v from cfhs.cfhs_all_year join daily4km.pixels p using (x,y) where season='$s' order by east,north" | r.in.xyz input=- output=cfhs.$v.$s method=mean; done; done
g.list rast
emacs cfhs.m.YR
r.colors map=chfs.m.YR color=ryg
r.colors map=chfs.YR.m color=ryg
g.list rast
r.colors map=cfhs.YR.m color=ryg
r.colors map=cfhs.m.YR color=ryg
g.list rast
for s in YR JFM AMJ JAS OND ;dov in m m_0 b; do f=cfhs.$v.$s; r.colors map=$f color=grey; r.out.tiff input=$f output=$f.tif; done; done
cd 
for s in YR JFM AMJ JAS OND ;do for v in m m_0 b; do f=cfhs.$v.$s; r.colors map=$f color=grey; r.out.tiff input=$f output=$f.tif; done; done
for s in YR JFM AMJ JAS OND ;do for v in m m_0 b; do f=cfhs.$v.$s; r.colors map=$f color=grey; r.out.png input=$f output=$f.png; done; done
gdal info chfs.m.OND.png
ogrinfo chfs.m.OND.png
gdalinfo chfs.m.OND.png
cp chfs.m.OND.png foo.png
ls
cp chfs.m.OND.png foo.png
gdalinfo cfhs.m.OND.png
ls 
rm *.tif
rm *.png
ls
for s in YR JFM AMJ JAS OND ;do for v in m m_0 b; do f=cfhs.$v.$s; r.colors map=$f color=grey; r.out.ascii input=$f output=$f.ascii; done; done
less cfhs.m.YR.ascii 
zip cfhs.zip *.asc
zip -f cfhs.zip *.asc
ls
zip -f cfhs.zip *.ascii
zip cfhs.zip *.ascii
for s in YR JFM AMJ JAS OND ;do for v in m m_0 b; do f=cfhs.$v.$s; r.colors map=$f rast=cfhs.m.YR; done; done
for s in YR JFM AMJ JAS OND ;do for v in m m_0 b; do f=cfhs.$v.$s; r.colors map=$f rast=cfhs.m.YR; done; done
echo $DISPLAY
g.list rast
d.mon start=x0
d.rast cfhs.m.YR
d.legend --help
d.legend map=cfhs.m.YR at=0,50,0,15
d.legend map=cfhs.m.YR at=0,50,0,10
d.erase
d.legend map=cfhs.m.YR at=0,50,0,10
d.rast cfhs.m.YR
d.legend map=cfhs.m.YR at=0,50,0,10
d.legend map=cfhs.m.YR at=0,50,0,10 thin=.2
d.legend map=cfhs.m.YR at=0,50,0,10 thin=10
d.legend map=cfhs.m.YR at=0,50,0,10 thin=1
d.erase; d.rast ch.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 thin=1
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 thin=1
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 thin=2
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 use=0.4,0.6,0.8,1.0,1.2,1.4,1.6,1.8
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 use=0.6,0.8,1.0,1.2,1.4,1.6,1.8
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 range=0.6,1.8
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 range=0.6,1.8 labelnum=6
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 range=0.6,1.8 labelnum=5
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 range=0.4,1.8 labelnum=5
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 range=0.4,1.8 labelnum=6
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 range=0.5,1.8 labelnum=6
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 range=0.5,1.8 labelnum=5
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 range=0.6,1.8 labelnum=5
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 range=0.6,1.8 labelnum=6
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 range=0.6,1.8 labelnum=7
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 range=0.4,1.8 labelnum=8
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 range=0.4,1.8 labelnum=8
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 range=0.4,1.8 labelnum=8
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,10 range=0.4,1.8 labelnum=8 --help
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,8 range=0.4,1.8 labelnum=8 --help
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,8 range=0.4,1.8 labelnum=8 
d.erase; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,8 range=0.4,1.8 labelnum=8 
env 
env  | grep -i g
r.info cfhs.m.YR
export GRASS_WIDTH=276; export GRASS_HEIGHT=250; export GRASS_TRUECOLOR=TRUE
export GRASS_PNGFILE=cfhs.m.YR.png
d.mon start=PNG; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,8 range=0.4,1.8 labelnum=8 ; d.mon stop=PNG
d.rast
ls -lrt
export GRASS_WIDTH=1104; export GRASS_HEIGHT=1000; export GRASS_TRUECOLOR=TRUE
d.mon start=PNG; g.region rast=cfhs.m.YR; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,8 range=0.4,1.8 labelnum=8 ; d.mon stop=PNG
for s in YR JFM AMJ JAS OND ;do for v in m m_0 b; do f=cfhs.$v.$s; of=`cat $f | sed -e 's/./_/g'`; r.colors map=$f color=grey; r.out.arc input=$f output=$of.asc; done; done
ls -lrt
g.list rast
for s in YR JFM AMJ JAS OND ;do for v in m m_0 b; do f=cfhs.$v.$s; of=`cat $f | sed -e 's/./_/g'`; r.colors map=$f color=grey; r.out.arc input=$f output=$of.asc; done; done
r.out.arc --help
ls -lrt
rm *.ascii
pwd
for s in YR JFM AMJ JAS OND ;do for v in m m_0 b; do f=cfhs.$v.$s; of=`cat $f | sed -e 's/./_/g'`; r.colors map=$f color=grey; echo r.out.arc input=$f output=$of.asc; done; done
for s in YR JFM AMJ JAS OND ;do for v in m m_0 b; do f=cfhs.$v.$s; of=`echo $f | sed -e 's/./_/g'`; r.colors map=$f color=grey; r.out.arc input=$f output=$of.asc; done; done
ls
rm *.asc
rm .asc 
for s in YR JFM AMJ JAS OND ;do for v in m m_0 b; do f=cfhs.$v.$s; of=`echo $f | sed -e 's/\./_/g'`; r.colors map=$f color=grey; r.out.arc input=$f output=$of.asc; done; done
ls -lrt
rm cfhs.zip
zip cfhs.zip *.asc

d.mon start=PNG; g.region rast=cfhs.m.YR; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,8 range=0.4,1.8 labelnum=8 ; d.mon stop=PNG
d.mon select=x0; g.region rast=cfhs.m.YR; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,8 range=0.4,1.8 labelnum=8 ;
r.color map=cfhs.m.YR rules=/home/quinn/etosimetaw//bin/cfhs/m.colr 
r.colors map=cfhs.m.YR rules=/home/quinn/etosimetaw//bin/cfhs/m.colr 
r.colors map=cfhs.m.YR rules=/home/quinn/etosimetaw//bin/cfhs/m.colr 
r.colors map=cfhs.m.YR rules=/home/quinn/etosimetaw//bin/cfhs/m.colr 
r.colors map=cfhs.m.YR rules=/home/quinn/etosimetaw//bin/cfhs/m.clr
r.colors map=cfhs.m.YR rules=/home/quinn/etosimetaw//bin/cfhs/m.clr
r.colors map=cfhs.m.YR rules=/home/quinn/etosimetaw//bin/cfhs/m.clr
r.color map=cfhs.m.YR rules=/home/quinn/etosimetaw//bin/cfhs/m.colr 
d.mon select=x0; g.region rast=cfhs.m.YR; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,8 range=0.4,1.8 labelnum=8 ;
r.colors map=cfhs.m.YR rules=/home/quinn/etosimetaw//bin/cfhs/m.clr
d.mon select=x0; g.region rast=cfhs.m.YR; d.rast cfhs.m.YR; d.legend map=cfhs.m.YR at=0,50,0,8 range=0.4,1.8 labelnum=8 ;
export GRASS_TRUECOLOR=TRUE
cd 
cd etosimetaw/bin
make -f cfhs.mk png -i
make -f cfhs.mk png -n
make -f cfhs.mk png -n
cd cfhs
ls
ls -lrt
cd ..
ls
mv cfhs.mk cfhs/Makefile
cd cfhs/
make -n [ng
make -n png
make -n png
ls -lrt
mv m.clr cfhs.m.rules
make -n png
cp cfhs.m.rules cfhs.m_0.rules 
cp cfhs.m.rules cfhs.b.rules 
make -n png
make png
make -n png
make png
make png-
ls
make png -n
g.region rast=cfhs.m.OND; r.colors input=cfhs.m.OND rules=cfhs.m.rules; d.rast cfhs.m.OND; d.legend map=cfhs.m.OND at=0,50,0,8 range=0.4,1.8 labelnum=8; d.mon stop=PNG;
r.colors input=cfhs.m.OND rules=cfhs.m.rules; 
r.colors map=cfhs.m.OND rules=cfhs.m.rules; 
make png 
g.list rast
ls
ls
less NOTES 
cd 
ls
pwd
mkdir public_html
cd public_html/
touch junk
ls -lrt
cd 
cd etosimetaw/bin/cfhs
ls
ls -lrt
g.gisenv
g.list rast
xclock
xclock
g.list rast
d.mon start=x0
d.rast chfs.m_0.AMJ
d.rast cfhs.m_0.AMJ
d.rast cfhs.m_0.YR
d.rast cfhs.m_0.JAS
pwd
g.list rast
g.list type=rast mapset=2010-01-01
r.info PCP@2010-01-01
r.info dPCP@2010-01-01
ls
