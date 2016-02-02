

## step 1: get the data

# http://www.akadia.com/services/wget.html
# download all of the precip data: 
# /data_backup/for_simetaw/
# cd ppt
wget -r --no-parent -A.gz ftp://ftpdplasp.water.ca.gov/outgoing/Matthias_Falk/Prism/Precip/

# tmin data:
# cd tmin
wget -r --no-parent -A.gz ftp://ftpdplasp.water.ca.gov/outgoing/Matthias_Falk/Prism/Tmin

# tmax data:
# cd tmax
wget -r --no-parent -A.gz ftp://ftpdplasp.water.ca.gov/outgoing/Matthias_Falk/Prism/Tmax



## step 2: process the data


# for each file:
# 	import into LL WGS72
# 	warp to teal albers, using CA mask
# 	export to tiff



## 2.1 project to Ca Teal Albers
# 
# Projection: Albers
# Parameters:
#   False_Easting: 0.000000
#   False_Northing: -4000000.000000
#   Central_Meridian: -120.000000
#   Standard_Parallel_1: 34.000000
#   Standard_Parallel_2: 40.500000
#   Latitude_Of_Origin: 0.000000
# Linear Unit: Meter (1.000000)
# Geographic Coordinate System:
# Name: GCS_North_American_1983
# Alias:
# Abbreviation:
# Remarks:
# Angular Unit: Degree (0.017453292519943295)
# Prime Meridian: Greenwich (0.000000000000000000)
# Datum: D_North_American_1983
#   Spheroid: GRS_1980
#     Semimajor Axis: 6378137.000000000000000000
#     Semiminor Axis: 6356752.314140356100000000
#     Inverse Flattening: 298.257222101000020000
# 



## didn't use this, used GRASS projection to enfore masking
# gdalwarp -s_srs '+proj=longlat +datum=WGS72' -t_srs '+proj=longlat +datum=NAD83' \
# -srcnodata -9999 -dstnodata -9999 -r cubic \
# from_dwr/us_ppt_1997.14 processed/us_ppt_1997.14.tif






