#!/usr/bin/env bash

set -Eeuo pipefail

if [[ "$(uname -s)" = "Darwin" ]]; then
  EXTRA_CFLAGS="--extra-cflags=-I/opt/homebrew/include"
  EXTRA_LDFLAGS="--extra-ldflags=-L/opt/homebrew/lib"
fi

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
  $EXTRA_CFLAGS \
  $EXTRA_LDFLAGS

bear -- make -j8
sudo make install
