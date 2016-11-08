#!/bin/bash
# This script crawls the current directory of .txt files and strips out all the HTML tags < >
# The new files are written into a folder called stripped
echo "Current directory is "
pwd
read -r -p "Continue? [Y/n]" response
response=${response}
if [[ ${response} =~ ^(yes|y|Y) ]]; then
        mkdir stripped
        for file in ./*.txt
                do
                        name=${file##*/}
                        base=${name%.txt}
                        cat "$file" |sed 's/<[^>]*>//g' > ./stripped/"${base}.txt"
                done
else
        echo "Not run, Exiting"
fi