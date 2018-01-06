# NTPD Docker

## Purpose
Running a NTP Daemon docker project

## Build
- This project provides a simple Dockerfile for the purpose of illustration only. You need to extend/modify the Docker to
support whatever you want to do.
```
./build.sh
```

## (NEW) Configuration
New extension to allow users to enter "Volume mapping" and "Port mapping" entries together with "docker.env" file with "#" syntax to avoid docker-compose pick up the entries -- "Rider" configuration!
Here is the example syntax:
```
#### Rider configuration for run.sh ####
# - Use "#VOLUMES" and "#PORTS" to indicate that the variables for run.sh"
# - To ignore line, use "##" (double) in the beginning, e.g. "##VOLUMES" and "##PORTS"
# - To indicate that the variables for run.sh", use only one "#",  e.g. "#VOLUMES" and "#PORTS"
#VOLUMES_LIST="data workspace"
##PORTS_LIST="18080:8000 17200:7200"
```
## Run
- To run the simple example build image; it will pop up X11 to display Firefox docker-based browser.
```
./run.sh
```

## Reference: https://github.com/cturra/docker-ntp 

NTP daemon in Docker

Test NTP
From any machine that has ntpdate you can query your new NTP container with the follow command:

$> ntpdate -q <DOCKER_HOST_IP>
Here is a sample output from my environment:

$> ntpdate -q 10.13.13.9
server 10.13.13.9, stratum 3, offset 0.010089, delay 0.02585
17 Sep 15:20:52 ntpdate[14186]: adjust time server 10.13.13.9 offset 0.010089 sec
If you see a message, like the following, it's likely the clock is not yet synchronized.

$> ntpdate -q 10.13.13.9
server 10.13.13.9, stratum 16, offset 0.005689, delay 0.02837
11 Dec 09:47:53 ntpdate[26030]: no server suitable for synchronization found
To see details on the ntpd status, you can check with the below command on your docker host:

$> docker exec ntp ntpctl -s status
4/4 peers valid, clock synced, stratum 2
