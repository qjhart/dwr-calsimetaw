cdm
make -f /home/groups/etosimetaw/Makefile mapsets -n
cdm
ls
cd ..
ls
make -f /home/groups/etosimetaw/Makefile mapsets -n
g.gisenv
make -f /home/groups/etosimetaw/Makefile mapsets -n
make -f /home/groups/etosimetaw/Makefile mapsets -n
make -f /home/groups/etosimetaw/Makefile mapsets -n
g.list --help
g.list type=rast mapset=2007-10
cd 
cd etosimetaw/bin
ls
cp -r ~/weather/db .
ls db
make -f ncdc.mk db/ncdc.prism.2007-10 -n
g.gisenv
make MAPSET=2007-10 -f ncdc.mk db/ncdc.prism.2007-10 -n
make MAPSET=2007-10 -f ncdc.mk db/ncdc.prism.2007-10 
m=2007-11 make MAPSET=$m -f ncdc.mk db/ncdc.prism.$m -n
env m=2007-11 make MAPSET=$m -f ncdc.mk db/ncdc.prism.$m -n
m=2007-11; make MAPSET=$m -f ncdc.mk db/ncdc.prism.$m -n
m=2007-11; make MAPSET=$m -f ncdc.mk db/ncdc.prism.$m
g.gisenv
g.mapset --help
g.mapset location=1997
g.mapset location=1997 mapset=PERMANENT
g.mapset location=1998 mapset=PERMANENT
g.mapset location=1997 mapset=1997-01
for y in `seq 1997 20081`; do echo $y; done
for y in `seq 1997 2008`; do echo $y; done
for y in `seq 1997 2008`; do echo $y; for m in '11 12 01 02 03 04 05 06 07 08 09 10'; do echo $y-$m; done; done
for y in `seq 1997 2008`; do echo $y; for m in 11 12 01 02 03 04 05 06 07 08 09 10; do echo $y-$m; done; done
for y in `seq 1997 2008`; do g.mapset location=$y mapset=$y-01; for m in 11 12 01 02 03 04 05 06 07 08 09 10; do echo $y-$m; done; done
make -f ncdc.mk INFO
make -f ncdc.mk info
for y in `seq 1997 2008`; do g.mapset location=$y mapset=$y-01; for m in 11 12 01 02 03 04 05 06 07 08 09 10; do echo map=$y-$m; make MAPSET=$map -f ncdc.mk db/ncdc.prism.$map -n; done; done
for y in `seq 1997 2008`; do g.mapset location=$y mapset=$y-01; for m in 11 12 01 02 03 04 05 06 07 08 09 10; do map=$y-$m; make MAPSET=$map -f ncdc.mk db/ncdc.prism.$map -n; done; done
for y in `seq 1997 2008`; do g.mapset location=$y mapset=$y-01; for m in 11 12 01 02 03 04 05 06 07 08 09 10; do map=$y-$m; make MAPSET=$map -f ncdc.mk db/ncdc.prism.$map; done; done
cd db
ls
cd ncdc 
ls
pwd
cd ..
ls
make -f ncdc.mk info
cd ~/gdb/etosimetaw
rm -rf 2008
cd 2007
ls
rm -rf 2007-10
rm -rf 2007-11
rm -rf 2007-12
ls -lrt
ls
pwd
date --date="2006-01-01+1days"
date --help
date --date="2006-01-01+1days" +%Y%M%d
date --date="2006-01-01+1days" +%Y-%m-%d
for ym in 1997-10 1997-12; for doy in `seq 0 365`; do date --date="${ym}-01+1days" +%Y-%m-%d; done ; done
for ym in 1997-10 1997-12; do for doy in `seq 0 365`; do date --date="${ym}-01 + ${doy} days" +%Y-%m-%d; done ; done
for ym in 1997-10 1997-12; do for doy in `seq 0 365`; do date --date="${ym}-01 + ${doy} days" +%Y-%m-%d; done ; done | wc -l
for ym in 1997-10 1997-12; do for doy in `seq 0 365`; do date --date="${ym}-01 + ${doy} days" +%Y-%m-%d; done ; done | sort -u | wv -l
g.list --help
g.list type=rast mapset=2007-10
cd 
cd etosimetaw/bin
ls
cp -r ~/weather/db .
ls db
make -f ncdc.mk db/ncdc.prism.2007-10 -n
g.gisenv
make MAPSET=2007-10 -f ncdc.mk db/ncdc.prism.2007-10 -n
make MAPSET=2007-10 -f ncdc.mk db/ncdc.prism.2007-10 
m=2007-11 make MAPSET=$m -f ncdc.mk db/ncdc.prism.$m -n
env m=2007-11 make MAPSET=$m -f ncdc.mk db/ncdc.prism.$m -n
m=2007-11; make MAPSET=$m -f ncdc.mk db/ncdc.prism.$m -n
m=2007-11; make MAPSET=$m -f ncdc.mk db/ncdc.prism.$m
g.gisenv
g.mapset --help
g.mapset location=1997
g.mapset location=1997 mapset=PERMANENT
g.mapset location=1998 mapset=PERMANENT
g.mapset location=1997 mapset=1997-01
for y in `seq 1997 20081`; do echo $y; done
for y in `seq 1997 2008`; do echo $y; done
for y in `seq 1997 2008`; do echo $y; for m in '11 12 01 02 03 04 05 06 07 08 09 10'; do echo $y-$m; done; done
for y in `seq 1997 2008`; do echo $y; for m in 11 12 01 02 03 04 05 06 07 08 09 10; do echo $y-$m; done; done
for y in `seq 1997 2008`; do g.mapset location=$y mapset=$y-01; for m in 11 12 01 02 03 04 05 06 07 08 09 10; do echo $y-$m; done; done
make -f ncdc.mk INFO
make -f ncdc.mk info
for y in `seq 1997 2008`; do g.mapset location=$y mapset=$y-01; for m in 11 12 01 02 03 04 05 06 07 08 09 10; do echo map=$y-$m; make MAPSET=$map -f ncdc.mk db/ncdc.prism.$map -n; done; done
for y in `seq 1997 2008`; do g.mapset location=$y mapset=$y-01; for m in 11 12 01 02 03 04 05 06 07 08 09 10; do map=$y-$m; make MAPSET=$map -f ncdc.mk db/ncdc.prism.$map -n; done; done
for y in `seq 1997 2008`; do g.mapset location=$y mapset=$y-01; for m in 11 12 01 02 03 04 05 06 07 08 09 10; do map=$y-$m; make MAPSET=$map -f ncdc.mk db/ncdc.prism.$map; done; done
cd db
ls
cd ncdc 
ls
pwd
cd ..
ls
make -f ncdc.mk info
cd ~/gdb/etosimetaw
rm -rf 2008
cd 2007
ls
rm -rf 2007-10
rm -rf 2007-11
rm -rf 2007-12
ls -lrt
ls
pwd
date --date="2006-01-01+1days"
date --help
date --date="2006-01-01+1days" +%Y%M%d
date --date="2006-01-01+1days" +%Y-%m-%d
for ym in 1997-10 1997-12; for doy in `seq 0 365`; do date --date="${ym}-01+1days" +%Y-%m-%d; done ; done
for ym in 1997-10 1997-12; do for doy in `seq 0 365`; do date --date="${ym}-01 + ${doy} days" +%Y-%m-%d; done ; done
for ym in 1997-10 1997-12; do for doy in `seq 0 365`; do date --date="${ym}-01 + ${doy} days" +%Y-%m-%d; done ; done | wc -l
for ym in 1997-10 1997-12; do for doy in `seq 0 365`; do date --date="${ym}-01 + ${doy} days" +%Y-%m-%d; done ; done | sort -u | wv -l
for ym in 1997-10 1997-12; do for doy in `seq 0 365`; do date --date="${ym}-01 + ${doy} days" +%Y-%m-%d; done ; done | sort -u | wc -l
for ym in 1997-10 1997-12; do for doy in `seq 0 31`; do date --date="${ym}-01 + ${dom} days" +%Y-%m-%d; done ; done | sort -u | wc -l
for ym in 1997-10 1997-12; do for doy in `seq 0 31`; do date --date="${ym}-01 + ${dom} days" +%Y-%m-%d; done ; done
for ym in 1997-10 1997-12; do for dom in `seq 0 31`; do date --date="${ym}-01 + ${dom} days" +%Y-%m-%d; done ; done
cd 
cd etosimetaw/bin
ls
make -n configure.mk days.mk
make -f configure.mk days.mk
rm days.mk 
make -f configure.mk days.mk -n
make -f configure.mk days.mk 
rm days.mk 
make -f configure.mk days.mk 
less days.mk 

make -f ncdc.mk info
grep -i 'not in' *.mk
grep -- '-F' *.mk
psql -d -F',' -A -t -c "select * from average_station_differences";
psql -d etosimetaw -F',' -A -t -c "select * from average_station_differences";
psql -d etosimetaw -F',' -A -t -c "select * from ncdc.average_station_differences";
psql -d etosimetaw -F',' -A -t -c "select * from ncdc.average_station_differences"; > average_station_differences.csv
psql -d etosimetaw -F',' -A -t -c "select * from ncdc.average_station_differences" > average_station_differences.csv
mv average_station_differences.csv ~
cd ..
ls
cd 
ls
cd etosimetaw/bin
ls
less ncdc.mk
ls
cd 
pwd
ls
cd etosimetaw/
ls
cd bin
ls
less ncdc.mk
ls db
ls -l db
ls -l db/*
find ~ -name 256* -ls
cd ~/weather/downloads/
ls
head 2569932115797dat.txt
grep 20060701 2569932115797dat.txt | less
grep 200607 2569932115797dat.txt | less 
grep 200607 2569932115797dat.txt | grep 93121 | less
ls
ls -lrt
ls
g.list rast
for y in 2005 2006; do g.mapset location=${y} mapset=PERMANENT; for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do g.mapset mapset=$m; make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk delta -B ; done; done
g.gisenv
for y in 2007; do g.mapset location=${y} mapset=PERMANENT; for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do g.mapset mapset=$m; make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk delta -B ; done; done
g.gisenv
for y in 1999; do g.gisenv location=$y mapset=PERMANENT; for m  in `g.mapsets -l | tr ' ' "\n"| grep "${year}-..-.."`; do g.mapset $m; make -j 3 --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk delta; done; done
for y in 1999; do g.mapset location=$y mapset=PERMANENT; for m  in `g.mapsets -l | tr ' ' "\n"| grep "${year}-..-.."`; do g.mapset $m; make -j 3 --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk delta; done; done
for y in 1999; do g.mapset location=$y mapset=PERMANENT; for m  in `g.mapsets -l | tr ' ' "\n"| grep "${y}-..-.."`; do g.mapset $m; make -j 3 --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk delta; done; done
g.list rast
g.gisenv
pwd
cd etosimetaw/bin/
g.list vect
make -f daily.mk delta -B
g.list rast
r.info dTn
r.info dTx
r.info dPCP
for y in 2003 2004 do g.mapset location=${y} mapset=PERMANENT; for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do g.mapset mapset=$m; make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk delta -B ; done; done
for y in 2003 2004; do g.mapset location=${y} mapset=PERMANENT; for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do g.mapset mapset=$m; make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk delta -B ; done; done
for y in 2003 2004; do g.mapset location=${y} mapset=PERMANENT; for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do g.mapset mapset=$m; make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk day ; done; done
for y in 2006 2007; do g.mapset location=${y} mapset=PERMANENT; for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do g.mapset mapset=$m; make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk day ; done; done
6
for y in 2002; do    g.mapset location=${y} mapset=PERMANENT;    for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do      g.mapset mapset=$m;      make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk TnTxPCPEToRF.csv;    done ;  done
for y in 2001 2002; do g.mapset location=${y} mapset=PERMANENT; for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do g.mapset mapset=$m; make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk delta -B ; done; done
for y in 2001 2002; do g.mapset location=${y} mapset=PERMANENT; for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do g.mapset mapset=$m; make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk day ; done; done
TnTxPCPET;
for y in 2001; do    g.mapset location=${y} mapset=PERMANENT;    for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do      g.mapset mapset=$m;      make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk TnTxPCPEToRF.csv;    done ;  done
for y in 2006; do    g.mapset location=${y} mapset=PERMANENT;    for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do      g.mapset mapset=$m;      make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk TnTxPCPEToRF.csv;    done ;  done
g.list rast
for y in 1999 2000; do g.mapset location=${y} mapset=PERMANENT; for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do g.mapset mapset=$m; make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk delta -B ; done; done
g.list rast
for y in 1997; do g.mapset location=${y} mapset=PERMANENT; for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do g.mapset mapset=$m; make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk day -n ; done; done
for y in 1997; do g.mapset location=${y} mapset=PERMANENT; for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do g.mapset mapset=$m; make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk day ; done; done
for y in 1998 1999 2000; do g.mapset location=${y} mapset=PERMANENT; for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do g.mapset mapset=$m; make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk day ; done; done
r.stats Tn
r.stats -c Tn
r.stats -z 100
r.info -r Tn
r.info -r dTn
r.his --help
r.stats --help
r.stats -c -i -n Tn
r.stats -c -i -n dTn
r.stats -c -i -n Tx
r.stats -c -i -n PCP
r.stats -c  -n PCP
r.stats -c -i -n PCP
r.info -r
r.info -r Tn
eval `r.info -r Tn`; echo Tn,$min,$max
eval `r.info -r Tn`; echo ${mapset},Tn,$min,$max

for y in 2000; do g.mapset location=${y} mapset=PERMANENT; for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do g.mapset mapset=$m; make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk TnTxPCPET\ ; done; done
for y in 2000; do g.mapset location=${y} mapset=PERMANENT; for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do g.mapset mapset=$m; make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk TnTxPCPEToRF.csv ; done; done
for y in 2007; do g.mapset location=${y} mapset=PERMANENT; for m in `g.mapsets -l | tr ' ' "\n" | grep "${y}-..-.."`; do g.mapset mapset=$m; make --include-dir=~/etosimetaw/bin -f ~/etosimetaw/bin/daily.mk TnTxPCPEToRF.csv ; done; done
cd bin
make -f mapsets.mk mapsets -n | less
