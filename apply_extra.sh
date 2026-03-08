#!/bin/bash

# Extract the downloaded tarball
tar -xzf keet.tar.gz

# The tarball extracts a single Keet.AppImage file.
# Use unappimage to extract the AppImage without needing /proc/self/exe
# (which is not available in the Flatpak sandbox during apply_extra)
chmod +x Keet.AppImage
unappimage Keet.AppImage

# Move the extracted squashfs-root contents to the permanent /app/extra directory
mv squashfs-root keet

# Clean up to minimize disk usage footprint
rm -rf keet.tar.gz Keet.AppImage squashfs-root
