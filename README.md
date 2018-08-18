Freedbin
========

Feedbin is a simple, fast and nice looking RSS reader - this fork provides a version intended for users who
want to host their own copy of it for free, that can be run anywhere with Docker.

Requirements
------------

 - Docker
 - docker-compose

Installation
-------------

 - `wget https://github.com/rachel-sharp/freedbin/blob/master/docker-compose.yml`
 - Set config values in the `docker-compose.yml` file
   - `MERCURY_API_KEY` - External Web Article Parser, [sign up for free here](https://mercury.postlight.com/web-parser/)
   - `SECRET_KEY_BASE` - Rails Secret Key which needs to be set for security reasons, [explained more here](https://medium.com/@michaeljcoyne/understanding-the-secret-key-base-in-ruby-on-rails-ce2f6f9968a1)
 - `docker-compose up`
 - Access the app from `localhost:9292` (first request can take a little while)