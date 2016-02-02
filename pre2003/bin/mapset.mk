#!/usr/bin/make -f

ifndef configure.mk
include configure.mk
endif


$(call grass_or_die)

GISDBASE:=$(shell g.gisenv get=GISDBASE)
LOCATION_NAME:=$(shell g.gisenv get=LOCATION_NAME)
MAPSET:=$(shell g.gisenv get=MAPSET)

YYYY:=$(word 2,$(subst -, ,f-${MAPSET}))
MM:=$(word 3,$(subst -, ,f-${MAPSET}))
DD:=$(word 4,$(subst -, ,f-${MAPSET}))

# Generic vol.rst parmeters
WIND3:=$(loc)/$(MAPSET)/WIND3
DEFAULT_WIND3:=$(loc)/PERMANENT/WIND3

# Shortcut Directories
gdb:=${GISDBASE}
loc:=$(GISDBASE)/$(LOCATION_NAME)
map:=$(GISDBASE)/$(LOCATION_NAME)/${MAPSET}
rast:=$(loc)/$(MAPSET)/cellhd
vect:=$(loc)/$(MAPSET)/vector
etc:=$(loc)/$(MAPSET)/etc


####################################
# Mapset specific
####################################

ifeq (${MAPSET},${db})

else # is YEAR

ifeq (${MM},)

else

ifeq (${DD},)

is_monthly=${MAPSET}

else

is_daily:=${MAPSET}
monthly-mapset:=${YYYY}-${MM}
monthly-rast:=$(loc)/$(monthly-mapset)/cellhd


endif #DD

endif #MM

endif # Year or no


info::
	echo ${y-d}

yms:
	@echo ${yms}
