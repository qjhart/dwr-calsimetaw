# README #

Cal-SIMETAW is the code developed to create the historical record of California weather; Tmin, Tmax, and PCP from PRISM data.  It also creates a historical record of weather parameters from the Spatial CIMIS dataset.

### Overview ###

* Daily estimates of ET and Precipitation 
* Gridded on the Standard DWR grid
* Available as a PostgreSQL database

### Installation ###

This requires a working version of GRASS for the GIS processing, and Postgresql and PostGIS for vector processing.  Requires Postgres > 9.2 and PostGIS > 2.0.  

The processing itself is a series of scripts driven primarily by Makefiles that create the necessary data for processing.   Currently  there is not a single Makefile that runs the entire process


### Contact ###

* Quinn Hart <qjhart@ucdavis.edu>
* DWR