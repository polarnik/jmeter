#!/bin/bash -x

TOKEN="eyJrIjoiTUlHcHE2ekVoZGNKOVBpS2FwajBac2RJWVNJZjBYTjQiLCJuIjoidmlld2VyIiwiaWQiOjF9"
DASHOARD_ID="GrafanaJMeterTemplate"

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"


curl -H "Authorization: Bearer $TOKEN" "http://localhost:3000/api/dashboards/uid/$DASHOARD_ID" -o "/tmp/tmp.$DASHOARD_ID.json"

jq .dashboard "/tmp/tmp.$DASHOARD_ID.json" > "$DIR/$DASHOARD_ID.json"

rm "/tmp/tmp.$DASHOARD_ID.json"

#git add "$DIR/$UID.json"
#git commit -m "Update $UID"
