#!/usr/bin/env bash

# Clean Packages
rm -rf deb-packed/*
rm -rf Packages.bz2
rm -rf Packages.gz

# Build Packages
cd deb-extracted
for folder in *; do dpkg-deb -Zgzip -b $folder ../deb-packed/$folder.deb; done
cd ..
cp deb-mirror/*.deb deb-packed

# Create Package Metadata
dpkg-scanpackages deb-packed > Packages
bzip2 -k Packages
gzip -k Packages
