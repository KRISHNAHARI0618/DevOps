#!/bin/bash

input="people_data.csv"

while IFS=',' read -r name class age;
do
    echo "Username : $name, Class : $class"
done < $input

# find "$LOGSDIR" -type f -name "*.log" -mtime +$days -exec gzip {} \; -exec mv {}.gz "DIRPATH" \;

