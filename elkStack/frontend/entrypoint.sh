#!/bin/bash

echo "Testing  Elasticsearch Availability"
while true; do
    nc -w 1 -z -v indexer 9200 2>/dev/null && break
    echo "Waiting for ElasticSearch...."
    sleep 5
done

exec kibana
