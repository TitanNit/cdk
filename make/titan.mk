#
# titan
#

yaud-titan: yaud-none lirc \
	 titan release_titan
	@TUXBOX_YAUD_CUSTOMIZE@

#curlftpfs
TITAN_DEPS  = bootstrap libcurl rarfs djmount libfreetype libjpeg libpng ffmpeg titan-libdreamdvd $(MEDIAFW_DEP) tuxtxt32bpp tools-libmme_host tools-libmme_image

# $(D)/titan.do_prepare: | bootstrap libmme_host libmme_image $(EXTERNALLCD_DEP) libdvbsipp libfreetype libjpeg libpng libungif libid3tag libcurl libmad libvorbisidec openssl ffmpeg libopenthreads libusb2 libalsa tuxtxt32bpp titan-libdreamdvd $(MEDIAFW_DEP)

$(D)/titan.do_prepare: | $(TITAN_DEPS)
	[ -d "$(APPS_DIR)/titan" ] && \
	(cd $(APPS_DIR)/titan; svn up; cd "$(BUILD_TMP)";); \
	[ -d "$(APPS_DIR)/titan" ] || \
	svn checkout --username public --password public http://sbnc.dyndns.tv/svn/titan $(APPS_DIR)/titan; \
	COMPRESSBIN=gzip; \
	COMPRESSEXT=gz; \
	$(if $(UFS910), COMPRESSBIN=lzma;) \
	$(if $(UFS910), COMPRESSEXT=lzma;) \
	[ -d "$(BUILD_TMP)/BUILD" ] && \
	(echo "[titan.mk] Kernel COMPRESSBIN=$$COMPRESSBIN"; echo "[titan.mk] Kernel COMPRESSEXT=$$COMPRESSEXT"; cd "$(BUILD_TMP)/BUILD"; rm -f $(BUILD_TMP)/BUILD/uimage.*; dd if=$(TARGETPREFIX)/boot/uImage of=uimage.tmp.$$COMPRESSEXT bs=1 skip=64; $$COMPRESSBIN -d uimage.tmp.$$COMPRESSEXT; str="`strings $(BUILD_TMP)/BUILD/uimage.tmp | grep "Linux version 2.6" | sed 's/Linux version //' | sed 's/(.*)//' | sed 's/  / /'`"; code=`"$(APPS_DIR)/titan/titan/tools/gettitancode" "$$str"`; code="$$code"UL; echo "[titan.mk] $$str -> $$code"; sed s/"^#define SYSCODE .*"/"#define SYSCODE $$code"/ -i "$(APPS_DIR)/titan/titan/titan.c"); \
	SVNVERSION=`svn info $(APPS_DIR)/titan | grep Revision | sed s/'Revision: '//g`; \
	SVNBOX=ufs910; \
	$(if $(UFS910), SVNBOX=ufs910;) \
	$(if $(UFS912), SVNBOX=ufs912;) \
	$(if $(UFS922), SVNBOX=ufs922;) \
	$(if $(OCTAGON1008), SVNBOX=atevio700;) \
	$(if $(FORTIS_HDBOX), SVNBOX=atevio7000;) \
	$(if $(ATEVIO7500), SVNBOX=atevio7500;) \
	$(if $(ATEMIO510), SVNBOX=atemio510;) \
	$(if $(ATEMIO520), SVNBOX=atemio520;) \
	$(if $(ATEMIO530), SVNBOX=atemio530;) \
	TPKDIR="/svn/tpk/"$$SVNBOX"-rev"$$SVNVERSION"-secret/sh4/titan"; \
	(echo "[titan.mk] tpk SVNVERSION=$$SVNVERSION";echo "[titan.mk] tpk TPKDIR=$$TPKDIR"; sed s!"/svn/tpk/.*"!"$$TPKDIR\", 1, 0);"! -i "$(APPS_DIR)/titan/titan/extensions.h"; sed s!"svn/tpk/.*"!"$$TPKDIR\") == 0)"! -i "$(APPS_DIR)/titan/titan/tpk.h"; sed s/"^#define PLUGINVERSION .*"/"#define PLUGINVERSION $$SVNVERSION"/ -i "$(APPS_DIR)/titan/titan/struct.h"); \
	[ -d "$(APPS_DIR)/titan/titan/libdreamdvd" ] || \
	ln -s $(APPS_DIR)/titan/libdreamdvd $(APPS_DIR)/titan/titan; \
	touch $@
	rm -f $(BUILD_TMP)/BUILD/uimage.*

$(APPS_DIR)/titan/titan/config.status:
	export PATH=$(hostprefix)/bin:$(PATH) && \
	cd $(APPS_DIR)/titan/titan && \
		libtoolize --force && \
		aclocal -I $(TARGETPREFIX)/usr/share/aclocal && \
		autoconf && \
		automake --foreign --add-missing && \
		$(BUILDENV) \
		./configure \
			--host=$(TARGET) \
			--build=$(BUILD) \
			--prefix=/usr/local \
			--with-target=cdk \
			PKG_CONFIG=$(hostprefix)/bin/$(TARGET)-pkg-config \
			PKG_CONFIG_PATH=$(TARGETPREFIX)/usr/lib/pkgconfig \
			$(PLATFORM_CPPFLAGS) \
			CPPFLAGS="$(N_CPPFLAGS)"
		$(MAKE)
	touch $@

$(D)/titan.do_compile: $(APPS_DIR)/titan/titan/config.status
	cd $(APPS_DIR)/titan/titan && \
		$(MAKE)
	touch $@

$(D)/titan: titan.do_prepare titan.do_compile
	$(MAKE) -C $(APPS_DIR)/titan/titan install DESTDIR=$(TARGETPREFIX)
	$(TARGET)-strip $(TARGETPREFIX)/usr/local/bin/titan
	touch $@
	
titan-clean:
	rm -f $(BUILD_TMP)/BUILD/uimage.*
	rm -f $(D)/titan
	rm -f $(D)/titan.do_prepare
	cd $(APPS_DIR)/titan/titan && \
		$(MAKE) clean

titan-distclean:
	rm -f $(D)/titan*
	rm -rf $(APPS_DIR)/titan	

titan-updateyaud: titan-clean titan
	mkdir -p $(prefix)/release/usr/local/bin
	cp $(TARGETPREFIX)/usr/local/bin/titan $(prefix)/release_titan/usr/local/bin/

#
# titan-libdreamdvd
#
$(D)/titan-libdreamdvd.do_prepare: | bootstrap libdvdnav
	[ -d "$(APPS_DIR)/titan" ] && \
	(cd $(APPS_DIR)/titan; svn up; cd "$(BUILD_TMP)";); \
	[ -d "$(APPS_DIR)/titan" ] || \
	svn checkout --username public --password public http://sbnc.dyndns.tv/svn/titan $(APPS_DIR)/titan; \
	[ -d "$(APPS_DIR)/titan/titan/libdreamdvd" ] || \
	ln -s $(APPS_DIR)/titan/libdreamdvd $(APPS_DIR)/titan/titan; \
	touch $@

$(APPS_DIR)/titan/libdreamdvd/config.status:
	export PATH=$(hostprefix)/bin:$(PATH) && \
	cd $(APPS_DIR)/titan/libdreamdvd && \
		libtoolize --force && \
		aclocal -I $(TARGETPREFIX)/usr/share/aclocal && \
		autoconf && \
		automake --foreign --add-missing && \
		$(BUILDENV) \
		./configure \
			--build=$(BUILD) \
			--host=$(TARGET) \
			--prefix=/usr && \
		$(MAKE) all
	touch $@

$(D)/titan-libdreamdvd.do_compile: $(APPS_DIR)/titan/libdreamdvd/config.status
	cd $(APPS_DIR)/titan/libdreamdvd && \
		$(MAKE)
	touch $@

$(D)/titan-libdreamdvd: titan-libdreamdvd.do_prepare titan-libdreamdvd.do_compile
	$(MAKE) -C $(APPS_DIR)/titan/libdreamdvd install DESTDIR=$(TARGETPREFIX)
	touch $@

titan-libdreamdvd-clean:
	rm -f $(D)/titan-libdreamdvd
	cd $(APPS_DIR)/titan/libdreamdvd && \
		$(MAKE) clean

titan-libdreamdvd-distclean:
	rm -f $(D)/titan-libdreamdvd*
	rm -rf $(APPS_DIR)/titan/libdreamdvd	

#
# titan-plugins
#

$(D)/titan-plugins.do_prepare: | libpng libjpeg libfreetype libcurl
	[ -d "$(APPS_DIR)/titan" ] && \
	(cd $(APPS_DIR)/titan; svn up; cd "$(BUILD_TMP)";); \
	[ -d "$(APPS_DIR)/titan" ] || \
	svn checkout --username public --password public http://sbnc.dyndns.tv/svn/titan $(APPS_DIR)/titan; \
	[ -d "$(APPS_DIR)/titan/titan/libdreamdvd" ] || \
	ln -s $(APPS_DIR)/titan/libdreamdvd $(APPS_DIR)/titan/titan;
	touch $@

$(APPS_DIR)/titan/plugins/config.status: titan-libdreamdvd
	export PATH=$(hostprefix)/bin:$(PATH) && \
	cd $(APPS_DIR)/titan/plugins && \
	libtoolize --force && \
	aclocal -I $(TARGETPREFIX)/usr/share/aclocal && \
	autoconf && \
	automake --foreign --add-missing && \
	$(CONFIGURE) --prefix= \
	$(if $(MULTICOM324), --enable-multicom324) \
	$(if $(EPLAYER3), --enable-eplayer3)
	touch $@

$(D)/titan-plugins.do_compile: $(APPS_DIR)/titan/plugins/config.status
	cd $(APPS_DIR)/titan/plugins && \
			$(MAKE) -C $(APPS_DIR)/titan/plugins all install DESTDIR=$(prefix)/$*cdkroot
	touch $@

$(D)/titan-plugins: titan-plugins.do_prepare titan-plugins.do_compile
	$(MAKE) -C $(APPS_DIR)/titan/plugins all install DESTDIR=$(TARGETPREFIX)
	touch $@

titan-plugins-clean:
	rm -f $(D)/titan-plugins
	rm -f $(D)/titan-plugins.do_prepare
	-$(MAKE) -C $(APPS_DIR)/titan/plugins clean
	
titan-plugins-distclean:
	rm -f $(D)/titan-plugins*
	rm -rf $(APPS_DIR)/titan/plugins	