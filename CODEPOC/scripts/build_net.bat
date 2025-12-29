@echo off
setlocal

set SUMO_BIN=C:\Program Files (x86)\Eclipse\Sumo\bin

set OSM=..\data\bari.osm
set NET=..\data\bari.net.xml

"%SUMO_BIN%\netconvert.exe" ^
 --osm-files "%OSM%" ^
 --output-file "%NET%" ^
 --keep-edges.by-vclass passenger,delivery ^
 --remove-edges.isolated ^
 --roundabouts.guess ^
 --junctions.join ^
 --tls.guess

echo.
echo Built: %NET%
echo Edge count:
findstr "<edge" "%NET%" | find /c "<edge"

endlocal

