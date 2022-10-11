#!/usr/bin/env bash

hadoop fs -mkdir -p    /tmp
hadoop fs -mkdir -p    /user/hive/warehouse

  function create() {
    #statements
    local name=$1

    hive -f "${name}_table.hql"

  }

  function create_insert() {
    #statements
    local name=$1

    create $name \
    && hdfs dfs -put -f ./$name.csv /user/hive/warehouse/animal/$name
  }

  cd /dog
  create_insert "dog"
  create_insert "breedLookup"
  create_insert "colorLookup"
  create "dogextended"

  hadoop fs -chmod -R g+w   /user/hive/warehouse
  hadoop fs -chmod -R g+w   /tmp

cd $HIVE_HOME/bin
./hiveserver2 --hiveconf hive.server2.enable.doAs=false
