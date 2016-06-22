

#!/bin/bash
#Port knock script using nmap. Requests multiple ports as variables.
#Knocks on all three ports in all possible combinations.

if [ $# -ne 4 ]; then
  echo "Usage: $0 host port1 port2 port3"
  echo "Ports will be scanned in all possible combinatoons"
  exit;
fi

#Assign Port numbers to array 
ports=($2 $3 $4)

#Assign host from input
host=$1



#Print knocking ports
echo You are knocking on  ports:
echo
printf "%s\n" "${ports[@]}"
echo
echo


#Knock on all 3 ports in all possible combintations using nmap. Nmap -r scan ports consecutively to ensure all combinations are tested.
nmap -r -Pn -p ${ports[0]},${ports[1]},${ports[2]} $host
nmap -r -Pn -p ${ports[0]},${ports[2]},${ports[1]} $host
nmap -r -Pn -p ${ports[1]},${ports[2]},${ports[0]} $host
nmap -r -Pn -p ${ports[1]},${ports[0]},${ports[2]} $host
nmap -r -Pn -p ${ports[2]},${ports[1]},${ports[0]} $host
nmap -r -Pn -p ${ports[2]},${ports[0]},${ports[1]} $host


#Scan for open ports after knock completes. 
echo "Current open Ports"
echo 
nmap -Pn -p0-5000 $host | awk '/open/'
