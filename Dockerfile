FROM anvibo/nginx-php:7.2

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install \
	wget \
	php7.2-xml \
	php7.2-mysql \
	php7.2-mbstring \
	php7.2-gd \
	php7.2-ldap \
	php7.2-zip \
	php7.2-imap \
	php7.2-pgsql \
&& rm -rf /var/lib/apt/lists/* \ 
&& wget -O /tmp/ls.tar.gz "https://github.com/LimeSurvey/LimeSurvey/archive/3.14.7+180827.tar.gz" \
&& apt-get remove --purge -y wget \
&& apt-get autoremove --purge -y \
&& cd /tmp && tar zxf /tmp/ls.tar.gz \
&& mv /tmp/LimeSurvey-*/* /app/ \
&& rm -rfv /tmp/* 

RUN chown -R www-data:www-data /app/tmp
RUN chown -R www-data:www-data /app/upload
RUN chown -R www-data:www-data /app/application/config
RUN chown -R www-data:www-data /var/lib/php/sessions 
