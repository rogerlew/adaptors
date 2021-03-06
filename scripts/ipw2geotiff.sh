#!/bin/bash
#
# ipw2geotiff.sh
#
# Simplified version (operates on a single file) of the script written by Bill
# Hudspeth (ipw2GeoTiff.py) that will also only output band 8, "melt"
#
# Date: January 7, 2015

input_file=$1
band=$2

demuxed=$input_file.demux
demux -b $band $input_file > $demuxed

gridded=$input_file.gridded
ipw2grid $demuxed $gridded

pre_tiff=$input_file.pre.tif
gdal_translate $gridded.bip $pre_tiff

tiff=$input_file.$band.tif
gdalwarp -t_srs EPSG:26911 $pre_tiff $tiff

rm $gridded* $demuxed $pre_tiff
