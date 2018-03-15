#!/bin/bash
cd "$(dirname "$0")"
while true
do 
    ./check-calls.sh
    sleep ${PAP2T_POOLING:-10}
done
