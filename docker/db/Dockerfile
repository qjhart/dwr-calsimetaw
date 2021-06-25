#from postgis/postgis:13-master
from kartoza/postgis:13

LABEL authors="Quinn Hart"
LABEL maintainer="qjhart@ucdavis.edu"

# system environment
#ENV DEBIAN_FRONTEND noninteractive

#USER root
# GRASS GIS compile dependencies
#RUN apt-get update \
#    && apt-get install -y --no-install-recommends --no-install-suggests \
#	unzip curl vim less \
#	& apt-get autoremove && apt-get clean


COPY initdb.d/ /docker-entrypoint-initdb.d
