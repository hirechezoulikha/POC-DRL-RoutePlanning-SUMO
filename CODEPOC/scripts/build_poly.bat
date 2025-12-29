@echo off
setlocal

set SUMO_BIN=C:\Program Files (x86)\Eclipse\Sumo\bin
set SUMO_DATA=C:\Program Files (x86)\Eclipse\Sumo\data

set NET=..\data\bari.net.xml
set OSM=..\data\bari.osm
set POLY=..\data\bari.poly.xml

"%SUMO_BIN%\polyconvert.exe" ^
 --net-file "%NET%" ^
 --osm-files "%OSM%" ^
 --type-file "%SUMO_DATA%\typemap\osmPolyconvert.typ.xml" ^
 --output-file "%POLY%"

echo.
echo Built: %POLY%
endlocal
