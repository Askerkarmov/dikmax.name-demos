#!/bin/sh

ogr2ogr -f GeoJSON subunits.json -where "ADM0_A3 = 'FRA'" ne_10m_admin_0_map_subunits/ne_10m_admin_0_map_subunits.shp
ogr2ogr -f GeoJSON countries.json -where "ADM0_A3 != 'FRA' and ADM0_A3 != 'RUS' and ADM0_A3 != 'USA'" ne_10m_admin_0_countries_lakes/ne_10m_admin_0_countries_lakes.shp
ogr2ogr -f GeoJSON regions.json -where "ADM0_A3 = 'RUS' or ADM0_A3 = 'USA'" ne_10m_admin_1_states_provinces_lakes/ne_10m_admin_1_states_provinces_lakes.shp
topojson -o world.json --id-property ADM_A3,SU_A3,adm1_code --properties name,NAME -- countries.json subunits.json regions.json
