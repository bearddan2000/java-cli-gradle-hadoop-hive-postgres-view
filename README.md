# java-cli-gradle-hadoop-hive-postgres-view

## Description
Creates a small database table
called `dog`. This table, `dog`, has been normalized to 3NF.

Two non-clustered indexes where add to `dog`; `idx_breed`
and `idx_color`.

Two new tables have been added, `breedLookup` and `colorLookup`.
Creates a new view `dogextended` that joins
`dog`, `breedLookup` and `colorLookup`. 

All output normally
seen in a terminal will be in `log` which will dump to the screen. The project may seem to hang but the logs from the container must be written to the project this can take up to 3 min.

A java gradle build, that connects to hadoop filesystem.
Hive is used in place of map reduce to translate queries.
A postgres database stores meta data about objects on `hdfs`.

## Tech stack
- java
- gradle
  - hive drivers
- hadoop
  - hdfs
- hive
  - hql
- postgres

## Docker stack
- bde2020/hadoop-datanode:2.0.0-hadoop2.7.4-java8
- bde2020/hive:2.3.2-postgresql-metastore
- bde2020/hive-metastore-postgresql:2.3.0
- gradle:jdk11

## To run
`sudo ./install.sh -u`

## To stop
`sudo ./install.sh -d`

## For help
`sudo ./install.sh -h`

## Credit
[Hive setup based on](https://hshirodkar.medium.com/apache-hive-on-docker-4d7280ac6f8e)
