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

# Run copy 'hosts' file to specific directory
if [ $(uname -m) = "armv5tel" ] ; then
    mv $output_file /ffp/etc/hosts
    echo "'hosts' file has been moved to /ffp/etc/hosts"
    echo "reboot server to take effect"
    echo "hosts by PhateValleyman"
elif [ $(uname -m) = "aarch64" ] ; then
	su -c mkdir -p /data/adb/modules/umbrella/system/etc
	su -c mv $output_file /data/adb/modules/umbrella/system/etc/hosts
	echo "'hosts' file has been moved to /data/adb/modules/umbrella/system/etc/hosts"
	echo "reboot phone to take effect"
	echo "hosts by PhateValleyman"
else
    echo "Unknown system architecture"
    echo "Manual copy 'hosts' file to system directory"
    echo "hosts by PhateValleyman"
fi
