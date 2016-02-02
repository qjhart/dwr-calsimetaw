# README #

Cal-SIMETAW is the code developed to create the historical record of
California weather; Tmin, Tmax, and PCP from PRISM data.  It also
creates a historical record of weather parameters from the Spatial
CIMIS dataset, Tn, Tx, Tdew, U2, Rs, Rso.

## Processing



### PRISM

In 2010, the DWR CalSIMETAW dataset was first developed.  At that time, PRISM data was only available at a monthly timestep. To create daily estimates, the monthly data was perturbed by spine fits to NCDC daily station data, to estimate  daily variation.  

In 2014, and error was discovered in the methodology used to correct for daily precipitation in the early decades, causing for an overestimate in the precipation for those years.  This data was corrected and redistributed in November 2014.

Subsequent to the original processing, PRISM data is also available for download at daily increments.  Because of this, since 2010, the data is provided by the daily prism data.


## Overview

* Daily estimates of ET and Precipitation
* Gridded on the Standard DWR grid
* Available from 1921 through the present day

The

33_12 46_7 64_18 80_19 113_34 114_34 119_32 120_32 121_33 121_34 122_34 137_47 138_48 139_49 140_50 148_60 154_56 168_64 173_67 174_68 225_90




## Installation

This requires a working version of GRASS for the GIS processing, and
Postgresql and PostGIS for vector processing.  Requires Postgres > 9.2
and PostGIS > 2.0.

The processing itself is a series of scripts driven primarily by
Makefiles that create the necessary data for processing.  Currently
there is not a single Makefile that runs the entire process

## Steps

### Download the prism data

Since 2010 PRISM has supplied daily data for processing.  One issue with this data is that they maintain a 6 month period where the data is identified as _provisional_.  Sometimes, we don't like to wait, and so we use some of the provisional data is input for the CIMIS data.

What data to try and download is determined by the location that you are currently using.  Schema _prism-stable_ retrieves stable data while _prism-provisional_ retrieves provisonal data.

Either way the process is the same, we use the prism/daily.mk script to fetch that data.  You need to be executing in grass for  this to work.

```{bash}
for d in `seq 1 364`; do
  m=`date --date="2014-10-01 + $d days" +%Y%m%d`;
  g.mapset -c $m;
  make -f daily.mk start_year=2014 end_year=2014
  tmin tmax ppt;
done
```

### Reproject to CIMIS

There currently is no makefile to do this.  We just do that by scripting, which is a bit dumb but there you are.  In the ca-daily-prism code, you use

```{bash}
# Let's say we have the first 212 days in stable, but the rest are provisional
d=212
for d in `seq 0 $d`; do
 date=`date --date="2013-01-01 + $d days" +%Y%m%d`;
 g.mapset -c $date; g.region rast=state@4km;
 for r in tmin tmax ppt; do
   r.proj input=$r location=prism-stable;
 done;
done
# Now the provisional data
for d in `seq $d 364`; do
 date=`date --date="2013-01-01 + $d days" +%Y%m%d`;
 g.mapset -c $date; g.region rast=state@4km;
 for r in tmin tmax ppt; do
   r.proj input=$r location=prism-provisional;
 done;
done
```

### Create the required input files


## Create TIF Files

```{bash}
for s in `seq 0 365`; do  
 d=$(date --date="2014-10-01 + $s days" +%Y%m%d); 
 iso=$(date --date="2014-10-01 + $s days" --iso); 
 g.mapset $d; 
 i.group group=ee input=ETo,ppt,tmax,tmin,ETh,srha,Ra; 
 start=$(date --date="$d" +%s000); end=$(date --date="$d + 24hours" +%s000); 
 r.out.gdal input=ee output=$iso.tif type=Float32;
done
```

## Contact

* Quinn Hart <qjhart@ucdavis.edu>
* DWR
