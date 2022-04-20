#!/bin/sh
set -o errexit
set -o nounset
set -o pipefail

if [ ! -f GeoLite2-City.mmdb ]; then
  curl "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City&license_key=$MAXMIND_LICENSE_KEY&suffix=tar.gz" \
    | tar zxv --strip-components=1
fi

geoip
