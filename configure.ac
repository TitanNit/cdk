AC_INIT([tuxbox-cdk],[0])
AC_PREREQ(2.59)

AC_CANONICAL_BUILD
AC_SUBST(build)

TUXBOX_BOXTYPE

if test "$target_alias" = "" ; then
	target_alias="sh4-linux"
fi

AC_CANONICAL_TARGET
if test "$target" = "sh4-unknown-linux-gnu" ; then
	target="sh4-linux"
fi
AC_SUBST(target)

AM_INIT_AUTOMAKE([-Wno-portability])
AM_MAINTAINER_MODE

AC_PROG_CC

AC_ARG_ENABLE(neutrino,
	AS_HELP_STRING(--enable-neutrino, Setting up the CDK to build neutrino),
	[case "${enableval}" in
		yes) NEUTRINO=neutrino ;;
	esac],[enable_neutrino=no])
AM_CONDITIONAL(ENABLE_NEUTRINO,test "$enable_neutrino" = "yes")
AC_SUBST(NEUTRINO)

AC_ARG_ENABLE(enigma2,
	AS_HELP_STRING(--enable-enigma2, Setting up the CDK to build enigma2),
	[case "${enableval}" in
		yes) ENIGMA2=enigma2 ;;
	esac],[enable_enigma2=no])
AM_CONDITIONAL(ENABLE_ENIGMA2,test "$enable_enigma2" = "yes")
AC_SUBST(ENIGMA2)

AC_ARG_ENABLE(tvheadend,
	AS_HELP_STRING(--enable-tvheadend, Setting up the CDK to build tvheadend),
	[case "${enableval}" in
		yes) TVHEADEND=tvheadend ;;
	esac],[enable_tvheadend=no])
AM_CONDITIONAL(ENABLE_TVHEADEND,test "$enable_tvheadend" = "yes")
AC_SUBST(TVHEADEND)

AC_ARG_ENABLE(titan,
	AS_HELP_STRING(--enable-titan, Setting up the CDK to build titan),
	[case "${enableval}" in
		yes) TITAN=titan ;;
	esac],[enable_titan=no])
AM_CONDITIONAL(ENABLE_TITAN,test "$enable_titan" = "yes")
AC_SUBST(TITAN)

AC_ARG_ENABLE(wlandriver,
	AS_HELP_STRING(--enable-wlandriver, Setting up the CDK to build WLAN drivers),
	[case "${enableval}" in
		yes) WLANDRIVER=wlandriver ;;
	esac],[enable_wlandriver=no])
AM_CONDITIONAL(ENABLE_WLANDRIVER,test "$enable_wlandriver" = "yes")
AC_SUBST(WLANDRIVER)

AC_ARG_ENABLE(player191,
	AS_HELP_STRING(--enable-player191, set up the CDK to use player191),
	[case "${enableval}" in
		yes) PLAYER191=player191 ;;
	esac],[enable_player191=no])
AM_CONDITIONAL(ENABLE_PLAYER191,test "$enable_player191" = "yes")
AC_SUBST(PLAYER191)

AC_ARG_ENABLE(multicom324,
	AS_HELP_STRING(--enable-multicom324, set up the CDK to use multicom324),
	[case "${enableval}" in
		yes) MULTICOM324=multicom324 ;;
	esac],[enable_multicom324=no])
AM_CONDITIONAL(ENABLE_MULTICOM324,test "$enable_multicom324" = "yes")
AC_SUBST(MULTICOM324)

AC_ARG_ENABLE(multicom406,
	AS_HELP_STRING(--enable-multicom406, set up the CDK to use multicom406),
	[case "${enableval}" in
		yes) MULTICOM406=multicom406 ;;
	esac],[enable_multicom406=no])
AM_CONDITIONAL(ENABLE_MULTICOM406,test "$enable_multicom406" = "yes")
AC_SUBST(MULTICOM406)

AC_ARG_ENABLE(p0209,
	AS_HELP_STRING(--enable-p0209, set up the CDK to use the STLinux 2.4 with patchlevel 0209),
	[case "${enableval}" in
		yes) P0209=p0209 ;;
	esac], [enable_p0209=no])
AM_CONDITIONAL(ENABLE_P0209,test "$enable_p0209" = "yes")
AC_SUBST(P0209)

AC_ARG_ENABLE(p0211,
	AS_HELP_STRING(--enable-p0211, set up the CDK to use the STLinux 2.4 with patchlevel 0211),
	[case "${enableval}" in
		yes) P0211=p0211 ;;
	esac], [enable_p0211=no])
AM_CONDITIONAL(ENABLE_P0211,test "$enable_p0211" = "yes")
AC_SUBST(P0211)

AC_ARG_ENABLE(p0214,
	AS_HELP_STRING(--enable-p0214, set up the CDK to use the STLinux 2.4 with patchlevel 0214),
	[case "${enableval}" in
		yes) P0214=p0214 ;;
	esac], [enable_p0214=no])
AM_CONDITIONAL(ENABLE_P0214,test "$enable_p0214" = "yes")
AC_SUBST(P0214)

AC_ARG_ENABLE(p0215,
	AS_HELP_STRING(--enable-p0215, set up the CDK to use the STLinux 2.4 with patchlevel 0215),
	[case "${enableval}" in
		yes) P0215=p0215 ;;
	esac], [enable_p0215=no])
AM_CONDITIONAL(ENABLE_P0215,test "$enable_p0215" = "yes")
AC_SUBST(P0215)

AC_ARG_ENABLE(p0217,
	AS_HELP_STRING(--enable-p0217, set up the CDK to use the STLinux 2.4 with patchlevel 0217),
	[case "${enableval}" in
		yes) P0217=p0217 ;;
	esac], [enable_p0217=no])
AM_CONDITIONAL(ENABLE_P0217,test "$enable_p0217" = "yes")
AC_SUBST(P0217)

AC_ARG_WITH(cpu,
	[  --with-cpu=MODEL    cpu model [[sh4]]],
	[CPU_MODEL="$withval"],[CPU_MODEL="sh4"])
AC_SUBST(CPU_MODEL)

AC_ARG_ENABLE(debug,
	AS_HELP_STRING(--enable-debug, set up the CDK to use debug kernel configs),
	,[enable_debug=no])
AM_CONDITIONAL(DEBUG,test "$enable_debug" = "yes")

AC_ARG_ENABLE(mediafwgstreamer,
	AS_HELP_STRING(--enable-mediafwgstreamer,    set up the CDK to use mediafw gstreamer),
	,[enable_mediafwgstreamer=no])
AM_CONDITIONAL(ENABLE_MEDIAFWGSTREAMER,test "$enable_mediafwgstreamer" = "yes")
AC_SUBST(MEDIAFWGSTREAMER)

AC_ARG_ENABLE(externallcd,
	AS_HELP_STRING(--enable-externallcd,    set up the CDK to use graphlcd),
	,[enable_externallcd=no])
AM_CONDITIONAL(ENABLE_EXTERNALLCD,test "$enable_externallcd" = "yes")
AC_SUBST(EXTERNALLCD)

AC_ARG_ENABLE(eplayer3,
	AS_HELP_STRING(--enable-eplayer3,    enable eplayer3 support),
	[case "${enableval}" in
		yes) EPLAYER3=eplayer3 ;;
	esac],[enable_eplayer3=no])
AM_CONDITIONAL(ENABLE_EPLAYER3,test "$enable_eplayer3" = "yes")
AC_SUBST(EPLAYER3)

AC_ARG_ENABLE(buildinplayer,
	AS_HELP_STRING(--enable-buildinplayer,    enable build-in player support),
	,[enable_buildinplayer=no])
AM_CONDITIONAL(ENABLE_BUILDINPLAYER,test "$enable_buildinplayer" = "yes")
AC_SUBST(BUILDINPLAYER)

AC_ARG_ENABLE(fortis_hdbox,
	AS_HELP_STRING(--enable-fortis_hdbox, enable Fortis/hdbox FS9000/9200HD PVR stuff),
	[case "${enableval}" in
		yes) FORTIS_HDBOX=fortis_hdbox ;;
	esac],[enable_fortis_hdbox=no])
AM_CONDITIONAL(ENABLE_FORTIS_HDBOX,test "$enable_fortis_hdbox" = "yes")
AC_SUBST(FORTIS_HDBOX)

AC_ARG_ENABLE(atevio7500,
	AS_HELP_STRING(--enable-atevio7500, enable Atevio 7500 PVR stuff),
	[case "${enableval}" in
		yes) ATEVIO7500=atevio7500 ;;
	esac],[enable_atevio7500=no])
AM_CONDITIONAL(ENABLE_ATEVIO7500,test "$enable_atevio7500" = "yes")
AC_SUBST(ATEVIO7500)

AC_ARG_ENABLE(octagon1008,
	AS_HELP_STRING(--enable-octagon1008, enable Octagon 1008 stuff),
	[case "${enableval}" in
		yes) OCTAGON1008=octagon1008 ;;
	esac],[enable_octagon1008=no])
AM_CONDITIONAL(ENABLE_OCTAGON1008,test "$enable_octagon1008" = "yes")
AC_SUBST(OCTAGON1008)

AC_ARG_ENABLE(hs7110,
	AS_HELP_STRING(--enable-hs7110, enable fortis hs7110 stuff),
	[case "${enableval}" in
		yes) HS7110=hs7110 ;;
	esac],[enable_hs7110=no])
AM_CONDITIONAL(ENABLE_HS7110,test "$enable_hs7110" = "yes")
AC_SUBST(HS7110)

AC_ARG_ENABLE(hs7810a,
	AS_HELP_STRING(--enable-hs7810a, enable fortis hs7810a stuff),
	[case "${enableval}" in
		yes) HS7810A=hs7810a ;;
	esac],[enable_hs7810a=no])
AM_CONDITIONAL(ENABLE_HS7810A,test "$enable_hs7810a" = "yes")
AC_SUBST(HS7810A)

AC_ARG_ENABLE(hs7119,
	AS_HELP_STRING(--enable-hs7119, enable fortis hs7119 stuff),
	[case "${enableval}" in
		yes) HS7119=hs7119 ;;
	esac],[enable_hs7119=no])
AM_CONDITIONAL(ENABLE_HS7119,test "$enable_hs7119" = "yes")
AC_SUBST(HS7119)

AC_ARG_ENABLE(hs7819,
	AS_HELP_STRING(--enable-hs7819, enable fortis hs7819 stuff),
	[case "${enableval}" in
		yes) HS7819=hs7819 ;;
	esac],[enable_hs7819=no])
AM_CONDITIONAL(ENABLE_HS7819,test "$enable_hs7819" = "yes")
AC_SUBST(HS7819)

AC_ARG_ENABLE(fortis_dp7000,
	AS_HELP_STRING(--enable-fortis_dp7000, enable fortis_dp7000 stuff),
	[case "${enableval}" in
		yes) FORTIS_DP7000=fortis_dp7000 ;;
	esac],[enable_fortis_dp7000=no])
AM_CONDITIONAL(ENABLE_FORTIS_DP7000,test "$enable_fortis_dp7000" = "yes")
AC_SUBST(FORTIS_DP7000)

AC_ARG_ENABLE(tf7700,
	AS_HELP_STRING(--enable-tf7700, enable topfield tf7700 stuff),
	[case "${enableval}" in
		yes) TF7700=tf7700 ;;
	esac],[enable_tf7700=no])
AM_CONDITIONAL(ENABLE_TF7700,test "$enable_tf7700" = "yes")
AC_SUBST(TF7700)

AC_ARG_ENABLE(hl101,
	AS_HELP_STRING(--enable-hl101, enable spider box hl101 stuff),
	[case "${enableval}" in
		yes) HL101=hl101 ;;
	esac],[enable_hl101=no])
AM_CONDITIONAL(ENABLE_HL101,test "$enable_hl101" = "yes")
AC_SUBST(HL101)

AC_ARG_ENABLE(vip2_v1,
	AS_HELP_STRING(--enable-vip2_v1, enable edision argus vip2_v1 stuff),
	[case "${enableval}" in
		yes) VIP2_V1=vip2_v1 ;;
	esac],[enable_vip2_v1=no])
AM_CONDITIONAL(ENABLE_VIP2_V1,test "$enable_vip2_v1" = "yes")
AC_SUBST(VIP2_V1)

AC_ARG_ENABLE(vip1_v2,
	AS_HELP_STRING(--enable-vip1_v2, enable edision argus vip1_v2 stuff),
	[case "${enableval}" in
		yes) VIP1_V2=vip1_v2 ;;
	esac],[enable_vip1_v2=no])
AM_CONDITIONAL(ENABLE_VIP1_V2,test "$enable_vip1_v2" = "yes")
AC_SUBST(VIP1_V2)

AC_ARG_ENABLE(spark,
	AS_HELP_STRING(--enable-spark, enable spark),
	[case "${enableval}" in
		yes) SPARK=spark ;;
	esac],[enable_spark=no])
AM_CONDITIONAL(ENABLE_SPARK,test "$enable_spark" = "yes")
AC_SUBST(SPARK)

AC_ARG_ENABLE(spark7162,
	AS_HELP_STRING(--enable-spark7162, enable spark7162),
	[case "${enableval}" in
		yes) SPARK7162=spark7162 ;;
	esac],[enable_spark7162=no])
AM_CONDITIONAL(ENABLE_SPARK7162,test "$enable_spark7162" = "yes")
AC_SUBST(SPARK7162)

AC_ARG_ENABLE(adb_box,
	AS_HELP_STRING(--enable-adb_box, enable adb_box stuff),
	[case "${enableval}" in
		yes) ADB_BOX=adb_box ;;
	esac],[enable_adb_box=no])
AM_CONDITIONAL(ENABLE_ADB_BOX,test "$enable_adb_box" = "yes")
AC_SUBST(ADB_BOX)

AC_ARG_ENABLE(ufs922,
	AS_HELP_STRING(--enable-ufs922, enable kathrein ufs922 stuff),
	[case "${enableval}" in
		yes) UFS922=ufs922 ;;
	esac],[enable_ufs922=no])
AM_CONDITIONAL(ENABLE_UFS922,test "$enable_ufs922" = "yes")
AC_SUBST(UFS922)

AC_ARG_ENABLE(ufc960,
	AS_HELP_STRING(--enable-ufc960,    enable kathrein ufc960 stuff),
	[case "${enableval}" in
		yes) UFC960=ufc960 ;;
	esac],[enable_ufc960=no])
AM_CONDITIONAL(ENABLE_UFC960,test "$enable_ufc960" = "yes")
AC_SUBST(UFC960)

AC_ARG_ENABLE(ufs910,
	AS_HELP_STRING(--enable-ufs910, enable kathrein ufs910 stuff),
	[case "${enableval}" in
		yes) UFS910=ufs910 ;;
	esac],[enable_ufs910=no])
AM_CONDITIONAL(ENABLE_UFS910,test "$enable_ufs910" = "yes")
AC_SUBST(UFS910)

AC_ARG_ENABLE(ufs912,
	AS_HELP_STRING(--enable-ufs912, enable kathrein ufs912 stuff),
	[case "${enableval}" in
		yes) UFS912=ufs912 ;;
	esac],[enable_ufs912=no])
AM_CONDITIONAL(ENABLE_UFS912,test "$enable_ufs912" = "yes")
AC_SUBST(UFS912)

AC_ARG_ENABLE(ufs913,
	AS_HELP_STRING(--enable-ufs913, enable kathrein ufs913 stuff),
	[case "${enableval}" in
		yes) UFS913=ufs913 ;;
	esac],[enable_ufs913=no])
AM_CONDITIONAL(ENABLE_UFS913,test "$enable_ufs913" = "yes")
AC_SUBST(UFS913)

AC_ARG_ENABLE(vitamin_hd5000,
	AS_HELP_STRING(--enable-vitamin_hd5000,    enable vitamin_hd5000 stuff),
	[case "${enableval}" in
		yes) VITAMIN_HD5000=vitamin_hd5000 ;;
	esac],[enable_vitamin_hd5000=no])
AM_CONDITIONAL(ENABLE_VITAMIN_HD5000,test "$enable_vitamin_hd5000" = "yes")
AC_SUBST(VITAMIN_HD5000)

AC_ARG_ENABLE(sagemcom88,
	AS_HELP_STRING(--enable-sagemcom88,    enable sagemcom88 stuff),
	[case "${enableval}" in
		yes) SAGEMCOM88=sagemcom88 ;;
	esac],[enable_sagemcom88=no])
AM_CONDITIONAL(ENABLE_SAGEMCOM88,test "$enable_sagemcom88" = "yes")
AC_SUBST(SAGEMCOM88)

AC_ARG_ENABLE(atemio520,
	AS_HELP_STRING(--enable-atemio520, enable atemio520 stuff),
	[case "${enableval}" in
		yes) ATEMIO520=atemio520 ;;
	esac],[enable_ATEMIO520=no])
AM_CONDITIONAL(ENABLE_ATEMIO520,test "$enable_atemio520" = "yes")
AC_SUBST(ATEMIO520)

AC_ARG_ENABLE(atemio530,
	AS_HELP_STRING(--enable-atemio530, enable atemio530 stuff),
	[case "${enableval}" in
		yes) ATEMIO530=atemio530 ;;
	esac],[enable_ATEMIO530=no])
AM_CONDITIONAL(ENABLE_ATEMIO530,test "$enable_atemio530" = "yes")
AC_SUBST(ATEMIO530)

AC_ARG_ENABLE(cuberevo,
	AS_HELP_STRING(--enable-cuberevo, enable cuberevo stuff),
	[case "${enableval}" in
		yes) CUBEREVO=cuberevo ;;
	esac],[enable_cuberevo=no])
AM_CONDITIONAL(ENABLE_CUBEREVO,test "$enable_cuberevo" = "yes")
AC_SUBST(CUBEREVO)

AC_ARG_ENABLE(cuberevo_mini,
	AS_HELP_STRING(--enable-cuberevo_mini, enable cuberevo mini stuff),
	[case "${enableval}" in
		yes) CUBEREVO_MINI=cuberevo_mini ;;
	esac],[enable_cuberevo_mini=no])
AM_CONDITIONAL(ENABLE_CUBEREVO_MINI,test "$enable_cuberevo_mini" = "yes")
AC_SUBST(CUBEREVO_MINI)

AC_ARG_ENABLE(cuberevo_mini2,
	AS_HELP_STRING(--enable-cuberevo_mini2, enable cuberevo mini 2 stuff),
	[case "${enableval}" in
		yes) CUBEREVO_MINI2=cuberevo_mini2 ;;
	esac],[enable_cuberevo_mini2=no])
AM_CONDITIONAL(ENABLE_CUBEREVO_MINI2,test "$enable_cuberevo_mini2" = "yes")
AC_SUBST(CUBEREVO_MINI2)

AC_ARG_ENABLE(cuberevo_mini_fta,
	AS_HELP_STRING(--enable-cuberevo_mini_fta, enable cuberevo mini fta stuff),
	[case "${enableval}" in
		yes) CUBEREVO_MINI_FTA=cuberevo_mini_fta ;;
	esac],[enable_cuberevo_mini_fta=no])
AM_CONDITIONAL(ENABLE_CUBEREVO_MINI_FTA,test "$enable_cuberevo_mini_fta" = "yes")
AC_SUBST(CUBEREVO_MINI_FTA)

AC_ARG_ENABLE(cuberevo_250hd,
	AS_HELP_STRING(--enable-cuberevo_250hd, enable cuberevo 250hd stuff),
	[case "${enableval}" in
		yes) CUBEREVO_250HD=cuberevo_250hd ;;
	esac],[enable_cuberevo_250hd=no])
AM_CONDITIONAL(ENABLE_CUBEREVO_250HD,test "$enable_cuberevo_250hd" = "yes")
AC_SUBST(CUBEREVO_250HD)

AC_ARG_ENABLE(cuberevo_2000hd,
	AS_HELP_STRING(--enable-cuberevo_2000hd, enable cuberevo 2000hd stuff),
	[case "${enableval}" in
		yes) CUBEREVO_2000HD=cuberevo_2000hd ;;
	esac],[enable_cuberevo_2000hd=no])
AM_CONDITIONAL(ENABLE_CUBEREVO_2000HD,test "$enable_cuberevo_2000hd" = "yes")
AC_SUBST(CUBEREVO_2000HD)

AC_ARG_ENABLE(cuberevo_9500hd,
	AS_HELP_STRING(--enable-cuberevo_9500hd, enable cuberevo 9500hd stuff),
	[case "${enableval}" in
		yes) CUBEREVO_9500HD=cuberevo_9500hd ;;
	esac],[enable_cuberevo_9500hd=no])
AM_CONDITIONAL(ENABLE_CUBEREVO_9500HD,test "$enable_cuberevo_9500hd" = "yes")
AC_SUBST(CUBEREVO_9500HD)

AC_ARG_ENABLE(cuberevo_3000hd,
	AS_HELP_STRING(--enable-cuberevo_3000hd, enable cuberevo 3000hd stuff),
	[case "${enableval}" in
		yes) CUBEREVO_3000HD=cuberevo_3000hd ;;
	esac],[enable_cuberevo_3000hd=no])
AM_CONDITIONAL(ENABLE_CUBEREVO_3000HD,test "$enable_cuberevo_3000hd" = "yes")
AC_SUBST(CUBEREVO_3000HD)

AC_ARG_ENABLE(homecast5101,
	AS_HELP_STRING(--enable-homecast5101, enable homecast 5101 stuff),
	[case "${enableval}" in
		yes) HOMECAST5101=hs5101 ;;
	esac],[enable_homecast5101=no])
AM_CONDITIONAL(ENABLE_HOMECAST5101,test "$enable_homecast5101" = "yes")
AC_SUBST(HOMECAST5101)

AC_ARG_ENABLE(arivalink200,
	AS_HELP_STRING(--enable-arivalink200, enable arivalink200 stuff),
	[case "${enableval}" in
		yes) ARIVALINK200=arivalink200 ;;
	esac],[enable_arivalink200=no])
AM_CONDITIONAL(ENABLE_ARIVALINK200,test "$enable_arivalink200" = "yes")
AC_SUBST(ARIVALINK200)

AC_ARG_ENABLE(ipbox9900,
	AS_HELP_STRING(--enable-ipbox9900, enable ipbox 9900 stuff),
	[case "${enableval}" in
		yes) IPBOX9900=ipbox9900 ;;
	esac],[enable_ipbox9900=no])
AM_CONDITIONAL(ENABLE_IPBOX9900,test "$enable_ipbox9900" = "yes")
AC_SUBST(IPBOX9900)

AC_ARG_ENABLE(ipbox99,
	AS_HELP_STRING(--enable-ipbox99, enable ipbox 99 stuff),
	[case "${enableval}" in
		yes) IPBOX99=ipbox99 ;;
	esac],[enable_ipbox99=no])
AM_CONDITIONAL(ENABLE_IPBOX99,test "$enable_ipbox99" = "yes")
AC_SUBST(IPBOX99)

AC_ARG_ENABLE(ipbox55,
	AS_HELP_STRING(--enable-ipbox55, enable ipbox 55 stuff),
	[case "${enableval}" in
		yes) IPBOX55=ipbox55 ;;
	esac],[enable_ipbox55=no])
AM_CONDITIONAL(ENABLE_IPBOX55,test "$enable_ipbox55" = "yes")
AC_SUBST(IPBOX55)

AC_PREFIX_DEFAULT(/ufs910)
if test "$prefix" = "NONE"; then
	prefix=/ufs910
fi

AC_ARG_WITH(targetprefix,
	[  --with-targetprefix=DIR prefix for target files [[PREFIX/cdkroot]]],
	[targetprefix="$with_targetprefix"],[targetprefix="${prefix}/cdkroot"])

AC_ARG_WITH(hostprefix,
	[  --with-hostprefix=DIR   prefix for host files [[PREFIX/host]]],
	[hostprefix="$with_hostprefix"],[hostprefix="${prefix}/host"])

AC_ARG_WITH(bootprefix,
	[  --with-bootprefix=DIR   prefix for boot files [[PREFIX/cdkroot-tftpboot]]],
	[bootprefix="$with_bootprefix"],[bootprefix="${prefix}/cdkroot-tftpboot"])

AC_ARG_WITH(serversupport,
	[  --with-serversupport=DIR    prefix for server file templates [[PREFIX/serversupport]]],
	[serversupport="$with_serversupport"],[serversupport="${prefix}/serversupport"])

AC_ARG_WITH(customizationsdir,
	[  --with-customizationsdir=DIR    optional directory containing customization scripts [[[CVS]]]],
	[customizationsdir="$with_customizationsdir"],[customizationsdir="`pwd`"])

AC_ARG_WITH(flashscriptdir,
	[  --with-flashscriptdir=DIR    optional directory containing flash scripts [[[CVS]]]],
	[flashscriptdir="$with_flashscriptdir"],[flashscriptdir=])

AC_ARG_WITH(updatehttpprefix,
	[  --with-updatehttpprefix=URL  optional URL containing the URL of a directory with update images [[NONE]]],
	[updatehttpprefix="$with_updatehttpprefix"],[updatehttpprefix=])

buildprefix=`pwd`
kernelprefix=$buildprefix
AC_SUBST(kernelprefix)
AC_SUBST(targetprefix)
AC_SUBST(hostprefix)
AC_SUBST(buildprefix)
AC_SUBST(bootprefix)
AC_SUBST(serversupport)
AC_SUBST(customizationsdir)
AC_SUBST(flashscriptdir)
AC_SUBST(updatehttpprefix)
AM_CONDITIONAL(DISABLE_UPDATE_HTTP,test "$updatehttpprefix" = "disable")

AC_ARG_WITH(cvsdir,
	[  --with-cvsdir=DIR       where to find the cvs],
	[cvsdir="$with_cvsdir"],[cvsdir="NONE"])

AC_ARG_WITH(appsdir,
	[  --with-appsdir=DIR      apps dir from cvs [[[CVS/]apps/]]],
	[appsdir="$with_appsdir"],[appsdir="NONE"])

AC_ARG_WITH(driverdir,
	[  --with-driverdir=DIR    driver dir from cvs [[[CVS/]driver]]],
	[driverdir="$with_driverdir"],[driverdir="NONE"])

AC_ARG_WITH(sourcedir,
	[  --with-sourcedir=DIR      source dir from cvs [[source/]]],
	[sourcedir="$with_sourcedir"],[sourcedir="NONE"])

AC_ARG_WITH(buildtmp,
	[  --with-buildtmp=DIR      buildtmp dir from cvs [[buildtmp/]]],
	[buildtmp="$with_buildtmp"],[buildtmp="NONE"])

AC_ARG_WITH(gnuserver,
	[  --with-gnuserver=ADDRESS   the gnu server for gnu-stuff (without ftp://)],
	[gnuserver="$with_gnuserver"],[gnuserver=ftp.gwdg.de/pub/misc/gnu/ftp/gnu])

AC_ARG_WITH(defaultserver,
	[  --with-defaultserver=ADDRESS   the server that is taken if no server is given/works (without http://)],
	[defaultserver="$with_defaultserver"],[defaultserver="NONE"])

AC_ARG_WITH(archivedir,
	[  --with-archivedir=DIR   where to store downloaded files [[Archive/]]],
	[archivedir="$with_archivedir"],[archivedir="$buildprefix/Archive"])

if test "$defaultserver" = "NONE"; then
	defaultserver=""
fi

if test "$cvsdir" = "NONE"; then
	if test "$appsdir" = "NONE"; then
		appsdir="$buildprefix/apps"
	fi
	if test "$driverdir" = "NONE"; then
		driverdir="$buildprefix/driver"
	fi
	if test "$sourcedir" = "NONE"; then
		sourcedir="$buildprefix/source"
	fi
	if test "$buildtmp" = "NONE"; then
		buildtmp="$buildprefix/build_tmp"
	fi
else
	if test "$appsdir" = "NONE"; then
		appsdir="$cvsdir/apps"
	fi
	if test "$driverdir" = "NONE"; then
		driverdir="$cvsdir/driver"
	fi
	if test "$sourcedir" = "NONE"; then
		sourcedir="$cvsdir/source"
	fi
	if test "$buildtmp" = "NONE"; then
		buildtmp="$cvsdir/build_tmp"
	fi
fi

AC_SUBST(cvsdir)
AC_SUBST(appsdir)
AC_SUBST(driverdir)
AC_SUBST(sourcedir)
AC_SUBST(buildtmp)
AC_SUBST(gnuserver)
AC_SUBST(defaultserver)
AC_SUBST(archivedir)

if test -z "$CFLAGS" ; then
	CFLAGS="-O2"
fi

if test -z "$TARGET_CFLAGS" -o -z "$TARGET_CXXFLAGS"; then
	TARGET_CFLAGS="-pipe"
	if test "$enable_debug" = "yes"; then
		TARGET_CFLAGS="$TARGET_CFLAGS -O2 -g -gdwarf-2"
		TARGET_LDFLAGS=""
	else
		TARGET_CFLAGS="$TARGET_CFLAGS -Os"
		TARGET_LDFLAGS=""
	fi
	TARGET_LDFLAGS="$TARGET_LDFLAGS -Wl,-rpath -Wl,/usr/lib -Wl,-rpath-link -Wl,$targetprefix/usr/lib -L$targetprefix/usr/lib -L$targetprefix/lib"
	TARGET_CFLAGS="$TARGET_CFLAGS -I$targetprefix/usr/include"
	TARGET_CXXFLAGS="$TARGET_CFLAGS"
fi
AC_SUBST(CFLAGS)
AC_SUBST(TARGET_CFLAGS)
AC_SUBST(TARGET_CXXFLAGS)
AC_SUBST(TARGET_LDFLAGS)


dircheck="ok"
AC_MSG_CHECKING([for apps directory])
if test ! -f "$appsdir/acinclude.m4" ; then
	AC_MSG_WARN([appsdir $appsdir not found])
	appsdir="missing_appsdir"
	dircheck="fail"
else
	AC_MSG_RESULT([yes])
fi

AC_PATH_PROG(M4,m4,no)
if test "$M4" = "no"; then
	AC_MSG_WARN(No m4 found)
fi

AC_PATH_PROG(BZIP2,bzip2,no)
if test "$BZIP2" = "no"; then
	AC_MSG_WARN(No bzip2 found)
fi

AC_PATH_PROG(MAKEINFO,makeinfo,no)
if test "$MAKEINFO" = "no"; then
	AC_MSG_WARN(No makeinfo found)
fi

AC_PROG_CXX
if test "$CXX" = "g++" -a "$GXX" != "yes"; then
	AC_MSG_ERROR(No g++ found)
fi

AC_PROG_LEX
if test "$LEX" != "flex"; then
	AC_MSG_ERROR(No flex found)
fi

AC_PROG_YACC
if test "$YACC" != "bison -y"; then
	AC_MSG_ERROR(No bison found)
fi

################################################################
# ccache
#
AC_ARG_ENABLE(ccache,
	AS_HELP_STRING(--enable-ccache,   enable ccache supported compiling ),
	[case "${enableval}" in
		yes) CCACHE=ccache ;;
	esac],[enable_ccache=no])
AM_CONDITIONAL(ENABLE_CCACHE,test "$enable_ccache" = "yes")
AC_SUBST(CCACHE)

hostccachedir=$(dirname `which ccache` 2>/dev/null)
if [[ -e $hostccachedir/ccache ]]; then
	ccachedir=$hostccachedir
	AM_CONDITIONAL(USE_CCACHEHOST, true)
else
	ccachedir=$hostprefix/bin
	AM_CONDITIONAL(USE_CCACHEHOST, false)
fi
AC_SUBST(ccachedir)

# optional ccache settings
AC_ARG_WITH(maxcachesize,
	[  --with-maxcachesize=SIZE 
						maximal ccachesize for ccache ],
	[maxcachesize="$with_maxcachesize"],[maxcachesize="-1"])
AC_SUBST(maxcachesize)

AC_ARG_WITH(maxcachefiles,
	[  --with-maxcachefiles=COUNT 
						maximal count of cachefiles for ccache ],
	[maxcachefiles="$with_maxcachefiles"],[maxcachefiles="-1"])
AC_SUBST(maxcachefiles)

if test "$enable_ccache" = "yes"; then
	if  [[ -e $ccachedir/ccache ]]; then
		if test $maxcachesize != -1; then
			$ccachedir/ccache -M $maxcachesize
		fi
		if test $maxcachefiles != -1; then
			$ccachedir/ccache -F $maxcachefiles
		fi
		ccacheinfo="
----------------------------------------
ccache installdir                   $ccachedir
$($ccachedir/ccache -s)
----------------------------------------"
	else
		ccacheinfo="
----------------------------------------
ccache installdir                    $ccachedir
ccache is not yet installed, but installation starts on first build of cdk environment or you can run make ccache
----------------------------------------"
	fi
fi

################################################################

AC_SUBST(CLEANUP)
CLEANUP="rm -rf"

AC_SUBST(DEPSCLEANUP)
DEPSCLEANUP="rm -f"

#
# core
#
AC_SUBST(KERNELVERSION)
AC_SUBST(KERNELSTMLABEL)
AC_SUBST(KERNELLABEL)
AC_SUBST(PATCH_STR)
AC_SUBST(KERNEL_DIR)

if test "$enable_p0209" == "yes"; then
	TUXBOX_RULES_MAKE(linuxp0209)
	KERNELVERSION=${VERSION_linuxp0209}
	KERNELSTMLABEL="_${VERSION_linuxp0209#*_}"
	KERNELLABEL="209"
	PATCH_STR="_0209"
	KERNEL_DIR="linux-sh4-${VERSION_linuxp0209}"
elif test "$enable_p0211" == "yes"; then
	TUXBOX_RULES_MAKE(linuxp0211)
	KERNELVERSION=${VERSION_linuxp0211}
	KERNELSTMLABEL="_${VERSION_linuxp0211#*_}"
	KERNELLABEL="211"
	PATCH_STR="_0211"
	KERNEL_DIR="linux-sh4-${VERSION_linuxp0211}"
elif test "$enable_p0214" == "yes"; then
	TUXBOX_RULES_MAKE(linuxp0214)
	KERNELVERSION=${VERSION_linuxp0214}
	KERNELSTMLABEL="_${VERSION_linuxp0214#*_}"
	KERNELLABEL="214"
	PATCH_STR="_0214"
	KERNEL_DIR="linux-sh4-${VERSION_linuxp0214}"
elif test "$enable_p0215" == "yes"; then
	TUXBOX_RULES_MAKE(linuxp0215)
	KERNELVERSION=${VERSION_linuxp0215}
	KERNELSTMLABEL="_${VERSION_linuxp0215#*_}"
	KERNELLABEL="215"
	PATCH_STR="_0215"
	KERNEL_DIR="linux-sh4-${VERSION_linuxp0215}"
elif test "$enable_p0217" == "yes"; then
	TUXBOX_RULES_MAKE(linuxp0217)
	KERNELVERSION=${VERSION_linuxp0217}
	KERNELSTMLABEL="_${VERSION_linuxp0217#*_}"
	KERNELLABEL="217"
	PATCH_STR="_0217"
	KERNEL_DIR="linux-sh4-${VERSION_linuxp0217}"
fi

AC_SUBST(EXTERNALLCD_DEP)
if test "$enable_externallcd" == "yes"; then
	EXTERNALLCD="yes"
	EXTERNALLCD_DEP="graphlcd"
else
	EXTERNALLCD="no"
	EXTERNALLCD_DEP=""
fi

AC_SUBST(MEDIAFW)
AC_SUBST(MEDIAFW_DEP)
if test "$enable_mediafwgstreamer" == "yes"; then
	MEDIAFW="gstreamer"
	MEDIAFW_DEP="gst_plugins_dvbmediasink"
elif test "$enable_buildinplayer" == "yes"; then
	MEDIAFW="build-in player"
	MEDIAFW_DEP="ffmpeg"
else
	MEDIAFW="eplayer3"
	MEDIAFW_DEP="ffmpeg"
fi

#
# bootstrap sh4
#
TUXBOX_RULES_MAKE(host_u_boot_tools)

#
# core
#
TUXBOX_RULES_MAKE(ccache)
TUXBOX_RULES_MAKE(host_cramfs)
TUXBOX_RULES_MAKE(host_squashfs)
TUXBOX_RULES_MAKE(host_pkgconfig)
TUXBOX_RULES_MAKE(host_module_init_tools)
TUXBOX_RULES_MAKE(host_mtd_utils)
TUXBOX_RULES_MAKE(host_glib2_genmarshal)
TUXBOX_RULES_MAKE(host_libffi)
TUXBOX_RULES_MAKE(uboot_tf7700)

#
# root
#
TUXBOX_RULES_MAKE(busybox)
TUXBOX_RULES_MAKE(lsb)
TUXBOX_RULES_MAKE(ipkg)
TUXBOX_RULES_MAKE(module_init_tools)
TUXBOX_RULES_MAKE(sysvinit)

#
# Graphics and Font Libraries
#
TUXBOX_RULES_MAKE(libfreetype)
TUXBOX_RULES_MAKE(fontconfig)
TUXBOX_RULES_MAKE(libfribidi)
TUXBOX_RULES_MAKE(libgif)
TUXBOX_RULES_MAKE(libgif_e2)
TUXBOX_RULES_MAKE(libungif)
TUXBOX_RULES_MAKE(libjpeg)
TUXBOX_RULES_MAKE(libjpeg_turbo)
TUXBOX_RULES_MAKE(libpng12)
TUXBOX_RULES_MAKE(libpng)
TUXBOX_RULES_MAKE(libtiff)
TUXBOX_RULES_MAKE(pixman)

#
# Multimedia Libraries and Drivers
#
TUXBOX_RULES_MAKE(libalsa)
TUXBOX_RULES_MAKE(alsautils)
TUXBOX_RULES_MAKE(libflac)
TUXBOX_RULES_MAKE(a52dec)
TUXBOX_RULES_MAKE(libao)
TUXBOX_RULES_MAKE(libass)
TUXBOX_RULES_MAKE(libbluray)
TUXBOX_RULES_MAKE(libdvdcss)
TUXBOX_RULES_MAKE(libdvdnav)
TUXBOX_RULES_MAKE(libdvdread)
TUXBOX_RULES_MAKE(libid3tag)
TUXBOX_RULES_MAKE(libmad)
TUXBOX_RULES_MAKE(libmpeg2)
TUXBOX_RULES_MAKE(libogg)
TUXBOX_RULES_MAKE(libsamplerate)
TUXBOX_RULES_MAKE(libvorbis)
TUXBOX_RULES_MAKE(libvorbisidec)
TUXBOX_RULES_MAKE(libdca)

#
# contrib libs
#
TUXBOX_RULES_MAKE(libncurses)
TUXBOX_RULES_MAKE(gmp)
TUXBOX_RULES_MAKE(lua)
TUXBOX_RULES_MAKE(luacurl)
TUXBOX_RULES_MAKE(luaexpat)
TUXBOX_RULES_MAKE(howl)
TUXBOX_RULES_MAKE(libopenthreads)
TUXBOX_RULES_MAKE(pugixml)
TUXBOX_RULES_MAKE(libboost)
TUXBOX_RULES_MAKE(zlib)
TUXBOX_RULES_MAKE(libcap)
TUXBOX_RULES_MAKE(libreadline)
TUXBOX_RULES_MAKE(lirc)
TUXBOX_RULES_MAKE(libsigc_e2)
TUXBOX_RULES_MAKE(libsigc)
TUXBOX_RULES_MAKE(glib2)
TUXBOX_RULES_MAKE(libffi)
TUXBOX_RULES_MAKE(libiconv)
TUXBOX_RULES_MAKE(libmng)
TUXBOX_RULES_MAKE(lcms)
TUXBOX_RULES_MAKE(directfb)
TUXBOX_RULES_MAKE(dfbpp)
TUXBOX_RULES_MAKE(libstgles)
TUXBOX_RULES_MAKE(libexpat)
TUXBOX_RULES_MAKE(libxmlccwrap)
TUXBOX_RULES_MAKE(ffmpeg)
TUXBOX_RULES_MAKE(libfdk_aac)
TUXBOX_RULES_MAKE(webkitdfb)
TUXBOX_RULES_MAKE(icu4c)
TUXBOX_RULES_MAKE(enchant)
TUXBOX_RULES_MAKE(lite)
TUXBOX_RULES_MAKE(sqlite)
TUXBOX_RULES_MAKE(cairo)
TUXBOX_RULES_MAKE(evebrowser)
TUXBOX_RULES_MAKE(brofs)
TUXBOX_RULES_MAKE(librtmpdump)
TUXBOX_RULES_MAKE(libdvbsipp)
TUXBOX_RULES_MAKE(libmodplug)
TUXBOX_RULES_MAKE(lzo)
TUXBOX_RULES_MAKE(yajl)
TUXBOX_RULES_MAKE(libpcre)
TUXBOX_RULES_MAKE(libcdio)
TUXBOX_RULES_MAKE(jasper)
TUXBOX_RULES_MAKE(mysql)
TUXBOX_RULES_MAKE(libmicrohttpd)
TUXBOX_RULES_MAKE(libexif)
TUXBOX_RULES_MAKE(minidlna)
TUXBOX_RULES_MAKE(djmount)
TUXBOX_RULES_MAKE(libupnp)
TUXBOX_RULES_MAKE(rarfs)
TUXBOX_RULES_MAKE(sshfs)
TUXBOX_RULES_MAKE(tinyxml)
TUXBOX_RULES_MAKE(libnfs)
TUXBOX_RULES_MAKE(taglib)
TUXBOX_RULES_MAKE(libdaemon)
TUXBOX_RULES_MAKE(libplist)
TUXBOX_RULES_MAKE(libxml2)
TUXBOX_RULES_MAKE(libxml2_e2)
TUXBOX_RULES_MAKE(libxslt)

#
# contrib apps
#
TUXBOX_RULES_MAKE(bzip2)
TUXBOX_RULES_MAKE(grep)
TUXBOX_RULES_MAKE(openrdate)
TUXBOX_RULES_MAKE(mc)
TUXBOX_RULES_MAKE(console_data)
TUXBOX_RULES_MAKE(nano)
TUXBOX_RULES_MAKE(rsync)
TUXBOX_RULES_MAKE(curlftpfs)
TUXBOX_RULES_MAKE(pngquant)
TUXBOX_RULES_MAKE(mplayer)
TUXBOX_RULES_MAKE(mencoder)
TUXBOX_RULES_MAKE(opkg)
TUXBOX_RULES_MAKE(sysstat)
TUXBOX_RULES_MAKE(imagemagick)
TUXBOX_RULES_MAKE(shairport)
TUXBOX_RULES_MAKE(dbus)
TUXBOX_RULES_MAKE(avahi)
TUXBOX_RULES_MAKE(mtd_utils)
TUXBOX_RULES_MAKE(wget)

#
# python
#
TUXBOX_RULES_MAKE(host_python)
TUXBOX_RULES_MAKE(python)
TUXBOX_RULES_MAKE(python_gdata)
TUXBOX_RULES_MAKE(python_elementtree)
TUXBOX_RULES_MAKE(python_lxml)
TUXBOX_RULES_MAKE(python_setuptools)
TUXBOX_RULES_MAKE(python_twisted)
TUXBOX_RULES_MAKE(python_imaging)
TUXBOX_RULES_MAKE(python_pycrypto)
TUXBOX_RULES_MAKE(python_pyusb)
TUXBOX_RULES_MAKE(python_six)
TUXBOX_RULES_MAKE(python_cffi)
TUXBOX_RULES_MAKE(python_enum34)
TUXBOX_RULES_MAKE(python_pyasn1)
TUXBOX_RULES_MAKE(python_pyasn1_modules)
TUXBOX_RULES_MAKE(python_pycparser)
TUXBOX_RULES_MAKE(python_cryptography)
TUXBOX_RULES_MAKE(python_pyopenssl)
TUXBOX_RULES_MAKE(python_wifi)
TUXBOX_RULES_MAKE(python_cheetah)
TUXBOX_RULES_MAKE(python_mechanize)
TUXBOX_RULES_MAKE(python_zope_interface)
TUXBOX_RULES_MAKE(python_requests)
TUXBOX_RULES_MAKE(python_futures)
TUXBOX_RULES_MAKE(python_singledispatch)
TUXBOX_RULES_MAKE(python_livestreamer)
TUXBOX_RULES_MAKE(python_livestreamersrv)

#
# gstreamer
#
TUXBOX_RULES_MAKE(orc)
TUXBOX_RULES_MAKE(gst_gmediarender)
TUXBOX_RULES_MAKE(gst_plugins_dvbmediasink)
TUXBOX_RULES_MAKE(gstreamer)
TUXBOX_RULES_MAKE(gst_plugins_base)
TUXBOX_RULES_MAKE(gst_plugins_good)
TUXBOX_RULES_MAKE(gst_plugins_bad)
TUXBOX_RULES_MAKE(gst_plugins_ugly)
TUXBOX_RULES_MAKE(gst_libav)
TUXBOX_RULES_MAKE(gst_plugins_fluendo_mpegdemux)
TUXBOX_RULES_MAKE(gst_plugin_subsink)

#
# enigma2
#
TUXBOX_RULES_MAKE(tuxtxtlib)
TUXBOX_RULES_MAKE(tuxtxt32bpp)
TUXBOX_RULES_MAKE(enigma2_networkbrowser)
TUXBOX_RULES_MAKE(enigma2_webinterface)
TUXBOX_RULES_MAKE(enigma2_openwebif)
TUXBOX_RULES_MAKE(enigma2_plugins_all)
TUXBOX_RULES_MAKE(hotplug_e2)
TUXBOX_RULES_MAKE(libdreamdvd)

#
# external lcd
#
TUXBOX_RULES_MAKE(graphlcd)
TUXBOX_RULES_MAKE(lcd4_linux)
TUXBOX_RULES_MAKE(libusb)
TUXBOX_RULES_MAKE(libusbcompat)
TUXBOX_RULES_MAKE(libgd2)
TUXBOX_RULES_MAKE(libdpfax)

#
# Security
#
TUXBOX_RULES_MAKE(openssl_old)
TUXBOX_RULES_MAKE(openssl)
TUXBOX_RULES_MAKE(gnutls)
TUXBOX_RULES_MAKE(nettle)

#
# File Systems and Disk Management
#
TUXBOX_RULES_MAKE(dosfstools)
TUXBOX_RULES_MAKE(e2fsprogs)
TUXBOX_RULES_MAKE(fdisk)
TUXBOX_RULES_MAKE(fuse)
TUXBOX_RULES_MAKE(hddtemp)
TUXBOX_RULES_MAKE(hdparm)
TUXBOX_RULES_MAKE(jfsutils)
TUXBOX_RULES_MAKE(lm_sensors)
TUXBOX_RULES_MAKE(parted)
TUXBOX_RULES_MAKE(sdparm)
TUXBOX_RULES_MAKE(utillinux)
TUXBOX_RULES_MAKE(xfsprogs)

#
# Networking Libraries / Networking Utilities
#
TUXBOX_RULES_MAKE(autofs)
TUXBOX_RULES_MAKE(libcurl)
TUXBOX_RULES_MAKE(portmap)
TUXBOX_RULES_MAKE(nfs_utils)
TUXBOX_RULES_MAKE(libevent)
TUXBOX_RULES_MAKE(libnfsidmap)
TUXBOX_RULES_MAKE(libsoup)
TUXBOX_RULES_MAKE(vsftpd)
TUXBOX_RULES_MAKE(samba)
TUXBOX_RULES_MAKE(netio)
TUXBOX_RULES_MAKE(ntp)
TUXBOX_RULES_MAKE(lighttpd)
TUXBOX_RULES_MAKE(wireless_tools)
TUXBOX_RULES_MAKE(zd1211)
TUXBOX_RULES_MAKE(libnl)
TUXBOX_RULES_MAKE(wpa_supplicant)
TUXBOX_RULES_MAKE(ethtool)
TUXBOX_RULES_MAKE(xupnpd)
TUXBOX_RULES_MAKE(udpxy)
TUXBOX_RULES_MAKE(glibnetworking)
TUXBOX_RULES_MAKE(openvpn)
TUXBOX_RULES_MAKE(openssh)

#
# TVHEADEND
#

#
# localmacros
#
crossprefix=$prefix/cross
AC_SUBST(crossprefix)

#
# mkdir
#
test -d $prefix || mkdir $prefix
test -d $buildtmp || mkdir $buildtmp
test -d $sourcedir || mkdir $sourcedir
test -d $archivedir || mkdir $archivedir

#
# internal
#
AC_SUBST_FILE(ARCHIVE)
ARCHIVE=Makefile-archive
AC_CONFIG_COMMANDS_PRE([
AC_MSG_NOTICE([creating Makefile-archive])
${srcdir}/rules-archive.pl ${srcdir}/rules-archive > Makefile-archive
])

#
# summary
#
AC_MSG_RESULT([
$ccacheinfo
summary:
----------------------------------------
Ccache support              : $enable_ccache
Target CPU/boxtype          : $CPU_MODEL / $BOXTYPE
Kernelversion               : $KERNELVERSION
Patchlevel                  : P0$KERNELLABEL
DEBUG                       : $enable_debug
Boot prefix                 : $bootprefix
Serversupport               : $serversupport
Host prefix                 : $hostprefix
Cross prefix                : $crossprefix
Target prefix               : $targetprefix
Build prefix                : $buildprefix
Target apps directory       : $appsdir
Driver directory            : $driverdir
Source directory            : $sourcedir
Buildtmp directory          : $buildtmp
Customization directory     : $customizationsdir
Archive directory           : $archivedir
Player191                   : $enable_player191
Multicom324                 : $enable_multicom324
Multicom406                 : $enable_multicom406
MediaFw Gstreamer           : $enable_mediafwgstreamer
MediaFw                     : $MEDIAFW
MediaFw dependancy          : $MEDIAFW_DEP
External LCD                : $enable_externallcd
External LCD dependancy     : $EXTERNALLCD_DEP
----------------------------------------
])

if test "$dircheck" = "fail"; then
AC_MSG_RESULT([
******************************************************************
*                       !!!WARNING!!!                            *
* one or more of your CVS source directories could not be found, *
* (for details see above), did you maybe supply an incorrect     *
*  --with-cvsdir argument to configure?                          *
*                       !!!WARNING!!!                            *
******************************************************************
])
fi

## just error out now instead of mysteriously failing later.
if test -n "$CONFIG_SITE"; then
AC_MSG_ERROR([
***************************************************************
*                        !!!ERROR!!!                          *
* The environment variable CONFIG_SITE is set on your system. *
* This will likely break your build. Please rerun with unset  *
* CONFIG_SITE.                                                *
*                        !!!ERROR!!!                          *
***************************************************************
])
fi

TUXBOX_CUSTOMIZE='[[ -x $(customizationsdir)/$(notdir $@)-local.sh ] && KERNELVERSION=$(KERNELVERSION) && BOXTYPE=$(BOXTYPE) && $(customizationsdir)/$(notdir $@)-local.sh $(buildprefix) || true]'
AC_SUBST(TUXBOX_CUSTOMIZE)
TUXBOX_YAUD_CUSTOMIZE='[[ -x $(customizationsdir)/$(notdir $@)-local.sh ] && KERNELVERSION=$(KERNELVERSION) && BOXTYPE=$(BOXTYPE) && $(customizationsdir)/$(notdir $@)-local.sh $(prefix) $(prefix)/$*cdkroot $(buildprefix) $(sourcedir) $(flashscriptdir) $(BOXTYPE) || true]'
AC_SUBST(TUXBOX_YAUD_CUSTOMIZE)
TUXBOX_TOUCH='[@[ "x$*" = "x" ] && touch $@ || true]'
AC_SUBST(TUXBOX_TOUCH)

AC_CONFIG_FILES([
Makefile
rules-downcheck.pl
])

AC_CONFIG_COMMANDS([rules-downcheck-chmod],[chmod +x rules-downcheck.pl])

AC_OUTPUT
