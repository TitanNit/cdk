#!/bin/bash

if [ "$1" == -h ] || [ "$1" == --help ]; then
 echo "Parameter 1: target system (1-37)"
 echo "Parameter 2: kernel (1-5)"
 echo "Parameter 3: debug (y/N)"
 echo "Parameter 4: player (1-2)"
 echo "Parameter 5: Media Framework (1-4)"
 echo "Parameter 6: External LCD support (1-2)"
 echo "Parameter 7: Image (Enigma=1/2 Neutrino=3/4 Tvheadend=5 (1-5)"
 exit
fi

CURDIR=`pwd`
CURRENT_PATH=${CURDIR%/cdk}

CONFIGPARAM=" \
 --enable-maintainer-mode \
 --prefix=$CURRENT_PATH/tufsbox \
 --with-cvsdir=$CURRENT_PATH \
 --with-customizationsdir=$CURRENT_PATH/cdk/custom \
 --with-flashscriptdir=$CURRENT_PATH/flash \
 --with-archivedir=$HOME/Archive \
 --with-maxcachesize=3 \
 --enable-ccache"

##############################################

echo "
  _______                     _____              _     _         _
 |__   __|                   |  __ \            | |   | |       | |
    | | ___  __ _ _ __ ___   | |  | |_   _  ____| | __| |_  __ _| | ___ ___
    | |/ _ \/ _\` | '_ \` _ \  | |  | | | | |/  __| |/ /| __|/ _\` | |/ _ | __|
    | |  __/ (_| | | | | | | | |__| | |_| |  (__|   < | |_| (_| | |  __|__ \\
    |_|\___|\__,_|_| |_| |_| |_____/ \__,_|\____|_|\_\ \__|\__,_|_|\___|___/

"

##############################################

# config.guess generates different answers for some packages
# Ensure that all packages use the same host by explicitly specifying it.

# First obtain the triplet
AM_VER=`automake --version | awk '{print $NF}' | grep -oEm1 "^[0-9]+.[0-9]+"`
host_alias=`/usr/share/automake-${AM_VER}/config.guess`

# Then undo Suse specific modifications, no harm to other distribution
case `echo ${host_alias} | cut -d '-' -f 1` in
	i?86) VENDOR=pc ;;
	*   ) VENDOR=unknown ;;
esac
host_alias=`echo ${host_alias} | sed -e "s/suse/${VENDOR}/"`

# And add it to the config parameters.
CONFIGPARAM="$CONFIGPARAM --host=$host_alias --build=$host_alias"

##############################################

case $1 in
	[1-9] | 1[0-9] | 2[0-9] | 3[0-9]) REPLY=$1;;
	*)
		echo "Target receivers:"
		echo "    1) Kathrein UFS-910"
		echo "    3) Kathrein UFS-912"
		echo "    4) Kathrein UFS-922"
		echo "    5) Topfield TF77X0 HDPVR"
		echo "    6) Fortis HDbox (Fortis FS9000/9200)"
		echo "    7) SpiderBox HL-101"
		echo "    8) Edision Argus vip"
		echo "    9) Cuberevo (IPBOX 9000)"
		echo "   10) Cuberevo mini (IPBOX 900)"
		echo "   11) Cuberevo mini2 (IPBOX 910)"
		echo "   12) Cuberevo 250 (IPBOX 91)"
		echo "   13) Cuberevo 9500HD (7000HD)"
		echo "   14) Cuberevo 2000HD"
		echo "   15) Cuberevo mini_fta (200HD)"
		echo "   16) Homecast 5101"
		echo "   17) Octagon SF1008P (Fortis HS9510)"
		echo "   18) SPARK"
		echo "   19) Atevio AV7500 (Fortis HS8200)"
		echo "   20) SPARK7162"
		echo "   21) IPBOX9900"
		echo "   22) IPBOX99"
		echo "   23) IPBOX55"
		echo "   24) Fortis HS7810A"
		echo "   25) B4Team ADB 5800S"
		echo "   26) Fortis HS7110"
		echo "   27) Atemio AM520"
		echo "   28) Kathrein UFS-913"
		echo "   29) Kathrein UFC-960"
		echo "   30) Vitamin HD5000"
		echo "   31) Atemio AM530"
		echo "   32) SagemCom 88 series"
		echo "   33) Ferguson Ariva @Link 200"
		echo "   34) Fortis HS7119"
		echo "   35) Fortis HS7819"
		echo "   36) Fortis DP7000 (not finished yet)"
		echo "   37) Xsarius Alpha (Cuberevo 3000HD)"
		read -p "Select target (1-37)? ";;
esac

case "$REPLY" in
	 1) TARGET="--enable-ufs910";BOXTYPE="--with-boxtype=ufs910";;
	 3) TARGET="--enable-ufs912";BOXTYPE="--with-boxtype=ufs912";;
	 4) TARGET="--enable-ufs922";BOXTYPE="--with-boxtype=ufs922";;
	 5) TARGET="--enable-tf7700";BOXTYPE="--with-boxtype=tf7700";;
	 6) TARGET="--enable-fortis_hdbox";BOXTYPE="--with-boxtype=fortis_hdbox";;
	 7) TARGET="--enable-hl101";BOXTYPE="--with-boxtype=hl101";;
	 8) TARGET="--enable-vip";BOXTYPE="--with-boxtype=vip";;
	 9) TARGET="--enable-cuberevo";BOXTYPE="--with-boxtype=cuberevo";;
	10) TARGET="--enable-cuberevo_mini";BOXTYPE="--with-boxtype=cuberevo_mini";;
	11) TARGET="--enable-cuberevo_mini2";BOXTYPE="--with-boxtype=cuberevo_mini2";;
	12) TARGET="--enable-cuberevo_250hd";BOXTYPE="--with-boxtype=cuberevo_250hd";;
	13) TARGET="--enable-cuberevo_9500hd";BOXTYPE="--with-boxtype=cuberevo_9500hd";;
	14) TARGET="--enable-cuberevo_2000hd";BOXTYPE="--with-boxtype=cuberevo_2000hd";;
	15) TARGET="--enable-cuberevo_mini_fta";BOXTYPE="--with-boxtype=cuberevo_mini_fta";;
	16) TARGET="--enable-homecast5101";BOXTYPE="--with-boxtype=homecast5101";;
	17) TARGET="--enable-octagon1008";BOXTYPE="--with-boxtype=octagon1008";;
	18) TARGET="--enable-spark";BOXTYPE="--with-boxtype=spark";;
	19) TARGET="--enable-atevio7500";BOXTYPE="--with-boxtype=atevio7500";;
	20) TARGET="--enable-spark7162";BOXTYPE="--with-boxtype=spark7162";;
	21) TARGET="--enable-ipbox9900";BOXTYPE="--with-boxtype=ipbox9900";;
	22) TARGET="--enable-ipbox99";BOXTYPE="--with-boxtype=ipbox99";;
	23) TARGET="--enable-ipbox55";BOXTYPE="--with-boxtype=ipbox55";;
	24) TARGET="--enable-hs7810a";BOXTYPE="--with-boxtype=hs7810a";;
	25) TARGET="--enable-adb_box";BOXTYPE="--with-boxtype=adb_box";;
	26) TARGET="--enable-hs7110";BOXTYPE="--with-boxtype=hs7110";;
	27) TARGET="--enable-atemio520";BOXTYPE="--with-boxtype=atemio520";;
	28) TARGET="--enable-ufs913";BOXTYPE="--with-boxtype=ufs913";;
	29) TARGET="--enable-ufc960";BOXTYPE="--with-boxtype=ufc960";;
	30) TARGET="--enable-vitamin_hd5000";BOXTYPE="--with-boxtype=vitamin_hd5000";;
	31) TARGET="--enable-atemio530";BOXTYPE="--with-boxtype=atemio530";;
	32) TARGET="--enable-sagemcom88";BOXTYPE="--with-boxtype=sagemcom88";;
	33) TARGET="--enable-arivalink200";BOXTYPE="--with-boxtype=arivalink200";;
	34) TARGET="--enable-hs7119";BOXTYPE="--with-boxtype=hs7119";;
	35) TARGET="--enable-hs7819";BOXTYPE="--with-boxtype=hs7819";;
	36) TARGET="--enable-fortis_dp7000";BOXTYPE="--with-boxtype=fortis_dp7000";;
	37) TARGET="--enable-cuberevo_3000hd";BOXTYPE="--with-boxtype=cuberevo_3000hd";;
	 *) TARGET="--enable-atevio7500";BOXTYPE="--with-boxtype=atevio7500";;
esac
CONFIGPARAM="$CONFIGPARAM $TARGET $BOXTYPE"

case "$REPLY" in
	8) REPLY=$3
		echo -e "\nModels:"
		echo " 1) VIP1 v1 [ single tuner + 2 CI + 2 USB ]"
		echo " 2) VIP1 v2 [ single tuner + 2 CI + 1 USB + plug & play tuner (dvb-s2/t/c) ]"
		echo " 3) VIP2 v1 [ twin tuner ]"

		read -p "Select Model (1-3)? "

		case "$REPLY" in
			1) MODEL="--enable-hl101";;
			2) MODEL="--enable-vip1_v2";;
			3) MODEL="--enable-vip2_v1";;
			*) MODEL="--enable-vip2_v1";;
		esac
		CONFIGPARAM="$CONFIGPARAM $MODEL"
		;;
	*)
esac

##############################################

case $2 in
	[1-5]) REPLY=$2;;
	*)	echo -e "\nKernel:"
		echo "   1) STM 24 P0209"
		echo "   2) STM 24 P0211"
		echo "   3) STM 24 P0214"
		echo "   4) STM 24 P0215"
		echo "   5) STM 24 P0217 (recommended)"
		read -p "Select kernel (1-5)? ";;
esac

case "$REPLY" in
	1)  KERNEL="--enable-p0209";;
	2)  KERNEL="--enable-p0211";;
	3)  KERNEL="--enable-p0214";;
	4)  KERNEL="--enable-p0215";;
	5)  KERNEL="--enable-p0217";;
	*)  KERNEL="--enable-p0217";;
esac
CONFIGPARAM="$CONFIGPARAM $KERNEL"

##############################################

echo -e "\nKernel debug:"
if [ "$3" ]; then
	REPLY="$3"
else
	REPLY=N
	read -p "   Activate debug (y/N)? "
fi
[ "$REPLY" == "y" -o "$REPLY" == "Y" ] && CONFIGPARAM="$CONFIGPARAM --enable-debug"

##############################################

cd ../driver/
echo "# Automatically generated config: don't edit" > .config
echo "#" >> .config
echo "export CONFIG_ZD1211REV_B=y" >> .config
echo "export CONFIG_ZD1211=n" >> .config
cd - &>/dev/null

##############################################

case $4 in
	[1-2]) REPLY=$4;;
	*)	echo -e "\nPlayer:"
		echo "   1) Player 191 (stmfb-3.1_stm24_0102)"
		echo "   2) Player 191 (stmfb-3.1_stm24_0104, recommended)"
		read -p "Select player (1-2)? ";;
esac

case "$REPLY" in
	1) PLAYER="--enable-player191 --enable-multicom324"
		cd ../driver/include/
		if [ -L player2 ]; then
			rm player2
		fi

		if [ -L stmfb ]; then
			rm stmfb
		fi

		if [ -L multicom ]; then
			rm multicom
		fi

		ln -s player2_191 player2
		ln -s stmfb-3.1_stm24_0102 stmfb
		ln -s ../multicom-3.2.4/include multicom
		cd - &>/dev/null

		cd ../driver/
		if [ -L player2 ]; then
			rm player2
		fi

		if [ -L multicom ]; then
			rm multicom
		fi

		ln -s player2_191 player2
		ln -s multicom-3.2.4 multicom
		echo "export CONFIG_PLAYER_191=y" >> .config
		echo "export CONFIG_MULTICOM324=y" >> .config
		cd - &>/dev/null

		cd ../driver/stgfb
		if [ -L stmfb ]; then
			rm stmfb
		fi
		ln -s stmfb-3.1_stm24_0102 stmfb
		cd - &>/dev/null
	;;
	2) PLAYER="--enable-player191 --enable-multicom324"
		cd ../driver/include/
		if [ -L player2 ]; then
			rm player2
		fi

		if [ -L stmfb ]; then
			rm stmfb
		fi

		if [ -L multicom ]; then
			rm multicom
		fi

		ln -s player2_191 player2
		ln -s stmfb-3.1_stm24_0104 stmfb
		ln -s ../multicom-3.2.4/include multicom
		cd - &>/dev/null

		cd ../driver/
		if [ -L player2 ]; then
			rm player2
		fi

		if [ -L multicom ]; then
			rm multicom
		fi

		ln -s player2_191 player2
		ln -s multicom-3.2.4 multicom
		echo "export CONFIG_PLAYER_191=y" >> .config
		echo "export CONFIG_MULTICOM324=y" >> .config
		cd - &>/dev/null

		cd ../driver/stgfb
		if [ -L stmfb ]; then
			rm stmfb
		fi
		ln -s stmfb-3.1_stm24_0104 stmfb
		cd - &>/dev/null
	;;
	*) PLAYER="--enable-player191 --enable-multicom324";;
esac

##############################################

case $5 in
	[1-4]) REPLY=$5;;
	*)	echo -e "\nMedia Framework:"
		echo "   1) eplayer3"
		echo "   2) gstreamer"
		echo "   3) use built-in (required for Neutrino)"
		echo "   4) gstreamer+eplayer3 (recommended for OpenPLi)"
		read -p "Select media framework (1-4)? ";;
esac

case "$REPLY" in
	1) MEDIAFW="--enable-eplayer3";;
	2) MEDIAFW="--enable-mediafwgstreamer";;
	3) MEDIAFW="--enable-buildinplayer";;
	4) MEDIAFW="--enable-eplayer3 --enable-mediafwgstreamer";;
	*) MEDIAFW="--enable-eplayer3";;
esac

##############################################

case $6 in
	[1-2]) REPLY=$6;;
	*)	echo -e "\nExternal LCD support:"
		echo "   1) No external LCD"
		echo "   2) graphlcd for external LCD"
		read -p "Select external LCD support (1-2)? ";;
esac

case "$REPLY" in
	1) EXTERNAL_LCD="";;
	2) EXTERNAL_LCD="--enable-externallcd";;
	*) EXTERNAL_LCD="";;
esac

##############################################

case $7 in
	[1-6]) REPLY=$7;;
	*)	echo -e "\nWhich Image do you want to build:"
		echo "   1) Enigma2"
		echo "   2) Enigma2 (includes WLAN drivers)"
		echo "   3) Neutrino"
		echo "   4) Neutrino (includes WLAN drivers)"
		echo "   5) Tvheadend"
		echo "   6) TitanNit"
		read -p "Select Image to build (1-5)? ";;
esac

case "$REPLY" in
	1) IMAGE="--enable-enigma2";;
	2) IMAGE="--enable-enigma2 --enable-wlandriver";;
	3) IMAGE="--enable-neutrino";;
	4) IMAGE="--enable-neutrino --enable-wlandriver";;
	5) IMAGE="--enable-tvheadend";;
	6) IMAGE="--enable-titan";;
	*) IMAGE="--enable-neutrino";;
esac

##############################################

CONFIGPARAM="$CONFIGPARAM $PLAYER $MULTICOM $MEDIAFW $EXTERNAL_LCD $IMAGE"

##############################################

echo && \
echo "Performing autogen.sh..." && \
echo "------------------------" && \
./autogen.sh && \
echo && \
echo "Performing configure..." && \
echo "-----------------------" && \
echo && \
./configure $CONFIGPARAM

##############################################

echo $CONFIGPARAM >lastChoice
echo " "
echo "----------------------------------------"
echo "Your build environment is ready :-)"
echo "Your next step could be:"
case "$IMAGE" in
		--enable-neutrino*)
		echo "  make yaud-neutrino-mp"
		echo "  make yaud-neutrino-mp-next"
		echo "  make yaud-neutrino-mp-cst-next"
		echo "  make yaud-neutrino-hd2-exp";;
		--enable-enigma2*)
		echo "  make yaud-enigma2-pli-nightly";;
		--enable-tvheadend*)
		echo "  make yaud-tvheadend";;
		*)
esac
echo "----------------------------------------"
