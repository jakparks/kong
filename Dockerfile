FROM devhub-docker.cisco.com/sto-ccc-docker-local/hardened_ubuntu:20.04-fips

USER root

ARG gh_token
ENV GITHUB_TOKEN $gh_token

ENV KONG_DATABASE off
ENV KONG_NGINX_DAEMON off
ENV KONG_PROXY_ACCESS_LOG /dev/stdout
ENV KONG_PROXY_ERROR_LOG /dev/stderr

RUN apt update \
	&& apt install -y \
		automake \
		build-essential \
		curl \
		file \
		git \
		libyaml-dev \
		libprotobuf-dev \
		m4 \
		perl \
		pkg-config \
		procps \
		unzip \
		valgrind \
		zlib1g-dev

RUN git clone https://github.com/jakparks/kong.git
