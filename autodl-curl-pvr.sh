#!/bin/bash

title=$2
downloadUrl=$3
apiKey=$4
date=$(date -u +"%Y-%m-%d %H:%M:%SZ")
indexer=$5
apiUrl=$1

post_release() {
    {
        /usr/bin/curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "X-Api-Key: $apiKey" -X POST -d "$1" $apiUrl
    } &>/dev/null
}

get_api_url() {
    if [ -z "$apiUrl" ]; then
        echo 'No API URL set'
        exit
    fi
}

get_api_url

if [ -z "$indexer" ]; then
    post_release '{"title":"'"$title"'","downloadUrl":"'"$downloadUrl"'","protocol":"torrent","publishDate":"'"$date"'"}'
    exit
fi

post_release '{"title":"'"$title"'","downloadUrl":"'"$downloadUrl"'","protocol":"torrent","publishDate":"'"$date"'","indexer":"'"$indexer"'"}'
