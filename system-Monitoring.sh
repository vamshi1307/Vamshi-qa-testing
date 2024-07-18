#! /bin/bash
printf "Memory\t\tDisk\t\tCPU\n"
end=$((SECONDS+3600))
#Getting DISK,Memory,CPU usage of the user system
while [ $SECONDS -lt $end ]; do
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
echo "$MEMORY$DISK$CPU"
sleep 5
#Code for CPU,MEMORY,DISK usage hit >80 
if [ $'/nMEMORY/r /n' -gt 80 ]; then
   echo "The memory is hitting greater than 80,memory: $MEMORY"
elif [ $'/nDISK/r /n' -gt 80 ]; then
    echo "The disk is hitting greater than 80,disk: $DISK"
elif [ $'/nCPU/r /n' -gt 80 ]; then
    echo "The cpu is hitting greater than 80,cpu: $CPU"
else
     echo "no issues"
fi
done
