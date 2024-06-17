#
# Copyright 2024 Datastrato Pvt Ltd.
# This software is licensed under the Apache License version 2.
#
mkdir -p /opt/spark/conf
cp /tmp/spark/spark-defaults.conf /opt/spark/conf
wget https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.4_2.12/1.5.2/iceberg-spark-runtime-3.4_2.12-1.5.2.jar  -O /opt/spark/jars/iceberg-spark-runtime-3.4_2.12-1.5.2.jar
wget https://repo1.maven.org/maven2/com/datastrato/gravitino/spark-runtime-3.4/0.5.1/spark-runtime-3.4-0.5.1.jar  -O /opt/spark/jars/spark-runtime-3.4-0.5.1.jar
wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.27/mysql-connector-java-8.0.27.jar -O /opt/spark/jars/mysql-connector-java-8.0.27.jar
sh  /tmp/common/init_metalake_catalog.sh
tail -f /dev/null
