#!/bin/bash
#
set -x

export NAME="$( echo $1 | sed 's#.*/\([^/]*\)\.git#\1#' )"
export URL="$1"
echo "URL = $URL"

cat ../lib/common_job.xml | 
    sed "s#___URL___#$URL#" | 
    java -jar ~/lib/jenkins-cli.jar -auth tjordan:w8112358 -s http://localhost:8080 create-job "$NAME" 

