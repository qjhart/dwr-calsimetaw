# CalSIMETAW Weather data exchange

This is a temporary solution to the problem of sharing weather data with the CalSIMETAW program.  We continue to work with CalSIMETAW on a final solution to sharing this data.

## 2016-02-25 Updates to 2015-12-31

Some programs prefer to use regular years (as opposed to water years 10-01 through 9-30) for processing.  This update adds the first quarter of the the 2016 water year.  The  zip files are appended with a _q1_p to designate they are the first quarter only and are also provisional.  The data will be removed on completion of the complete 2016 water year.

* [cimis_wy2016_q1p.zip](cimis_wy2016_q1p.zip)
* [prism_wy2016_q1p.zip](prism_wy2016_q1p.zip)

Since more PRISM data has been transferred into the _stable_ distribution the 2015 water year we considered updating the 2015 water year as well.  However, since not all data is in the _stable_ distribution, we have not updated those yet.   To explicitly note that, we've appended a _p_ to those files as well to designate the preliminary status of some the data.

* [cimis_wy2015_p.zip](cimis_wy2015_p.zip)
* [prism_wy2015_p.zip](prism_wy2015_p.zip)

Finally, for prism, the 2015 calendar year has been zipped as well.  This is exactly the same data as found by combining the ```prism_wy2015_p``` and ```prism_wy2016_q1p``` data, removing the 2014  months, and renaming the files with a  ```daily_``` prefix.

* [prism_2015.zip](prism_2015.zip)

For CIMIS, the standard water year data has been slightly modified to conform with the
legacy data access.  Some of the colums from the complete CIMIS data are removed

```{bash}
# Get only 2015 from the 2015 water year
for i in wy2015/cimis_*.csv; do
 n=`basename $i`;
 grep -v ',2014-..-..,' $i | cut -d, -f 1-9,14 > $n;
done
# Combine with 2016 (q1) data for the complete 2015 calendar year
for i in wy2016/cimis_*.csv; do
 n=`basename $i`;
tail -n+2 $i | cut -d, -f 1-9,14 >> $n;
done
```

* [cimis_2015.zip](cimis_2015.zip)


## 2015-11-02 Water Year 2015-11

Preliminary water year 2015 data has been uploaded.  

* [cimis_wy2015.zip](cimis_wy2015.zip)
* [prism_wy2015.zip](prism_wy2015.zip)

Recall that, for convenience, the cimis data includes precipitation estimates from the PRISM data, and so requires PRISM data processing first for those data.

WE've simplified the download, there is only one file for the prism data, and one for the cimis data, instead of one per row.  The files are ~200Mb. The prism filename prefix is changed from daily_???_??.csv to prism_???_??.csv to match the cimis filenames.
