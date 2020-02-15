FROM ubuntu:14.04

ENV MEDIAFIRE_FUSE_VERSION 0.90
WORKDIR /srv

RUN apt update \
	&& apt install -y git cmake build-essential libjansson-dev libcurl4-openssl-dev libfuse-dev libssl-dev

RUN git clone https://github.com/MediaFire/mediafire-fuse \
	&& cd mediafire-fuse \
	&& git checkout $MEDIAFIRE_FUSE_VERSION \
	&& mkdir -p build \
	&& cd build \
	&& cmake .. \
	&& make \
	&& make install \
	&& mkdir -p /mediafire/data

CMD mediafire-fuse -u $MEDIAFIRE_USERNAME -p $MEDIAFIRE_PASSWORD /mediafire/data  \
	&& FOR_100_YEARS=$((100*365*24*60*60));while true;do sleep $FOR_100_YEARS;done

