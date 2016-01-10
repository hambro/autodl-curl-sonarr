# autodl-curl-sonarr
Script to use as upload-command for autodl-irssi to post torrents to Sonarr

Obviously you will need autodl-irssi (https://github.com/autodl-community) and Sonarr (https://sonarr.tv/) installed for this to work.  You will also need curl.

Download the file autodl-curl-sonarr.sh and put it wherever you want.  You may need to edit the last line of the script with the address for Sonarr.  But default it is "http://localhost:8989/api/release/push".  See https://github.com/Sonarr/Sonarr/wiki/API.  Make the script executable for the user running autodl-irssi 

Set up your autodl.cfg to include this, either in the global [options] header or for specific [filter]s as you see fit:


upload-type = exec

upload-command = /path/to/autodl-curl-sonarr.sh

upload-args = "$(TorrentName)" "$(TorrentUrl)" <YOUR SONARR API KEY>


You can set up autodl-irssi filters to simply match everything and let Sonarr decide what it should download based upon your Sonarr configuration.
