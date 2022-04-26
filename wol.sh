#!/usr/bin/bash

# Mac address variables

A0="98:90:96:ae:d6:5a"

A1=""
A2=""
A3="98:90:96:ae:b2:4d"
A4="98:90:96:ae:c2:67"
A5="98:90:96:ae:d7:88"
A6="98:90:96:ae:c2:4c"
A7="98:90:96:ae:d7:0b"
A8=""

B1=""
B2="98:90:96:ae:9f:2c"
B3="98:90:96:ae:b6:bf"
B4="98:90:96:ae:b6:b1"
B5=""
B6="98:90:96:ae:aa:0a"
B7="98:90:96:ae:d2:03"
B8=""

C1=""
C2="98:90:96:ae:d4:04"
C3="98:90:96:ae:d9:61"
C4="98:90:96:ae:d7:b7"
C5="98:90:96:ae:c3:38"
C6="98:90:96:ae:bc:83"
C7="98:90:96:ae:d6:37"
C8=""

D1=""
D2="98:90:96:ae:d8:11"
D3="98:90:96:ae:c7:3d"
D4="98:90:96:ae:c2:94"
D5="98:90:96:ae:d3:36"
D6="98:90:96:ae:d2:fb"
D7="98:90:96:ae:b1:36"
D8=""

E1=""
E2=""
E3=""
E4=""
E5="98:90:96:ae:d8:d2"
E6="98:90:96:ae:d3:24"
E7="98:90:96:ae:d6:98"
E8=""

xeon2="$B2 $C2 $D2"
xeon3="$A3 $B3 $C3 $D3"
xeon4="$A4 $B4 $C4 $D4 $A0"
xeon5="$A5 $C5 $D5 $E5"
xeon6="$A6 $B6 $C6 $D6 $E6"
xeon7="$A7 $B7 $C7 $D7 $E7"


# Display help if there aren't arguments
if [ $# -le 0 ]; then

	printf "
	Wake-On-LAN
This utility sends a magic packet to wake up a machine properly configured to listen to Wake-On-LAN/WLAN requests.
	Usage:  wol.sh [PC-NAME] ... [PC-GROUP]
	
	PC-NAME:	Example: 
					wol.sh E5
					wol.sh B2 B3
					wol.sh B6 A2 C8 E5
	
	PC-GROUP:	Example: 
					wol.sh all
					wol.sh xeon
					wol.sh i9
					wol.sh old
"
exit
fi

for i in "$@";
do
	printf "$i: "
	case $i in
		[Xx]eon)
			echo "wol A4 B4 C4 D4 A0"
			wol $xeon4
			sleep 2
			echo "wol A5 C5 D5 E5"
			wol $xeon5
			sleep 2
			echo "wol A3 B3 C3 D3"
			wol $xeon3
			sleep 2
			echo "wol A6 B6 C6 D6 E6"
			wol $xeon6
			sleep 2
			echo "wol B2 C2 D2"
			wol $xeon2
			sleep 2
			echo "wol A7 B7 C7 D7 E7"
			wol $xeon7
			sleep 2
		;;
		[Aa-Ee][1-8]|A0)
			aux="$i"
			wol ${!aux}
		;;
		*)
			echo "argument error"
		;;
	esac
done
