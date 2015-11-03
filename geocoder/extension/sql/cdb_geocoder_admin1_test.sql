-- Check that the geocoding functions are callable, should return NULL
SELECT (geocode_admin1_polygons(Array['TX','Cuidad Real', 'sevilla'])).*;
SELECT (geocode_admin1_polygons(Array['NH', 'Vermont'], 'United States')).*;
SELECT (geocode_admin1_polygons(Array['az', 'az'], Array['Ecuador', 'USA'])).*;

-- Add a few data to the sources
INSERT INTO global_province_polygons (the_geom, synonyms, iso3) VALUES (
  '0106000020E610000001000000010300000001000000040000000000000000E000C01F383D7839B740400000000000E000C0AA3C0EDE220F3B4000000000004812404FB7FCCD04893D400000000000E000C01F383D7839B74040',
  Array['vipava','obcina vipava','vipava, obcina'],
  'SVN'
);

-- Check that the synonym function is callable, should return true
SELECT (geocode_admin1_polygons(Array['obcina vipava'])).success;

-- Check that it returns the mocked geometry above
SELECT (geocode_admin1_polygons(Array['obcina vipava'])).geom;

