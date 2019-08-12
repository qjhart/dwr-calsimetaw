from neteler/grassgis7:latest

LABEL authors="Quinn Hart"
LABEL maintainer="qjhart@ucdavis.edu"

# system environment
ENV DEBIAN_FRONTEND noninteractive

USER root
# GRASS GIS compile dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
	unzip curl \
	&& apt-get autoremove && apt-get clean

USER grass
COPY ./daily.mk /home/grass

CMD ["/usr/local/bin/grass", "--version"]
