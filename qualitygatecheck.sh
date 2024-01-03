#!/bin/bash
curl -u admin:phani http://54.177.239.231:9000/api/qualitygates/project_status?projectKey=java_app > check.json
scan_status=$(cat check.json | grep -i status | cut -d ":" -f 3 | cut -d "," -f 1 | tr -d '"')
if [[ $scan_status -eq OK ]]
then
  echo "sonar scan status is $scan_status.............!!!"
else
  echo "Sonar scan status is $scan_status please check ......!"
  exit 1;
fi
