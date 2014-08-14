#!/bin/sh

ogr2ogr -f GeoJSON subunits.json -where "ADM0_A3 = 'FRA'" ne_10m_admin_0_map_subunits/ne_10m_admin_0_map_subunits.shp
ogr2ogr -f GeoJSON countries.json -where "ADM0_A3 != 'FRA'" ne_10m_admin_0_countries_lakes/ne_10m_admin_0_countries_lakes.shp
topojson -o world.json --id-property ADM_A3,SU_A3 -- countries.json subunits.json

