#! /usr/bin/env bash
#wget endf files in parallel!

cat endf_download_list.sh | parallel
mkdir downloaded_endf_files
mv endf_*_vii1 downloaded_endf_files/.
