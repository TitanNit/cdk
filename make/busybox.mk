#
# busybox
#
$(D)/busybox: $(D)/bootstrap @DEPENDS_busybox@ $(buildprefix)/Patches/busybox.config$(if $(UFS912)$(UFS913)$(SPARK)$(SPARK7162),_nandwrite)
	@PREPARE_busybox@
	cd @DIR_busybox@ && \
		patch -p1 < $(PATCHES)/busybox-1.24.1-ifupdown.patch && \
		patch -p1 < $(PATCHES)/busybox-1.24.1-unicode.patch && \
		patch -p1 < $(PATCHES)/busybox-1.24.1-extra.patch && \
		patch -p1 < $(PATCHES)/busybox-1.24.1-mount_single_uuid.patch && \
		$(INSTALL) -m644 $(lastword $^) .config && \
		sed -i -e 's#^CONFIG_PREFIX.*#CONFIG_PREFIX="$(targetprefix)"#' .config
	cd @DIR_busybox@ && \
		export CROSS_COMPILE=$(target)- && \
		$(MAKE) all \
			CROSS_COMPILE=$(target)- \
			CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
		&& \
		@INSTALL_busybox@
#	@CLEANUP_busybox@
	touch $@
