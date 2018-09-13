FROM anvibo/nginx-php:7.0

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get --no-install-recommends -y install \
	curl \
	php7.0-xml \
	php7.0-mysql \
	php7.0-mbstring \
	php7.0-gd \
	php7.0-ldap \
	php7.0-zip \
	php7.0-imap \
	php7.0-pgsql \
&& rm -rf /var/lib/apt/lists/* \
&& curl -o /tmp/ls.tar.gz "https://github.com/LimeSurvey/LimeSurvey/archive/3.14.7+180827.tar.gz" \
&& cd /tmp && tar zxf /tmp/ls.tar.gz \
&& mv /tmp/LimeSurvey-*/* /app/ \
&& rm -rfv /tmp/* \

RUN chown -R www-data:www-data /app/tmp
RUN chown -R www-data:www-data /app/upload
RUN chown -R www-data:www-data /app/application/config
RUN chown -R www-data:www-data /var/lib/php/sessions 
