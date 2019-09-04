#!/bin/bash

MAKEFILE=$1

grep -E '^[a-zA-Z_-]+:.*?## .*$$' $MAKEFILE | sort | awk 'BEGIN {FS = ":.*?## "}; { printf "%-40s %s\n", $1, $2 }'
