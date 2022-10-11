use animal;

create view if not exists dogextended AS
  SELECT a.id, breed, color
  FROM dog a
  JOIN breedLookup b ON b.id = a.breedId
  JOIN colorLookup c ON c.id = a.colorId;
