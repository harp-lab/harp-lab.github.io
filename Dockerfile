FROM ubuntu:24.04

ENV SETUPDIR=/setup
WORKDIR ${SETUPDIR}
ARG GEMFILE_DIR=.
COPY $GEMFILE_DIR/Gemfile* $GEMFILE_DIR/packages* ./

# Install build dependencies
RUN set -eux; \
    apt-get update && apt-get install -y \
        build-essential \
        zlib1g-dev \
        ruby-full \
        ruby-bundler \
    ;

# Install Bundler
RUN set -eux; gem install bundler

# Install extra packages if needed
RUN set -eux; \
	if [ -e packages ]; then \
	    apt-get install -y $(cat packages); \
    fi

# Install gems from `Gemfile` via Bundler
RUN set -eux; bundler install

# Remove build dependencies
RUN set -eux; apt-get remove -y $(cat packages); \
    apt-get autoremove -y; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

# Clean up
WORKDIR /srv/jekyll
RUN set -eux; \
    rm -rf \
        ${SETUPDIR} \
        /usr/gem/cache \
        /root/.bundle/cache \
    ;

EXPOSE 4000
ENTRYPOINT ["bundler", "exec", "jekyll"]
# CMD ["jekyll", "--version"]
