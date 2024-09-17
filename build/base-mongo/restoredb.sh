#!/bin/bash

set -e

# Initialize database if does not exist
if [ $(mongosh localhost:27017 --eval 'db.getMongo().getDBNames().indexOf("sefaria")' --quiet) -lt 0 ]; then
  echo Decompressing mongodb...
  tmp_path=/tmp/dump
  rm -fr ${tmp_path}
  tar -zxf ${tmp_path}.tar.gz -C /tmp --verbose

  echo Restoring db...
  mongorestore --drop ${tmp_path}
  rm -fr ${tmp_path}
fi
