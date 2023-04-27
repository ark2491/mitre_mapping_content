#!/bin/bash
# just a dumb script to get the data required to make the csv

echo "mitre_group,technique_id" > mitre_technique_to_group.csv

for i in `curl -s https://attack.mitre.org/groups/ | egrep -o 'href\=\"\/groups\/G[0-9]+' | egrep -o 'G[0-9]+' | sort -u`
do
  for b in `curl -s https://attack.mitre.org/groups/$i/ | egrep -o '[T][0-9]{4,}' | sort -u`
  do
    printf "$i"",""$b"'\n%s' >> mitre_technique_to_group.csv
  done
done
