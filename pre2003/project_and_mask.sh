## original data saved here:
# /data_backup/for_simetaw/


## setup:

# create a llwgs72 and teal83 location
g.mapset location=teal83 mapset=PERMANENT
# generate a mask based on the CIMIS grid
g.region rast=example_grid -pa 

north:      450000
south:      -650000
west:       -400000
east:       600000
nsres:      2000
ewres:      2000
rows:       550
cols:       500
cells:      275000

# generate the mask:
r.mapcalc "m = if(example_grid, 1, null())"

# expand the original mask by 10 * 2km radii in all directions
r.grow in=m out=m_growed radius=10

# make this the analysis mask
g.rename rast=m_growed,MASK

# set the new resolution:
g.region -p res=4000

north:      450000
south:      -650000
west:       -400000
east:       600000
nsres:      4000
ewres:      4000
rows:       275
cols:       250
cells:      68750


# generate an outline vector of the example grid:
r.to.vect in=MASK out=example_grid_outline feature=area --o

# inv-project to the original llwgs72 location:
g.mapset location=llwgs72 mapset=PERMANENT
v.proj in=example_grid_outline location=teal83 mapset=PERMANENT --o


# 
# we want to make sure that we don't loose any of the data near the edges when projecting, 
#
# d.frame -c frame=cubic at=50,100,0,50
# d.frame -c frame=bilinear at=50,100,50,100
# d.frame -c frame=nearest at=0,50,0,50

# 
# edges are nibbled
# 
r.proj --q location=llwgs72  in=us_ppt_1920.01 resolution=4000 out=us_ppt_1920.01  --o method=cubic
d.erase
d.rast us_ppt_1920.01
d.vect example_grid_outline type=boundary
d.text text=cubic font=Verdana_Bold col=black at=80,95 align=lr

# 
# edges are nibbled, but less so than cubic
# 
r.proj --q location=llwgs72  in=us_ppt_1920.01 resolution=4000 out=us_ppt_1920.01  --o method=bilinear
d.erase
d.rast us_ppt_1920.01
d.vect example_grid_outline type=boundary
d.text text=bilinear font=Verdana_Bold col=black at=80,95 align=lr

# edges are identical to mask
r.proj --q location=llwgs72  in=us_ppt_1920.01 resolution=4000 out=us_ppt_1920.01  --o method=nearest
d.erase
d.rast us_ppt_1920.01
d.vect example_grid_outline type=boundary
d.text text=nearest font=Verdana_Bold col=black at=80,95 align=lr



# test:
# start in llwgs72 location
r.in.arc type=CELL in=ppt/1920-1929/us_ppt_1922.01 out=test

# check MASK as appears in target region
d.rast test
d.vect example_grid_outline type=boundary

# switch to teal83
g.mapset location=teal83 mapset=PERMANENT 2>/dev/null

# project
r.proj --q location=llwgs72  in=test resolution=4000 out=test.proj method=nearest --o

# check:
d.rast test.proj
d.vect example_grid_outline  type=boundary

# looks ok!


# run script!
# run in ppt, tmax, tmin
# 
# must cd to that dir first
# 
# must be in GRASS, llwgs72 location
# 
./process_files.sh



# archive the input data
# something along these lines:
# tar cfz ppt_original_data.tar.gz original_data/


# process image files
# convert `ls ppt/*.png | sort -g` ppt.mpg


