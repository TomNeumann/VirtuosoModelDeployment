#!/usr/bin/env bash

bin="isql-vt"
port=1111
user="dba"
password="dba"
cmd="${bin} ${port} ${user} ${password}"

exec 3<&0

for graph_file in *.graph;
do
    exec 0< ${graph_file}
    read graph
    echo ${graph}
    ${cmd} exec="dump_one_graph ('${graph}', '/tmp/graphdump_');"
    cp /tmp/graphdump_000001.ttl ${graph_file%.graph}
    echo ${graph_file%.graph}
    ./normalize.sh ${graph_file%.graph}
done

exec 0<&3

if [ "$1" == "commit" ]
then
    echo "commit changes …"
    git add -u
    git commit -m "backup"
    git push
fi
