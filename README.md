This collection of scripts can be used to import and backup models managed in virtuoso.
For each model you have to maintain a `model.ttl` file and a`model.ttl.graph` file, which contains the graph URI.

You have to define the `dump_one_graph` command in virtuoso before  [Bulk Loading RDF Source Files into one or more Graph IRIs](http://virtuoso.openlinksw.com/dataspace/doc/dav/wiki/Main/VirtBulkRDFLoader).

The `normalize.sh` script is for sorting the triples and transforming them into a format that after running the `backup.sh` the resulting diff will be as minimal as possible.
