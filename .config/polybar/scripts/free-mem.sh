#!/usr/bin/env bash

MemTotal=$(grep MemTotal /proc/meminfo | awk '{print $2}')
MemFree=$(grep MemFree /proc/meminfo | awk '{print $2}')
Buffers=$(grep Buffers /proc/meminfo | awk '{print $2}')
Cached=$(grep "^Cached" /proc/meminfo | awk '{print $2}')
Shmem=$(grep "^Shmem:" /proc/meminfo | awk '{print $2}')
SReclaimable=$(grep "^SReclaimable" /proc/meminfo | awk '{print $2}')

# Calculate used memory, similar to htop
# Convert from kB to MB
UsedMem=$(((MemTotal + Shmem - MemFree - Buffers - Cached - SReclaimable) / 1024))

# If used memory is less than 1 GB, display it in MB
if [ $UsedMem -lt 1024 ]; then
    echo "$UsedMem MB"
else
    # Convert from MB to GB with two decimal places
    UsedMemGB=$(echo "scale=2; $UsedMem / 1024" | bc)
    echo "$UsedMemGB GB"
fi
