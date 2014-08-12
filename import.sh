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
    ${cmd} exec="sparql CREATE SILENT GRAPH <${graph}>;"
done

exec 0<&3

${cmd} exec="ld_dir ('${PWD}', '*.ttl', NULL);"
${cmd} exec="rdf_loader_run();" &
${cmd} exec="rdf_loader_run();" &
${cmd} exec="rdf_loader_run();" &
${cmd} exec="rdf_loader_run();" &
${cmd} exec="rdf_loader_run();" &
${cmd} exec="rdf_loader_run();" &
${cmd} exec="rdf_loader_run();" &
wait
${cmd} exec="checkpoint;"
