#!/bin/sh

if [ $# -eq 0 ]; then
	echo -e "\nUSAGE: $0 <path_to_H5AD_file>\n\n"
	exit 1
fi

address=$(curl http://checkip.amazonaws.com)

echo -e "\n\nhttp://${address}:5005\n\n"

cellxgene launch --host 0.0.0.0 --port 5005 $1



