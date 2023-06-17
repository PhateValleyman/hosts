#!/bin/bash

# Delete old file 'hosts'
if [ -f "hosts" ]; then
    rm "hosts"
    echo "Old 'hosts' file has been deleted"
fi

# Define URLs for hosts sources
hosts_urls=(
	"https://adaway.org/hosts.txt"
	"https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&mimetype=plaintext"
	"https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
)

# Define output 'hosts' file name
output_file="hosts"

# Write custom banner to 'hosts' file
echo "########## ########## ########## ########## ########## ##########" >> "$output_file"
echo "## https://github.com/PhateValleyman/hosts/raw/master/hosts.sh ##" >> "$output_file"
echo "########## ########## ########## ########## ########## ##########" >> "$output_file"
echo "########## ########## ########## ########## ########## ##########" >> "$output_file"
echo "########## ##########   by PhateValleyman   ########## ##########" >> "$output_file"
echo "########## ########## Jonas.Ned@outlook.com ########## ##########" >> "$output_file"
echo "########## ########## ########## ########## ########## ##########" >> "$output_file"
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

# Print results
echo -e "\nHosts files downloaded and merged into file:\n'$output_file'\n"
