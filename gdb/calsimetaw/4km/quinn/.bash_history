d.mon start=x0
g.mapset location=1970 mapset=quinn
d.rast PCP_frac@1970-01
d.rast PCP_frac@1970-02
d.what.rast
g.mapset location=1960 mapset=quinn
g.mapset location=1960 mapset=quinn
g.mapset -c location=1960 mapset=quinn
d.rast PCP_frac@1960-02
g.region -d
d.rast PCP_frac@1960-02
r.info  PCP_frac@1960-02
g.mapset -c location=1950 mapset=quinn
r.info  PCP_frac@1950-02
g.region -d
r.info  PCP_frac@1950-02
d.rast PCP_frac@1950-02
g.gisenv
r.mask interior_mask@4km
d.rast PCP_frac@1950-02
r.info interior_mask@4km
r.info state@4km
pwd
cd etosimetaw/gdb
ls
cd 4km
ls
cd cellhd
ls
r.info MASK@4km
r.mask -o MASK@4km
d.rast PCP_frac@1950-02
r.stats PCP_frac@1950-02
r.stats -p PCP_frac@1950-02
r.stats -c PCP_frac@1950-02
r.stats --help PCP_frac@1950-02
r.stats -1 PCP_frac@1950-02
r.stats -1 PCP_frac@1950-02 | perl -n 'print $F[0]'
r.stats -1 PCP_frac@1950-02 | perl -n -e 'print $F[0]'
r.stats -1 PCP_frac@1950-02 | perl -a -n -e 'print $F[0]'
r.stats -1 PCP_frac@1950-02 | perl -a -n -e 'printf("%0.2f %f\n,$F[0],$F[0]);'
r.stats -1 PCP_frac@1950-02 | perl -a -n -e 'printf("%0.2f %f\n",$F[0],$F[0]);'
r.stats -1 PCP_frac@1950-02 | grep -v '\*' perl -a -n -e 'printf("%0.2f %f\n",$F[0],$F[0]);'
r.stats -1 --help PCP_frac@1950-02  | perl -a -n -e 'printf("%0.2f %f\n",$F[0],$F[0]);'
r.stats -1 -n PCP_frac@1950-02  | perl -a -n -e 'printf("%0.2f %f\n",$F[0],$F[0]);'
r.stats -1 -n PCP_frac@1950-02  | perl -a -n -e '$sum+=$F[0]; $sum2+=pow($F[0],2); $n=sprintf("%0.2f",$F[0]); $hist{$n}++; END: {printf "%f %f\n",$sum,$sum2;}'
r.stats -1 -n PCP_frac@1950-02  | perl -a -n -e '$sum+=$F[0]; $sum2+=$F[0]**2; $n=sprintf("%0.2f",$F[0]); $hist{$n}++; END {printf "%f %f\n",$sum,$sum2;}'
r.stats -1 -n PCP_frac@1950-02  | perl -a -n -e '$sum+=$F[0]; $sum2+=$F[0]^2; $n=sprintf("%0.2f",$F[0]); $hist{$n}++; END {printf "%f %f\n",$sum,$sum2;}'
r.stats -1 -n PCP_frac@1950-02  | perl -a -n -e '$sum+=$F[0]; $sum2+=$F[0]^2; $n=sprintf("%0.2f",$F[0]); $hist{$n}++; END {printf "%f %f\n",$sum,$sum2; foreach (sort -n keys %hist) { printf "%f,%f\n",$_,$hist{$_};} }'
r.stats -1 -n PCP_frac@1950-02  | perl -a -n -e '$sum+=$F[0]; $sum2+=$F[0]^2; $n=sprintf("%0.2f",$F[0]); $hist{$n}++; END {printf "%f %f\n",$sum,$sum2; foreach (sort keys %hist) { printf "%f,%f\n",$_,$hist{$_};} }'
r.stats -1 -n PCP_frac@1950-02  | perl -a -n -e '$sum+=$F[0]; $sum2+=$F[0]^2; $n=sprintf("%0.2f",$F[0]); $hist{$n}++; END {printf "%f %f\n",$sum,$sum2; foreach (sort keys %hist) { printf "%f,%d\n",$_,$hist{$_};} }'
r.stats -1 -n PCP_frac@1950-02  | perl -a -n -e '$sum+=$F[0]; $sum2+=$F[0]^2; $n=sprintf("%0.2f",$F[0]); $hist{$n}++; END {printf "%f %f\n",$sum,$sum2; foreach (sort keys %hist) { printf "%.2f,%d\n",$_,$hist{$_};} }'
d.mon start=x0
g.mapset location=2002 mapset=quinn
g.mapset location=2002 mapset=PERMANENT
d.rast PCP_frac@2002-01
d.rast PCP_frac@2002-02
d.rast PCP_frac@2002-03
d.rast PCP_frac@2002-04
d.rast PCP_frac@2002-05
d.rast PCP_frac@2002-06
d.rast PCP_frac@2002-07
d.rast PCP_frac@2002-08
d.rast dPCP@2002-08-01
d.rast dPCP@2002-08-02
d.rast dPCP@2002-08-03
d.rast dPCP@2002-08-04
d.rast dPCP@2002-08-05
d.rast dPCP@2002-08-06
d.rast dPCP@2002-08-07
d.rast dPCP@2002-08-08
d.rast dPCP@2002-08-09
d.rast dPCP@2002-08-10
d.rast dPCP@2002-08-11
d.rast dPCP@2002-08-12
d.rast dPCP@2002-08-13
d.rast dPCP@2002-08-14
d.rast dPCP@2002-08-15
d.rast dPCP@2002-08-16
d.rast dPCP@2002-08-17
d.rast dPCP@2002-08-18
d.rast dPCP@2002-08-19
d.rast dPCP@2002-08-20
d.rast dPCP@2002-08-21
d.rast dPCP@2002-08-22
d.rast dPCP@2002-08-23
d.rast dPCP@2002-08-24
d.rast dPCP@2002-08-25
d.rast dPCP@2002-08-26
d.rast dPCP@2002-08-27
d.rast dPCP@2002-08-28
d.rast dPCP@2002-08-29
d.rast dPCP@2002-08-30
d.rast mPCP@2002-08
d.rast PCP_frac@2002-08
d.erase
d.rast PCP_frac@2002-08
d.what.rast
g.list type=rast mapset=2001-08
g.list type=rast mapset=2002-08
g.mapset 2002-08
g.list rast
r.info PCP_frac
seq -f %02g 1 31
for d in `seq -f %02g 1 31`; do echo dPCP@2002-08-$d+; done
for d in `seq -f %02g 1 31`; do echo -n dPCP@2002-08-$d+; done
for d in `seq -f %02g 1 31`; do echo -n dPCP@2002-08-$d+; done
echo foo=($(for d in `seq -f %02g 1 31`; do echo -n dPCP@2002-08-$d+; done)0
echo "foo=($(for d in `seq -f %02g 1 31`; do echo -n dPCP@2002-08-$d+; done)0"
echo "foo=$(for d in `seq -f %02g 1 31`; do echo -n dPCP@2002-08-$d+; done)0"
echo r.mapcalc foo=$(for d in `seq -f %02g 1 31`; do echo -n dPCP@2002-08-$d+; done)0
echo r.mapcalc sum_dPCP=$(for d in `seq -f %02g 1 31`; do echo -n dPCP@2002-08-$d+; done)0
eval r.mapcalc sum_dPCP=$(for d in `seq -f %02g 1 31`; do echo -n dPCP@2002-08-$d+; done)0
eval r.mapcalc sum_dPCP=$(for d in `seq -f %02g 1 31`; do echo -n dPCP@\"2002-08-$d\"+; done)0
echo r.mapcalc sum_dPCP=$(for d in `seq -f %02g 1 31`; do echo -n dPCP@\"2002-08-$d\"+; done)0
echo r.mapcalc sum_dPCP=$(for d in `seq -f %02g 1 31`; do echo -n \"dPCP@2002-08-$d\"+; done)0
eval r.mapcalc sum_dPCP=$(for d in `seq -f %02g 1 31`; do echo -n \"dPCP@2002-08-$d\"+; done)0
eval r.mapcalc sum_dPCP=$(for d in `seq -f %02g 1 31`; do echo -n dPCP@'2002-08-$d'+; done)0
echo r.mapcalc sum_dPCP=$(for d in `seq -f %02g 1 31`; do echo -n dPCP@'2002-08-$d'+; done)0
echo r.mapcalc sum_dPCP=$(for d in `seq -f %02g 1 31`; do echo -n "dPCP@'2002-08-$d'+"; done)0
echo "r.mapcalc 'sum_dPCP=$(for d in `seq -f %02g 1 31`; do echo -n dPCP@\"2002-08-$d\"+; done)0'"
eval "r.mapcalc 'sum_dPCP=$(for d in `seq -f %02g 1 31`; do echo -n dPCP@\"2002-08-$d\"+; done)0'"
eval "r.mapcalc 'sum_dPCP=$(for d in `seq -f %02g 1 31`; do echo -n \"dPCP@2002-08-$d\"+; done)0'"
d.rast sum_dPCP
d.what.rast
d.rast 2002-08-01
d.rast dPCP@2002-08-01
d.what.rast
d.rast dPCP@2002-08-02
for d in `seq -f %02g 1 31`; do r.info -r dPCP@2002-08-$d; done
for d in `seq -f %02g 1 31`; do echo $d; r.info -r dPCP@2002-08-$d; done | grep -v min
for d in `seq -f %02g 1 31`; do echo $d; r.info -r dPCP@2002-08-$d; done | grep -v min | less
d.what.rast
r.mask -o MASK@4km
for d in `seq -f %02g 1 31`; do echo $d; r.info -r dPCP@2002-08-$d; done | grep -v min | less
for d in `seq -f %02g 1 31`; do echo $d; r.stats  dPCP@2002-08-$d; done | grep -v min | less
for d in `seq -f %02g 1 31`; do echo $d; r.stats -p nsteps=3 dPCP@2002-08-$d; done | grep -v min | less
for d in `seq -f %02g 1 31`; do echo $d; r.stats -p nsteps=3 dPCP@2002-08-$d; done 
for d in `seq -f %02g 1 31`; do echo $d; r.stats -p nsteps=3 dPCP@2002-08-$d; done 
for d in `seq -f %02g 1 31`; do echo $d; r.stats -p nsteps=3 input=dPCP@2002-08-$d; done 
for d in `seq -f %02g 1 31`; do echo $d; r.stats -p nsteps=3 input=dPCP@2002-08-$d; done  | less
d.rast dPCP@2002-08-03
d.what.rast
d.mon start=x0
g.mapset location=1923 mapset=quinn
g.mapset location=1923 mapset=1223-12
g.mapset location=1923 mapset=1923-12
d.rast PCP_frac
d.what.rast
seq -f %-2g 1 31
seq -f %02g 1 31
for d in `seq -f %02g 1 31`; do r.info -r dPCP@1923-12-$d; done
for d in `seq -f %02g 1 31`; do eval `r.info -r dPCP@1923-12-$d`; echo $d $min $max; done

d.what.rast
d.erase
for d in `seq -f %02g 1 31`; do eval `r.info -r dPCP@1923-12-$d`; echo $d $min $max; done
d.rast PCP@1923-12-19
d.rast dPCP@1923-12-19
r.colors map=dPCP@1923-12-19 rules=~/PCP_daily.color 
d.rast dPCP@1923-12-19
d.what.rast 
pwd
cd etosimetaw/gdb/1923
cd 1923-12
ls
ls -lrt
ls -l colr2
for d in `seq -f %02g 1 31`; do m=dPCP@1923-12-$d; echo $m; r.colors map=$m rules=~/PCP_daily.color; d.rast=$m; sleep 2; done
for d in `seq -f %02g 1 31`; do m=dPCP@1923-12-$d; echo $m; r.colors map=$m rules=~/PCP_daily.color; d.erase; d.rast $m; sleep 2; done
for d in `seq -f %02g 1 31`; do m=PCP@1923-12-$d; echo $m; d.erase; d.rast $m; sleep 2; done
d.rast mPCP
d.erase
d.rast mPCP
d.what.rast
r.info PCP_sum
r.info PCP_summed
r.info dPCP_summed
r.info PCP_summed
g.list rast
r.info PCP_frac
d.rast PCP_frac
d.what.rast
d.rast PCP_sum
d.rast PCP_summed
d.what.rast
g.mapset location=2000 mapset=2000-12
d.rast mPCP
cd ../..
y=2002; m=12; for d in `seq -f %02g 1 31`; do p=PCP@$y-$m-$d; echo $p; d.erase; d.rast $p; sleep 2; done
g.gisenv
g.mapset location=2000 mapset=2000-01
y=2000; m=01; for d in `seq -f %02g 1 31`; do p=PCP@$y-$m-$d; echo $p; d.erase; d.rast $p; sleep 2; done
y=2000; m=01; for d in `seq -f %02g 1 31`; do p=dPCP@$y-$m-$d; echo $p; r.colors map=$p rules=~/dPCP_daily.rules; d.erase; d.rast $p; sleep 2; done
cd 
mv PCP_daily.color dPCP_daily.rules
y=2000; m=01; for d in `seq -f %02g 1 31`; do p=dPCP@$y-$m-$d; echo $p; r.colors map=$p rules=~/dPCP_daily.rules; d.erase; d.rast $p; sleep 2; done
y=2000; m=01; for d in `seq -f %02g 1 31`; do p=dPCP@$y-$m-$d; echo $p; r.colors map=$p rules=~/dPCP_daily.rules; d.erase; d.rast $p; sleep 2; done
d.rast PCP_frac
