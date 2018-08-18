FROM ruby:2.4

WORKDIR /usr/src
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "libldap-2.4-2", "libidn11-dev", "dnsutils", "postgresql-client", "-y"]
RUN gem install idn-ruby -v '0.1.0'
COPY . /usr/src
RUN ["bundle", "install"]
ADD startup_script.sh startup_script.sh
CMD ["/bin/bash", "startup_script.sh"]
