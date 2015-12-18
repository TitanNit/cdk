#
# grep
#
$(D)/grep: $(D)/bootstrap @DEPENDS_grep@
	@PREPARE_grep@
	cd @DIR_grep@ && \
		gunzip -cd $(lastword $^) | cat > debian.patch && \
		patch -p1 <debian.patch && \
		$(CONFIGURE) \
			--disable-nls \
			--disable-perl-regexp \
			--libdir=$(targetprefix)/usr/lib \
			--prefix=/usr \
		&& \
		$(MAKE) && \
		@INSTALL_grep@
	@CLEANUP_grep@
	touch $@

#
# CONSOLE_DATA
#
$(D)/console_data: $(D)/bootstrap @DEPENDS_console_data@
	@PREPARE_console_data@
	cd @DIR_console_data@ && \
		$(CONFIGURE) \
			--prefix=$(targetprefix) \
			--with-main_compressor=gzip \
		&& \
		$(MAKE) && \
		@INSTALL_console_data@
	@CLEANUP_console_data@
	touch $@

#
# sysvinit
#
$(D)/sysvinit: $(D)/bootstrap @DEPENDS_sysvinit@
	@PREPARE_sysvinit@
	cd @DIR_sysvinit@ && \
		$(BUILDENV) \
		$(MAKE) -C src SULOGINLIBS=-lcrypt \
		&& \
		@INSTALL_sysvinit@
	@CLEANUP_sysvinit@
	touch $@

#
# module_init_tools
#
$(D)/module_init_tools: $(D)/bootstrap $(D)/lsb @DEPENDS_module_init_tools@
	@PREPARE_module_init_tools@
	cd @DIR_module_init_tools@ && \
		autoreconf -fi && \
		$(CONFIGURE) \
			--prefix= \
			--disable-builddir \
		&& \
		$(MAKE) && \
		@INSTALL_module_init_tools@
	$(call adapted-etc-files,$(MODULE_INIT_TOOLS_ADAPTED_ETC_FILES))
	@CLEANUP_module_init_tools@
	touch $@

#
# lsb
#
$(D)/lsb: $(D)/bootstrap @DEPENDS_lsb@
	@PREPARE_lsb@
	cd @DIR_lsb@ && \
		@INSTALL_lsb@
	@CLEANUP_lsb@
	touch $@

#
# portmap
#
$(D)/portmap: $(D)/bootstrap @DEPENDS_portmap@
	@PREPARE_portmap@
	cd @DIR_portmap@ && \
		gunzip -cd $(lastword $^) | cat > debian.patch && \
		patch -p1 <debian.patch && \
		sed -e 's/### BEGIN INIT INFO/# chkconfig: S 41 10\n### BEGIN INIT INFO/g' -i debian/init.d && \
		$(BUILDENV) \
		$(MAKE) && \
		@INSTALL_portmap@
	$(call adapted-etc-files,$(PORTMAP_ADAPTED_ETC_FILES))
	@CLEANUP_portmap@
	touch $@

#
# openrdate
#
$(D)/openrdate: $(D)/bootstrap @DEPENDS_openrdate@ $(OPENRDATE_ADAPTED_ETC_FILES:%=root/etc/%)
	@PREPARE_openrdate@
	cd @DIR_openrdate@ && \
		$(CONFIGURE) \
			--build=$(build) \
			--host=$(target) \
			--target=$(target) \
			--prefix=/usr \
		&& \
		$(MAKE) && \
		@INSTALL_openrdate@
	@CLEANUP_openrdate@
	touch $@

#
# e2fsprogs
#
$(D)/e2fsprogs: $(D)/bootstrap $(D)/utillinux @DEPENDS_e2fsprogs@
	@PREPARE_e2fsprogs@
	cd @DIR_e2fsprogs@ && \
		PATH=$(buildprefix)/@DIR_e2fsprogs@:$(PATH) \
		$(CONFIGURE) \
			--prefix=/usr \
			--libdir=/usr/lib \
			--disable-rpath \
			--disable-quota \
			--disable-testio-debug \
			--disable-defrag \
			--disable-nls \
			--disable-jbd-debug \
			--disable-blkid-debug \
			--disable-testio-debug \
			--enable-elf-shlibs \
			--enable-fsck \
			--enable-verbose-makecmds \
			--enable-symlink-install \
			--without-libintl-prefix \
			--without-libiconv-prefix \
			--with-root-prefix="" \
		&& \
		$(MAKE) && \
		$(MAKE) -C lib/uuid  install DESTDIR=$(targetprefix); \
		$(MAKE) -C lib/blkid install DESTDIR=$(targetprefix); \
		@INSTALL_e2fsprogs@
	@CLEANUP_e2fsprogs@
	touch $@

#
# utillinux
#
$(D)/utillinux: $(D)/bootstrap $(D)/zlib @DEPENDS_utillinux@
	@PREPARE_utillinux@
	cd @DIR_utillinux@ && \
		autoreconf -fi && \
		$(CONFIGURE) \
			--prefix=/usr \
			--disable-static \
			--disable-gtk-doc \
			--disable-nls \
			--disable-rpath \
			--disable-libuuid \
			--disable-libblkid \
			--disable-libmount \
			--disable-libsmartcols \
			--disable-mount \
			--disable-partx \
			--disable-mountpoint \
			--disable-fallocate \
			--disable-unshare \
			--disable-nsenter \
			--disable-setpriv \
			--disable-eject \
			--disable-agetty \
			--disable-cramfs \
			--disable-bfs \
			--disable-minix \
			--disable-fdformat \
			--disable-hwclock \
			--disable-wdctl \
			--disable-switch-root \
			--disable-pivot-root \
			--enable-tunelp \
			--disable-kill \
			--disable-last \
			--disable-utmpdump \
			--disable-line \
			--disable-mesg \
			--disable-raw \
			--disable-rename \
			--disable-reset \
			--disable-vipw \
			--disable-newgrp \
			--disable-chfn-chsh \
			--disable-login \
			--disable-login-chown-vcs \
			--disable-login-stat-mail \
			--disable-nologin \
			--disable-sulogin \
			--disable-su \
			--disable-runuser \
			--disable-ul \
			--disable-more \
			--disable-pg \
			--disable-setterm \
			--disable-schedutils \
			--disable-tunelp \
			--disable-wall \
			--disable-write \
			--disable-bash-completion \
			--disable-pylibmount \
			--disable-pg-bell \
			--disable-use-tty-group \
			--disable-makeinstall-chown \
			--disable-makeinstall-setuid \
			--without-audit \
			--without-ncurses \
			--without-slang \
			--without-utempter \
			--disable-wall \
			--without-python \
			--disable-makeinstall-chown \
			--without-systemdsystemunitdir \
		&& \
		$(MAKE) ARCH=sh4 && \
		@INSTALL_utillinux@
	@CLEANUP_utillinux@
	touch $@

#
# xfsprogs
#
$(D)/xfsprogs: $(D)/bootstrap $(D)/e2fsprogs $(D)/libreadline @DEPENDS_xfsprogs@
	@PREPARE_xfsprogs@
	cd @DIR_xfsprogs@ && \
		export DEBUG=-DNDEBUG && export OPTIMIZER=-O2 && \
		$(CONFIGURE) \
			--target=$(target) \
			--prefix= \
			--enable-shared=yes \
			--enable-gettext=yes \
			--enable-readline=yes \
			--enable-editline=no \
			--enable-termcap=yes \
		&& \
		$(MAKE) $(MAKE_OPTS) && \
		export top_builddir=`pwd` && \
		@INSTALL_xfsprogs@
	@CLEANUP_xfsprogs@
	touch $@

#
# mc
#
$(D)/mc: $(D)/bootstrap $(D)/glib2 @DEPENDS_mc@
	@PREPARE_mc@
	cd @DIR_mc@ && \
		$(CONFIGURE) \
			--prefix=/usr \
			--without-gpm-mouse \
			--with-screen=ncurses \
			--without-x \
		&& \
		$(MAKE) all && \
		@INSTALL_mc@
	@CLEANUP_mc@
	touch $@

#
# sdparm
#
$(D)/sdparm: $(D)/bootstrap @DEPENDS_sdparm@
	@PREPARE_sdparm@
	cd @DIR_sdparm@ && \
		$(CONFIGURE) \
			--prefix= \
			--exec-prefix=/usr \
			--mandir=/usr/share/man \
		&& \
		$(MAKE) $(MAKE_OPTS) && \
		@INSTALL_sdparm@
	@( cd $(prefix)/$*cdkroot/usr/share/man/man8 && gzip -v9 sdparm.8 )
	@CLEANUP_sdparm@
	touch $@

#
# ipkg
#
$(D)/ipkg: $(D)/bootstrap @DEPENDS_ipkg@
	@PREPARE_ipkg@
	cd @DIR_ipkg@ && \
		$(CONFIGURE) \
			--prefix=/usr \
		&& \
		$(MAKE) && \
		@INSTALL_ipkg@
	ln -sf ipkg-cl $(prefix)/$*cdkroot/usr/bin/ipkg && \
	$(INSTALL) -d $(prefix)/$*cdkroot/etc && $(INSTALL) -m 644 root/etc/ipkg.conf $(prefix)/$*cdkroot/etc && \
	$(INSTALL) -d $(prefix)/$*cdkroot/etc/ipkg
	$(INSTALL) -d $(prefix)/$*cdkroot/usr/lib/ipkg
	$(INSTALL) -m 644 root/usr/lib/ipkg/status.initial $(prefix)/$*cdkroot/usr/lib/ipkg/status
	@CLEANUP_ipkg@
	touch $@

#
# zd1211
#
CONFIG_ZD1211B :=
$(D)/zd1211: $(D)/bootstrap @DEPENDS_zd1211@
	@PREPARE_zd1211@
	cd @DIR_zd1211@ && \
		$(MAKE) KERNEL_LOCATION=$(buildprefix)/$(KERNEL_DIR) \
			ZD1211B=$(ZD1211B) \
			CROSS_COMPILE=$(target)- ARCH=sh \
			BIN_DEST=$(targetprefix)/bin \
			INSTALL_MOD_PATH=$(targetprefix) \
			install \
		&& \
	$(DEPMOD) -ae -b $(targetprefix) -r $(KERNELVERSION)
	@CLEANUP_zd1211@
	touch $@

#
# nano
#
$(D)/nano: $(D)/bootstrap @DEPENDS_nano@
	@PREPARE_nano@
	cd @DIR_nano@ && \
		$(CONFIGURE) \
			--prefix=/usr \
			--disable-nls \
			--enable-tiny \
			--enable-color \
		&& \
		$(MAKE) && \
		@INSTALL_nano@
	@CLEANUP_nano@
	touch $@

#
# rsync
#
$(D)/rsync: $(D)/bootstrap @DEPENDS_rsync@
	@PREPARE_rsync@
	cd @DIR_rsync@ && \
		$(CONFIGURE) \
			--prefix=/usr \
			--disable-debug \
			--disable-locale \
		&& \
		$(MAKE) && \
		@INSTALL_rsync@
	@CLEANUP_rsync@
	touch $@

#
# rfkill
#
$(D)/rfkill: $(D)/bootstrap @DEPENDS_rfkill@
	@PREPARE_rfkill@
	cd @DIR_rfkill@ && \
		$(MAKE) $(MAKE_OPTS) \
		&& \
		@INSTALL_rfkill@
	@CLEANUP_rfkill@
	touch $@

#
# lm_sensors
#
$(D)/lm_sensors: $(D)/bootstrap @DEPENDS_lm_sensors@
	@PREPARE_lm_sensors@
	cd @DIR_lm_sensors@ && \
		$(MAKE) $(MAKE_OPTS) MACHINE=sh PREFIX=/usr user && \
		@INSTALL_lm_sensors@ && \
		rm $(prefix)/$*cdkroot/usr/bin/*.pl && \
		rm $(prefix)/$*cdkroot/usr/sbin/*.pl && \
		rm $(prefix)/$*cdkroot/usr/sbin/sensors-detect && \
		rm $(prefix)/$*cdkroot/usr/share/man/man8/sensors-detect.8 && \
		rm $(prefix)/$*cdkroot/usr/include/linux/i2c-dev.h && \
		rm $(prefix)/$*cdkroot/usr/bin/ddcmon
	@CLEANUP_lm_sensors@
	touch $@

#
# fuse
#
$(D)/fuse: $(D)/bootstrap @DEPENDS_fuse@
	@PREPARE_fuse@
	cd @DIR_fuse@ && \
		$(CONFIGURE) \
			CFLAGS="$(TARGET_CFLAGS) -I$(buildprefix)/$(KERNEL_DIR)/arch/sh" \
			--target=$(target) \
			--prefix=/usr \
		&& \
		$(MAKE) all && \
		@INSTALL_fuse@
		-rm $(prefix)/$*cdkroot/etc/udev/rules.d/99-fuse.rules
		-rmdir $(prefix)/$*cdkroot/etc/udev/rules.d
		-rmdir $(prefix)/$*cdkroot/etc/udev
		$(LN_SF) sh4-linux-fusermount $(prefix)/$*cdkroot/usr/bin/fusermount
		$(LN_SF) sh4-linux-ulockmgr_server $(prefix)/$*cdkroot/usr/bin/ulockmgr_server
	@CLEANUP_fuse@
	touch $@

#
# curlftpfs
#
$(D)/curlftpfs: $(D)/bootstrap $(D)/glib2 $(D)/fuse @DEPENDS_curlftpfs@
	@PREPARE_curlftpfs@
	cd @DIR_curlftpfs@ && \
		export ac_cv_func_malloc_0_nonnull=yes && \
		export ac_cv_func_realloc_0_nonnull=yes && \
		$(CONFIGURE) \
			--prefix=/usr \
		&& \
		$(MAKE) && \
		@INSTALL_curlftpfs@
	@CLEANUP_curlftpfs@
	touch $@

#
# pngquant
#
$(D)/pngquant: $(D)/bootstrap $(D)/zlib $(D)/libpng @DEPENDS_pngquant@
	@PREPARE_pngquant@
	cd @DIR_pngquant@ && \
		$(target)-gcc -O3 -Wall -I. -funroll-loops -fomit-frame-pointer -o pngquant pngquant.c rwpng.c -lpng -lz -lm \
		&& \
		@INSTALL_pngquant@
	@CLEANUP_pngquant@
	touch $@

#
# mplayer
#
$(D)/mplayer: $(D)/bootstrap @DEPENDS_mplayer@
	@PREPARE_mplayer@
	cd @DIR_mplayer@ && \
		$(CONFIGURE) \
			--cc=$(target)-gcc \
			--target=$(target) \
			--host-cc=gcc \
			--prefix=/usr \
			--disable-mencoder \
		&& \
		$(MAKE) CC="$(target)-gcc" && \
		@INSTALL_mplayer@
	@CLEANUP_mplayer@
	touch $@

#
# mencoder
#
$(D)/mencoder: $(D)/bootstrap @DEPENDS_mencoder@
	@PREPARE_mencoder@
	cd @DIR_mencoder@ && \
		$(CONFIGURE) \
			--cc=$(target)-gcc \
			--target=$(target) \
			--host-cc=gcc \
			--prefix=/usr \
			--disable-dvdnav \
			--disable-dvdread \
			--disable-dvdread-internal \
			--disable-libdvdcss-internal \
			--disable-libvorbis \
			--disable-mp3lib \
			--disable-liba52 \
			--disable-mad \
			--disable-vcd \
			--disable-ftp \
			--disable-pvr \
			--disable-tv-v4l2 \
			--disable-tv-v4l1 \
			--disable-tv \
			--disable-network \
			--disable-real \
			--disable-xanim \
			--disable-faad-internal \
			--disable-tremor-internal \
			--disable-pnm \
			--disable-ossaudio \
			--disable-tga \
			--disable-v4l2 \
			--disable-fbdev \
			--disable-dvb \
			--disable-mplayer \
		&& \
		$(MAKE) CC="$(target)-gcc" && \
		@INSTALL_mencoder@
	@CLEANUP_mencoder@
	touch $@

#
# jfsutils
#
$(D)/jfsutils: $(D)/bootstrap $(D)/e2fsprogs @DEPENDS_jfsutils@
	@PREPARE_jfsutils@
	cd @DIR_jfsutils@ && \
		sed "s@<unistd.h>@&\n#include <sys/types.h>@g" -i fscklog/extract.c && \
		$(CONFIGURE) \
			--prefix= \
			--target=$(target) \
		&& \
		$(MAKE) && \
		@INSTALL_jfsutils@
	@CLEANUP_jfsutils@
	touch $@

#
# dosfstools
#
$(D)/dosfstools: $(D)/bootstrap @DEPENDS_dosfstools@
	@PREPARE_dosfstools@
	cd @DIR_dosfstools@ && \
		$(MAKE) all \
			CC=$(target)-gcc \
			OPTFLAGS="$(TARGET_CFLAGS) -fomit-frame-pointer -D_FILE_OFFSET_BITS=64" \
		&& \
		@INSTALL_dosfstools@
	@CLEANUP_dosfstools@
	touch $@

#
# hddtemp
#
$(D)/hddtemp: $(D)/bootstrap @DEPENDS_hddtemp@
	@PREPARE_hddtemp@
	cd @DIR_hddtemp@ && \
		$(CONFIGURE) \
			--prefix= \
			--with-db_path=/var/hddtemp.db \
		&& \
		$(MAKE) all && \
		$(MAKE) install DESTDIR=$(targetprefix)
		$(INSTALL) -d $(targetprefix)/var/tuxbox/config
		$(INSTALL) -m 644 root/release/hddtemp.db $(targetprefix)/var
	@CLEANUP_hddtemp@
	touch $@

#
# hdparm
#
$(D)/hdparm: $(D)/bootstrap @DEPENDS_hdparm@
	@PREPARE_hdparm@
	cd @DIR_hdparm@ && \
		$(BUILDENV) \
		$(MAKE) CROSS=$(target)- all \
		&& \
		@INSTALL_hdparm@
	@CLEANUP_hdparm@
	touch $@

#
# fdisk
#
$(D)/fdisk: $(D)/bootstrap $(D)/parted @DEPENDS_fdisk@
	@PREPARE_fdisk@
	cd @DIR_fdisk@ && \
		$(CONFIGURE) \
			--host=$(target) \
			--prefix=/usr \
		&& \
		$(MAKE) all && \
		@INSTALL_fdisk@
	@CLEANUP_fdisk@
	touch $@

#
# parted
#
$(D)/parted: $(D)/bootstrap $(D)/libreadline $(D)/e2fsprogs @DEPENDS_parted@
	@PREPARE_parted@
	cd @DIR_parted@ && \
		$(CONFIGURE) \
			--target=$(target) \
			--prefix=$(targetprefix)/usr \
			--disable-device-mapper \
			--disable-nls \
		&& \
		$(MAKE) all && \
		@INSTALL_parted@
	@CLEANUP_parted@
	touch $@

#
# opkg
#
$(D)/opkg: $(D)/bootstrap @DEPENDS_opkg@
	@PREPARE_opkg@
	cd @DIR_opkg@ && \
		$(CONFIGURE) \
			--build=$(build) \
			--host=$(target) \
			--prefix=/usr \
			--disable-curl \
			--disable-gpg \
			--with-opkglibdir=/var \
		&& \
		$(MAKE) all && \
		@INSTALL_opkg@
	@CLEANUP_opkg@
	touch $@

#
# sysstat
#
$(D)/sysstat: $(D)/bootstrap @DEPENDS_sysstat@
	@PREPARE_sysstat@
	cd @DIR_sysstat@ && \
		$(CONFIGURE) \
			--prefix=/usr \
			--disable-documentation \
		&& \
		$(MAKE) && \
		@INSTALL_sysstat@
	@CLEANUP_sysstat@
	touch $@

#
# autofs
#
$(D)/autofs: $(D)/bootstrap $(D)/e2fsprogs @DEPENDS_autofs@
	@PREPARE_autofs@
	cd @DIR_autofs@ && \
		cp aclocal.m4 acinclude.m4 && \
		autoconf && \
		$(CONFIGURE) \
			--prefix=/usr \
		&& \
		$(MAKE) all CC=$(target)-gcc STRIP=$(target)-strip SUBDIRS="lib daemon modules" && \
		@INSTALL_autofs@
	@CLEANUP_autofs@
	touch $@

#
# imagemagick
#
$(D)/imagemagick: $(D)/bootstrap @DEPENDS_imagemagick@
	@PREPARE_imagemagick@
	cd @DIR_imagemagick@ && \
		$(BUILDENV) \
		CFLAGS="-O1" \
		PKG_CONFIG=$(hostprefix)/bin/$(target)-pkg-config \
		./configure \
			--build=$(build) \
			--host=$(target) \
			--prefix=/usr \
			--without-dps \
			--without-fpx \
			--without-gslib \
			--without-jbig \
			--without-jp2 \
			--without-lcms \
			--without-tiff \
			--without-xml \
			--without-perl \
			--disable-openmp \
			--disable-opencl \
			--without-zlib \
			--enable-shared \
			--enable-static \
			--without-x \
		&& \
		$(MAKE) all && \
		@INSTALL_imagemagick@
	@CLEANUP_imagemagick@
	touch $@

#
# hotplug_e2
#
$(D)/hotplug_e2: $(D)/bootstrap @DEPENDS_hotplug_e2@
	@PREPARE_hotplug_e2@
	[ -d "$(archivedir)/hotplug-e2-helper.git" ] && \
	(cd $(archivedir)/hotplug-e2-helper.git; git pull; cd "$(buildprefix)";); \
	cd @DIR_hotplug_e2@ && \
		$(CONFIGURE) \
			--prefix=/usr \
		&& \
		$(MAKE) all && \
		@INSTALL_hotplug_e2@
	@CLEANUP_hotplug_e2@
	touch $@

#
# shairport
#
$(D)/shairport: $(D)/bootstrap $(D)/openssl $(D)/howl $(D)/libalsa @DEPENDS_shairport@
	@PREPARE_shairport@
	[ -d "$(archivedir)/shairport.git" ] && \
	(cd $(archivedir)/shairport.git; git pull; cd "$(buildprefix)";); \
	cd @DIR_shairport@ && \
		sed -i 's|pkg-config|$$PKG_CONFIG|g' configure && \
		PKG_CONFIG=$(hostprefix)/bin/$(target)-pkg-config \
		$(BUILDENV) \
		$(MAKE) && \
		@INSTALL_shairport@
	@CLEANUP_shairport@
	touch $@

#
# dbus
#
$(D)/dbus: $(D)/bootstrap $(D)/libexpat @DEPENDS_dbus@
	@PREPARE_dbus@
	cd @DIR_dbus@ && \
		libtoolize --copy --ltdl && \
		autoreconf -fi && \
		$(CONFIGURE) \
		CFLAGS="$(TARGET_CFLAGS) -Wno-cast-align" \
		./autogen.sh \
			--without-x \
			--prefix=/usr \
			--sysconfdir=/etc \
			--localstatedir=/var \
			--with-console-auth-dir=/run/console/ \
			--without-systemdsystemunitdir \
			--enable-abstract-sockets \
			--disable-systemd \
			--disable-static \
		&& \
		$(MAKE) all && \
		@INSTALL_dbus@
	@CLEANUP_dbus@
	touch $@

#
# avahi
#
$(D)/avahi: $(D)/bootstrap $(D)/libexpat $(D)/libdaemon $(D)/dbus @DEPENDS_avahi@
	@PREPARE_avahi@
	cd @DIR_avahi@ && \
		sed -i 's/\(CFLAGS=.*\)-Werror \(.*\)/\1\2/' configure && \
		sed -i -e 's/-DG_DISABLE_DEPRECATED=1//' -e '/-DGDK_DISABLE_DEPRECATED/d' avahi-ui/Makefile.in && \
		$(CONFIGURE) \
			--prefix=/usr \
			--sysconfdir=/etc \
			--localstatedir=/var \
			--disable-static \
			--disable-mono \
			--disable-monodoc \
			--disable-python \
			--disable-gdbm \
			--disable-gtk \
			--disable-gtk3 \
			--disable-qt3 \
			--disable-qt4 \
			--disable-nls \
			--enable-core-docs \
			--with-distro=none \
		&& \
		$(MAKE) all && \
		@INSTALL_avahi@
	@CLEANUP_avahi@
	touch $@

#
# mtd_utils
#
$(D)/mtd_utils: $(D)/bootstrap $(D)/zlib $(D)/lzo $(D)/e2fsprogs @DEPENDS_mtd_utils@
	@PREPARE_mtd_utils@
	cd @DIR_mtd_utils@ && \
		$(BUILDENV) $(MAKE) PREFIX= CC=${target}-gcc LD=${target}-ld STRIP=${target}-strip `pwd`/mkfs.jffs2 `pwd`/sumtool BUILDDIR=`pwd` WITHOUT_XATTR=1 DESTDIR=$(targetprefix) install && \
		cp -a $(targetprefix)/sbin/{mkfs.jffs2,sumtool,nandwrite} $(hostprefix)/bin && \
		@INSTALL_mtd_utils@
	@CLEANUP_mtd_utils@
	touch $@

#
# wget
#
$(D)/wget: $(D)/bootstrap $(D)/openssl @DEPENDS_wget@
	@PREPARE_wget@
	cd @DIR_wget@ && \
		$(CONFIGURE) \
			--prefix=/usr \
			--with-openssl \
			--with-ssl=openssl \
			--with-libssl-prefix=$(targetprefix) \
			--disable-ipv6 \
			--disable-debug \
			--disable-nls \
		&& \
		$(MAKE) && \
		@INSTALL_wget@
	@CLEANUP_wget@
	touch $@
