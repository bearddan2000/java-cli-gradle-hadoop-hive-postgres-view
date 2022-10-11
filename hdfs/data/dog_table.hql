create database if not exists animal;

use animal;

create external table if not exists dog (
  id int,
  breedId int,
  colorId int
)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile location 'hdfs://namenode:8020/user/hive/warehouse/animal/dog';

create index idx_breed on table dog(breedId) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;
create index idx_color on table dog(colorId) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;
