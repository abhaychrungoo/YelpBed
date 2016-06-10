#!/bin/bash

echo "Testing  Elasticsearch Availability"
while true; do
    echo "Controller: Waiting for ElasticSearch...."
    nc -w 1 -z -v indexer 9200 2>/dev/null && break
    sleep 5
done
echo "Testing  Logstash Availability"
while true; do
    echo "Controller: Waiting for Logstash...."
    nc -w 1 -z -v ingester 9100 2>/dev/null && break
    sleep 5
done
echo "Testing  Kibana Availability"
while true; do
    echo "Controller: Waiting for Logstash...."
    nc -w 1 -z -v ingester 9100 2>/dev/null && break
    sleep 5
done

echo "Controller: Ready to replay data and install dashboard"
#magical sleep for a quick hack
sleep 25
#Kibana magic. Restore the kibana index to recreate the dashboard
echo "Creating Kibana Dashboards"
elasticdump --input="/visualizations/sushi-stars.json" --output=http://indexer:9200/.kibana  --type=data
echo "Done Creating Kibana Dashboards"
# Lets play the data
echo "Playing data"
nc ingester 9100 < /data/yelp_academic_dataset_business.json
echo "Done Playing data"
#Broadcast the Love
while true ; do
    echo "Sushi paradise at  http://localhost:5601/goto/ef1e9cdfea37a564275ae0b274fdc833 "
    sleep 10
done

