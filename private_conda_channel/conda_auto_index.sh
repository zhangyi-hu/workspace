#!/usr/bin/env bash

inotifywait -r -m -e modify -e move -e create -e delete $conda_dir/linux-64/ |
  while read dir action file; do
    if [[ "$file" == *.tar.bz2 ]]; then
      conda index $conda_dir
    fi
  done
