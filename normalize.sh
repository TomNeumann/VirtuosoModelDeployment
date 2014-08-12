#!/usr/bin/env bash

ttl_file=$1

cp prefixes.ttl ${ttl_file%.ttl}.nt
rapper -q -i turtle -o ntriples ${ttl_file} | sort -u >> ${ttl_file%.ttl}.nt
rapper -q -i turtle -o turtle ${ttl_file%.ttl}.nt > ${ttl_file}
