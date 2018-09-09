#!/bin/bash

free && sync && echo 3 > /proc/sys/vm/drop_caches && free

echo ""
echo ""

free && swapoff -a && swapon -a && free
