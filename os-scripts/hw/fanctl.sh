#!/bin/bash
### BEGIN INIT INFO
# Provides:          fanCtrl
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     1 2 3 4 5
# Default-Stop:      0 6
# Short-Description: Start fan control at boot time
# Description:       Enable service provided by fanCtrl.
### END INIT INFO

# Records the CPU temp and writes it to coreTemp temporary file.

pwmFiles=$(ls /sys/devices/platform/dell_smm_hwmon/hwmon/hwmon*/pwm* | jq -Rs)
echo $pwmFiles

switch=0

while  [ true ] ; do

	coreTemp=$(sensors -j | jq 'to_entries | .[] | select(.key|contains("core")) | .value | to_entries | .[] | select(.key|contains("Core")) | .value | to_entries | .[] |  select(.key|contains("input")) | .value' | jq -s 'max%100');

#	echo $coreTemp;

	if [ $coreTemp -gt 35 ] && [ $switch == 0 ]; then
#	  echo true;
	  echo $pwmFiles | jq -r | xargs -i sudo su -c 'echo 255 > {}'
	  switch=1
  elif [ $coreTemp -lt 36 ] && [ $switch == 1 ]; then
#    echo false;
    echo $pwmFiles | jq -r | xargs -i sudo su -c 'echo 155 > {}'
    switch=0
  fi

sleep 10;
done
