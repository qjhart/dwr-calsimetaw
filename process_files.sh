#! /bin/bash
# set -e

# d.monsize setmonitor=x0 setwidth=400 setheight=500


# 
# do this for each (14  minutes per set of dirs)
# ppt	[X]
# tmax	[]
# tmin 	[]
# 2000-2007 []
# 
for dir in *
do
echo "Processing $dir files..."

cd $dir

# unzip files (21 seconds per dir)
#
# there may be some bogus files in the lot...
# echo "unzipping ..."
# for x in *.gz ; do gunzip $x ; done

# llwgs72 location
# load original data (43 seconds per dir):
# 
# note that r.in.gdal causes problems when the input file is recognized as Int16 but really contains Int32 values!!
# 
# r.in.arc is a temp fix
# 
echo "importing ..."
for x in * ; do r.in.arc type=CELL in=$x out=$x --o 2>/dev/null ; done

# switch to teal83
g.mapset location=teal83 mapset=PERMANENT 2>/dev/null

# teal83 location
# project to teal83 and MASK out everything but CA ( 37 seconds per dir):
echo "projecting and masking ..."
for x in * ; do r.proj --q location=llwgs72  in=$x resolution=4000 out=$x method=nearest --o 2>/dev/null ; done

# save back to disk as ASCII GRID (9 seconds per dir):
echo "exporting to AA GRID ..."
for x in * ; do r.out.arc --q in=$x out=${x}_teal83_ca.asc 2>/dev/null ; done

# archive and compress:
echo "archiving output ..."
tar cfz ../archive_${dir}.tar.gz *.asc && rm *.asc

# save image
# echo "saving image ..."
# for x in * ; do d.erase ; d.rast $x ; d.out.file --o out=../$x ; done 
# d.barscale -l bcol=none at=0,95 ;  d.legend -f test.proj at=50,95,70,75 



# clean-up
echo "clean-up ..."
g.mremove  --q -f rast=us* 2>/dev/null

## switch back to llwgs72
g.mapset location=llwgs72 mapset=PERMANENT 2>/dev/null
g.mremove  --q -f rast=us* 2>/dev/null

cd ../

done