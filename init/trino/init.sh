#
# Copyright 2023 Datastrato Pvt Ltd.
# This software is licensed under the Apache License version 2.
#

sh  /tmp/common/init_metalake_catalog.sh

/etc/trino/update-trino-conf.sh
nohup /usr/lib/trino/bin/run-trino &

counter=0
while [ $counter -le 240 ]; do
  counter=$((counter + 1))
  trino_ready=$(trino --execute  "SHOW CATALOGS LIKE 'catalog_hive'"| grep "catalog_hive" | wc -l)
  if [ "$trino_ready" -eq 0 ];
  then
    echo "Wait for the initialization of services"
    sleep 5;
  else
    echo "Import the data of the Hive warehouse"
    trino < /tmp/trino/init.sql
    echo "Import ends"

    # persist the container
    tail -f /dev/null
  fi
done
exit 1
