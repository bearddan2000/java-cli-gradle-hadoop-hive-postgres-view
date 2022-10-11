use animal;

create external table if not exists breedLookup (
  id int,
  breed VARCHAR(20)
)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile location 'hdfs://namenode:8020/user/hive/warehouse/animal/breedLookup';
