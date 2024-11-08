#!/usr/bin/env bash

set -Eeuo pipefail

./configure \
  --prefix="/opt/ffmpeg-4.4.2" \
  --enable-gpl \
  --enable-nonfree \
  --enable-shared \
  --enable-debug=3 \
  --disable-optimizations \
  --disable-stripping \
  --enable-libfdk-aac \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libx264 \
  --enable-libx265 \

bear -- make -j$(nproc)
sudo make install
