#!/bin/bash

echo '------------------------------------------------------------------'
echo ' MEMORY FULL'
echo '------------------------------------------------------------------'
free -m
echo ''
echo ''

echo '------------------------------------------------------------------'
echo ' CACHE AND BUFFER CLEAR'
echo '------------------------------------------------------------------'
sync; echo 3 > /proc/sys/vm/drop_caches
sync; echo 2 > /proc/sys/vm/drop_caches
sync; echo 1 > /proc/sys/vm/drop_caches
free -m
echo ''
echo ''


echo '------------------------------------------------------------------'
echo ' SWAP CLEAR'
echo '------------------------------------------------------------------'
swapoff -a
swapon -a
free -m
echo ''
echo ''

exit
