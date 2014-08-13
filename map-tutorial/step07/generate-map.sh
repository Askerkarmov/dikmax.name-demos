#!/bin/sh

ogr2ogr -f GeoJSON countries.json ne_10m_admin_0_countries_lakes/ne_10m_admin_0_countries_lakes.shp
topojson -o world.json countries.json
