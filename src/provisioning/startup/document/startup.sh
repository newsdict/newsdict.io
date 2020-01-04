#!/bin/bash
# set env
. $(dirname $BASH_SOURCE)/../bootstrap.sh document $1
/usr/sbin/nginx -c /etc/nginx/nginx.conf
cd /var/www/docker
yarn install --check-files
# Compile docs
for i in $(find src/doc -name '*.adoc')
do
    _file=$i
    _name=$(echo $i | sed "s#src/##" |sed 's/\.adoc//')
    bundle exec asciidoctor -r asciidoctor-diagram $_file -o $_name.html
done
bundle exec yard
# Watch to modify
if [ "$RAILS_ENV" != "production" ];then
  bundle exec guard
else
  tail -f /var/log/nginx/access.log
fi