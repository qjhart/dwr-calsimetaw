# CalSIMETAW Processing

## CalSIMETAW input csv files

The CalSIMETAW program basically runs it's processing on a per pixel basis, and
as such, they request weather inputs organized by pixel.  We use postgresql to
convert from the per image organization to the per pixel organization.

```{bash}
cimis_host=cimis.casil.ucdavis.edu
cimis_gdb=/home/quinn/gdb/cimis/quinn
cimis_bin=~/bin/get.one.year

prism_host=localhost
prism_gdb=/home/quinn/dwr-calsimetaw/gdb/prism
prism_bin=~/bin/get.one.prism.water.year

year=2016;
for d in prism cimis; do
  eval host=\$${d}_host;
  eval mapset=\$${d}_mapset;
  eval bin=\$${d}_bin;
  ssh -t quinn@${host} "year=$year GRASS_BATCH_JOB=$bin grass ${mapset}" |\
    tail -n +5 | head -n-4 > ${d}_wy${year}.csv
done
```

This method executes a grass batch file on the Spatial CIMIS server, and the
server that contains the prism data.  These are pretty simple files, and
alternatively, you could run those scripts directly from grass.

``` bash
#! /bin/bash
# This is for a calendar year
#run with export GRASS_BATCH_JOB=~/bin/get.one.year; year=2016 grass /home/quinn/gdb/cimis/quinn

g.region rast=state@4km
r.mask -o state@4km
# These are the parameters for PRISM data
declare -a vars=('tmin' 'tmax' 'ppt' 'ETo' 'rf')
# If you are extracting CIMIS data, there are more data to retrieve
# declare -a vars=('Tn' 'Tx' 'Tdew' 'U2' 'ETo' 'K' 'Rnl' 'Rs')


printf -v head "%s," "${vars[@]}"
head="date,x,y,${head%?}"    # Remove the final character of head

echo $head
for m in $(g.mapsets -l fs=newline | grep ^${year} ); do
    printf -v dvars "%s@${m}," "${vars[@]}";
    dvars=${dvars%?};
    r.out.xyz --q fs=',' input=$dvars | perl -p -e "s/^/$m,/";
done

```

``` bash
#! /bin/bash
# This example is for a water year.
#run with export GRASS_BATCH_JOB=~/bin/get.one.year; year=2010 grass
/home/quinn/gdb/cimis/quinn
let b_year=${year}-1;

g.region rast=MASK@4km
r.mask -o MASK@4km
declare -a vars=('Tn' 'Tx' 'Tdew' 'U2' 'ETo' 'K' 'Rnl' 'Rs')
#declare -a vars=('Tn' 'Tx' 'ETo' )
printf -v head "%s," "${vars[@]}"
head="date,x,y,${head%?}"    # Remove the final character of head

echo $head
for m in $(g.mapsets -l fs=newline | grep ^${b_year}-1.-..; g.mapsets -l
fs=newline | grep ^${year}-0.-..); do
    printf -v dvars "%s@${m}," "${vars[@]}";
	    dvars=${dvars%?};
		    r.out.xyz --q fs=',' input=$dvars | perl -p -e "s/^/$m,/";
			done

```

The postgresql processing uploads the above data into a temporary file, and then reformats it to a pixel oriented format.  This format stores arrays of values by water year.   This is in the hopes that eventually we will have the ability to make a more general API for per-point access to this data.  The database I use is typically ```eto```.

The PRISM data is calculated and exported first.

```{sql}
\set pwd `pwd`
\set year 2016
set search_path=prism,public;
delete from prism_wy where year=:year
select * from prism_create_by_day(:year,:'pwd'||'/prism_wy'||:'year'||'.csv');
select * from prism_add_to_wy(:year);
-- Now we've updated the table prism_wy for the new water year
-- Export to csv files.
select * from prism_out_wy(:'pwd'||'/prism_wy2016',:year);
```

This is followed with the CIMIS data.  Note that CIMIS data needs to follow prism data since it uses the PRISM precipitation data.  In the cimis_add_to_wy() function.

```{sql}
\set pwd `pwd`
\set year 2016
set search_path=cimis,public;
delete from cimis_wy where year=:year
select * from cimis_create_by_day(:year,:'pwd'||'/cimis_wy'||:'year'||'.csv');
select * from cimis_add_to_wy(:year);
-- Now we've updated the table cimis_wy for the new water year
-- Export to csv files.
select * from cimis_out_wy(:'pwd'||'/cimis_wy2016',:year);
```

### CIMIS ET test

In order to test some CIMIS ET calculations, I also needed our grass ETo calcuations.  I made another outputer, so I could run:

```{sql}
\set pwd `pwd`
\set year 2015
set search_path=cimis,public;
select * from et_out_wy(:'pwd'||'/cimis_et_wy2015',:year);
```
