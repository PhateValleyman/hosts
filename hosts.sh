#!/bin/bash

# Delete old hosts file
if [ -f "hosts" ]; then
    rm "hosts"
    echo "Old 'hosts' file has been deleted"
fi

# Define URLs for hosts files
hosts_urls=(
    "https://adaway.org/hosts.txt"
    "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&mimetype=plaintext"
    # "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
)

# Define output file name
output_file="hosts"

echo "#####  ##### #####  #####" >> "$output_file"
echo "##  by PhateValleyman  ##" >> "$output_file"
echo "# Jonas.Ned@outlook.com #" >> "$output_file"
echo "#####  ##### #####  #####" >> "$output_file"
echo " " >> "$output_file"

# Loop through hosts URLs
for url in "${hosts_urls[@]}"
do
    # Print what URL downloading now
    echo -e "\nDownloading:\n$url"
    # Add borders at start of hosts source
    echo "##### ##### ##### ##### ##### ##### #####" >> "$output_file"
    echo "##--- $url ---##" >> "$output_file"
    echo "##### ##### ##### ##### ##### ##### #####" >> "$output_file"
    # Download hosts file from URL and append to output file
    curl "$url" >> "$output_file"
    # Add borders at the end of hosts source
    echo "##### ##### ##### ##### ##### ##### #####" >> "$output_file"
    echo "##### ##### ##### ##### ##### ##### #####" >> "$output_file"
    echo -e "##### ##### ##### ##### ##### ##### #####\n" >> "$output_file"
done

echo -e "\nHosts files downloaded and merged into file:\n$output_file\n"
