#
# IMPORTANT: it is expected that only one define is set
#
MODNAME = $(UFS910)$(UFS912)$(UFS913)$(UFS922)$(UFC960)$(TF7700)$(HL101)$(VIP1_V2)$(VIP2_V1)$(CUBEREVO)$(CUBEREVO_MINI)$(CUBEREVO_MINI2)$(CUBEREVO_MINI_FTA)$(CUBEREVO_250HD)$(CUBEREVO_2000HD)$(CUBEREVO_9500HD)$(CUBEREVO_3000HD)$(FORTIS_HDBOX)$(ATEVIO7500)$(OCTAGON1008)$(HS7110)$(HS7810A)$(HS7119)$(HS7819)$(ATEMIO530)$(ATEMIO520)$(HOMECAST5101)$(IPBOX9900)$(IPBOX99)$(IPBOX55)$(ADB_BOX)$(SPARK)$(SPARK7162)$(VITAMIN_HD5000)$(SAGEMCOM88)$(ARIVALINK200)$(FORTIS_DP7000)
DEPMOD = $(hostprefix)/bin/depmod

#
# Patches Kernel 24
#
COMMONPATCHES_24 = \
		linux-kbuild-generate-modules-builtin_stm24$(PATCH_STR).patch \
		linux-sh4-linuxdvb_stm24$(PATCH_STR).patch \
		$(if $(P0209),linux-sh4-makefile_stm24.patch) \
		linux-sh4-sound_stm24$(PATCH_STR).patch \
		linux-sh4-time_stm24$(PATCH_STR).patch \
		linux-sh4-init_mm_stm24$(PATCH_STR).patch \
		linux-sh4-copro_stm24$(PATCH_STR).patch \
		linux-sh4-strcpy_stm24$(PATCH_STR).patch \
		linux-sh4-ext23_as_ext4_stm24$(PATCH_STR).patch \
		linux-sh4-bpa2_procfs_stm24$(PATCH_STR).patch \
		linux-ftdi_sio.c_stm24$(PATCH_STR).patch \
		linux-sh4-lzma-fix_stm24$(PATCH_STR).patch \
		linux-tune_stm24.patch \
		linux-sh4-permit_gcc_command_line_sections_stm24.patch \
		linux-sh4-mmap_stm24.patch \
		$(if $(P0217),linux-defined_is_deprecated_timeconst.pl_stm24$(PATCH_STR).patch) \
		$(if $(P0217),linux-perf-warning-fix_stm24$(PATCH_STR).patch) \
		$(if $(P0215)$(P0217),linux-ratelimit-bug_stm24$(PATCH_STR).patch) \
		$(if $(P0215)$(P0217),linux-patch_swap_notify_core_support_stm24$(PATCH_STR).patch) \
		$(if $(P0209),linux-sh4-dwmac_stm24_0209.patch) \
		$(if $(P0209),linux-sh4-directfb_stm24$(PATCH_STR).patch) \
		$(if $(P0211)$(P0214)$(P0215)$(P0217),linux-sh4-console_missing_argument_stm24$(PATCH_STR).patch)

#		$(if $(P0209)$(P0211),linux-sh4-remove_pcm_reader_stm24.patch)

TF7700_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-tf7700_setup_stm24$(PATCH_STR).patch \
		linux-usbwait123_stm24.patch \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		$(if $(P0209),linux-sh4-sata-v06_stm24$(PATCH_STR).patch)

UFS910_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-stx7100_fdma_fix_stm24$(PATCH_STR).patch \
		linux-sh4-sata_32bit_fix_stm24$(PATCH_STR).patch \
		linux-sh4-sata_stx7100_B4Team_fix_stm24$(PATCH_STR).patch \
		linux-sh4-ufs910_setup_stm24$(PATCH_STR).patch \
		linux-usbwait123_stm24.patch \
		linux-sh4-ufs910_reboot_stm24$(PATCH_STR).patch \
		linux-sh4-smsc911x_dma_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-pcm_noise_fix_stm24$(PATCH_STR).patch

UFS912_PATCHES_24 = $(COMMONPATCHES_24)

UFS913_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-ufs913_setup_stm24$(PATCH_STR).patch \
		linux-sh4-lmb_stm24$(PATCH_STR).patch

OCTAGON1008_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-octagon1008_setup_stm24$(PATCH_STR).patch \
		linux-usbwait123_stm24.patch \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch

ATEVIO7500_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-lmb_stm24$(PATCH_STR).patch \
		linux-sh4-atevio7500_setup_stm24$(PATCH_STR).patch \
		$(if $(ENIGMA2),linux-sh4-atevio7500_mtdconcat_stm24$(PATCH_STR).patch) \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch

HS7110_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-lmb_stm24$(PATCH_STR).patch \
		linux-sh4-hs7110_setup_stm24$(PATCH_STR).patch \
		$(if $(NEUTRINO),linux-sh4-hs7110_mtdconcat_stm24$(PATCH_STR).patch) \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		$(if $(P0209)$(P0211),linux-sh4-i2c-stm-downgrade_stm24$(PATCH_STR).patch)

HS7810A_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-lmb_stm24$(PATCH_STR).patch \
		linux-sh4-hs7810a_setup_stm24$(PATCH_STR).patch \
		$(if $(NEUTRINO),linux-sh4-hs7810a_mtdconcat_stm24$(PATCH_STR).patch) \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		$(if $(P0209)$(P0211),linux-sh4-i2c-stm-downgrade_stm24$(PATCH_STR).patch)

HS7119_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-lmb_stm24$(PATCH_STR).patch \
		linux-sh4-hs7119_setup_stm24$(PATCH_STR).patch \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		$(if $(P0209)$(P0211),linux-sh4-i2c-stm-downgrade_stm24$(PATCH_STR).patch)

HS7819_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-lmb_stm24$(PATCH_STR).patch \
		linux-sh4-hs7819_setup_stm24$(PATCH_STR).patch \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		$(if $(P0209)$(P0211),linux-sh4-i2c-stm-downgrade_stm24$(PATCH_STR).patch)

ATEMIO520_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		linux-sh4-lmb_stm24$(PATCH_STR).patch \
		linux-sh4-atemio520_setup_stm24$(PATCH_STR).patch \
		$(if $(P0209)$(P0211),linux-sh4-i2c-stm-downgrade_stm24$(PATCH_STR).patch) \
		linux-squashfs-downgrade-stm24$(PATCH_STR)-to-stm23.patch \
		linux-squashfs3.0_lzma_stm23.patch \
		linux-squashfs-downgrade-stm24-patch-2.6.25 \
		linux-squashfs-downgrade-stm24-rm_d_alloc_anon.patch

ATEMIO530_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		linux-sh4-lmb_stm24$(PATCH_STR).patch \
		linux-sh4-atemio530_setup_stm24$(PATCH_STR).patch \
		$(if $(P0209)$(P0211),linux-sh4-i2c-stm-downgrade_stm24$(PATCH_STR).patch) \
		linux-squashfs-downgrade-stm24$(PATCH_STR)-to-stm23.patch \
		linux-squashfs3.0_lzma_stm23.patch \
		linux-squashfs-downgrade-stm24-patch-2.6.25 \
		linux-squashfs-downgrade-stm24-rm_d_alloc_anon.patch

UFS922_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-ufs922_setup_stm24$(PATCH_STR).patch \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-fortis_hdbox_i2c_st40_stm24$(PATCH_STR).patch

UFC960_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-ufs922_setup_stm24$(PATCH_STR).patch \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-fortis_hdbox_i2c_st40_stm24$(PATCH_STR).patch

HL101_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-hl101_setup_stm24$(PATCH_STR).patch \
		linux-usbwait123_stm24.patch \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch

VIP2_PATCHES_24  = $(COMMONPATCHES_24) \
		linux-sh4-vip2_setup_stm24$(PATCH_STR).patch \
		linux-usbwait123_stm24.patch \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch

SPARK_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		linux-sh4-lmb_stm24$(PATCH_STR).patch \
		linux-sh4-spark_setup_stm24$(PATCH_STR).patch \
		$(if $(P0209),linux-sh4-linux_yaffs2_stm24_0209.patch) \
		$(if $(P0209),linux-sh4-lirc_stm.patch) \
		$(if $(P0211)$(P0214)$(P0215)$(P0217),linux-sh4-lirc_stm_stm24$(PATCH_STR).patch)

SPARK7162_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		linux-sh4-lmb_stm24$(PATCH_STR).patch \
		linux-sh4-spark7162_setup_stm24$(PATCH_STR).patch

FORTIS_HDBOX_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-fortis_hdbox_setup_stm24$(PATCH_STR).patch \
		linux-usbwait123_stm24.patch \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		$(if $(P0209),linux-sh4-fortis_hdbox_i2c_st40_stm24$(PATCH_STR).patch)

ADB_BOX_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-stx7100_fdma_fix_stm24$(PATCH_STR).patch \
		linux-sh4-sata_32bit_fix_stm24$(PATCH_STR).patch \
		linux-sh4-adb_box_setup_stm24$(PATCH_STR).patch \
		linux-usbwait123_stm24.patch \
		linux-sh4-ufs910_reboot_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-pcm_noise_fix_stm24$(PATCH_STR).patch

IPBOX9900_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-ipbox9900_setup_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-ipbox_bdinfo_stm24$(PATCH_STR).patch \
		linux-sh4-ipbox_dvb_ca_stm24$(PATCH_STR).patch

IPBOX99_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-ipbox99_setup_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-ipbox_bdinfo_stm24$(PATCH_STR).patch

IPBOX55_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-ipbox55_setup_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-ipbox_bdinfo_stm24$(PATCH_STR).patch

CUBEREVO_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-cuberevo_setup_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-cuberevo_rtl8201_stm24$(PATCH_STR).patch

CUBEREVO_MINI_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-cuberevo_mini_setup_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-cuberevo_rtl8201_stm24$(PATCH_STR).patch

CUBEREVO_MINI2_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-cuberevo_mini2_setup_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-cuberevo_rtl8201_stm24$(PATCH_STR).patch

CUBEREVO_MINI_FTA_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-cuberevo_setup_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-cuberevo_rtl8201_stm24$(PATCH_STR).patch

CUBEREVO_250HD_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-cuberevo_250hd_setup_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-cuberevo_rtl8201_stm24$(PATCH_STR).patch \
		$(if $(P0215)$(P0217),linux-sh4-cuberevo_250hd_sound_stm24$(PATCH_STR).patch)

CUBEREVO_2000HD_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-cuberevo_2000hd_setup_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-cuberevo_rtl8201_stm24$(PATCH_STR).patch

CUBEREVO_9500HD_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-cuberevo_9500hd_setup_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-cuberevo_rtl8201_stm24$(PATCH_STR).patch

CUBEREVO_3000HD_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-cuberevo_3000hd_setup_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-cuberevo_rtl8201_stm24$(PATCH_STR).patch

VITAMIN_HD5000_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-vitamin_hd5000_setup_stm24$(PATCH_STR).patch \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		linux-sh4-lmb_stm24$(PATCH_STR).patch

SAGEMCOM88_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-sagemcom88_setup_stm24$(PATCH_STR).patch \
		linux-sh4-stmmac_stm24$(PATCH_STR).patch \
		linux-sh4-lmb_stm24$(PATCH_STR).patch \
		linux-sh4-sagemcom88_sound_stm24$(PATCH_STR).patch

ARIVALINK200_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-arivalink200_setup_stm24$(PATCH_STR).patch \
		linux-sh4-i2c-st40-pio_stm24$(PATCH_STR).patch \
		linux-sh4-ipbox_bdinfo_stm24$(PATCH_STR).patch \
		linux-sh4-ipbox_dvb_ca_stm24$(PATCH_STR).patch

FORTIS_DP7000_PATCHES_24 = $(COMMONPATCHES_24) \
		linux-sh4-fortis_dp7000_setup_stm24$(PATCH_STR).patch

KERNELPATCHES_24 = \
		$(if $(UFS910),$(UFS910_PATCHES_24)) \
		$(if $(UFS912),$(UFS912_PATCHES_24)) \
		$(if $(UFS913),$(UFS913_PATCHES_24)) \
		$(if $(UFS922),$(UFS922_PATCHES_24)) \
		$(if $(UFC960),$(UFC960_PATCHES_24)) \
		$(if $(TF7700),$(TF7700_PATCHES_24)) \
		$(if $(HL101),$(HL101_PATCHES_24)) \
		$(if $(VIP1_V2),$(VIP2_PATCHES_24)) \
		$(if $(VIP2_V1),$(VIP2_PATCHES_24)) \
		$(if $(SPARK),$(SPARK_PATCHES_24)) \
		$(if $(SPARK7162),$(SPARK7162_PATCHES_24)) \
		$(if $(FORTIS_HDBOX),$(FORTIS_HDBOX_PATCHES_24)) \
		$(if $(HS7110),$(HS7110_PATCHES_24)) \
		$(if $(HS7810A),$(HS7810A_PATCHES_24)) \
		$(if $(HS7119),$(HS7119_PATCHES_24)) \
		$(if $(HS7819),$(HS7819_PATCHES_24)) \
		$(if $(ATEMIO520),$(ATEMIO520_PATCHES_24)) \
		$(if $(ATEMIO530),$(ATEMIO530_PATCHES_24)) \
		$(if $(ATEVIO7500),$(ATEVIO7500_PATCHES_24)) \
		$(if $(OCTAGON1008),$(OCTAGON1008_PATCHES_24)) \
		$(if $(ADB_BOX),$(ADB_BOX_PATCHES_24)) \
		$(if $(IPBOX9900),$(IPBOX9900_PATCHES_24)) \
		$(if $(IPBOX99),$(IPBOX99_PATCHES_24)) \
		$(if $(IPBOX55),$(IPBOX55_PATCHES_24)) \
		$(if $(CUBEREVO),$(CUBEREVO_PATCHES_24)) \
		$(if $(CUBEREVO_MINI),$(CUBEREVO_MINI_PATCHES_24)) \
		$(if $(CUBEREVO_MINI2),$(CUBEREVO_MINI2_PATCHES_24)) \
		$(if $(CUBEREVO_MINI_FTA),$(CUBEREVO_MINI_FTA_PATCHES_24)) \
		$(if $(CUBEREVO_250HD),$(CUBEREVO_250HD_PATCHES_24)) \
		$(if $(CUBEREVO_2000HD),$(CUBEREVO_2000HD_PATCHES_24)) \
		$(if $(CUBEREVO_9500HD),$(CUBEREVO_9500HD_PATCHES_24)) \
		$(if $(CUBEREVO_3000HD),$(CUBEREVO_3000HD_PATCHES_24)) \
		$(if $(VITAMIN_HD5000),$(VITAMIN_HD5000_PATCHES_24)) \
		$(if $(SAGEMCOM88),$(SAGEMCOM88_PATCHES_24)) \
		$(if $(ARIVALINK200),$(ARIVALINK200_PATCHES_24)) \
		$(if $(FORTIS_DP7000),$(FORTIS_DP7000_PATCHES_24))

if ENABLE_ENIGMA2
BUILDCONFIG=build-enigma2
endif

if ENABLE_TITAN
BUILDCONFIG=build-titan
endif

if ENABLE_NEUTRINO
BUILDCONFIG=build-neutrino
endif

if DEBUG
DEBUG_STR=.debug
else !DEBUG
DEBUG_STR=
endif !DEBUG

#
# HOST-KERNEL
#
if ENABLE_P0209
HOST_KERNEL_REVISION = 8c676f1a85935a94de1fb103c0de1dd25ff69014
endif
if ENABLE_P0211
HOST_KERNEL_REVISION = 3bce06ff873fb5098c8cd21f1d0e8d62c00a4903
endif
if ENABLE_P0214
HOST_KERNEL_REVISION = 5cf7f6f209d832a4cf645125598f86213f556fb3
endif
if ENABLE_P0215
HOST_KERNEL_REVISION = 5384bd391266210e72b2ca34590bd9f543cdb5a3
endif
if ENABLE_P0217
HOST_KERNEL_REVISION = b43f8252e9f72e5b205c8d622db3ac97736351fc
endif
HOST_KERNEL_PATCHES = $(KERNELPATCHES_24)
HOST_KERNEL_CONFIG = linux-sh4-$(subst _stm24_,_,$(KERNELVERSION))_$(MODNAME).config$(DEBUG_STR)

##make -C $(KERNEL_DIR) headers_install ARCH=sh INSTALL_HDR_PATH=$(targetprefix)/usr
$(D)/linux-kernel: $(D)/bootstrap $(buildprefix)/Patches/$(BUILDCONFIG)/$(HOST_KERNEL_CONFIG) | $(HOST_U_BOOT_TOOLS) \
	$(if $(HOST_KERNEL_PATCHES),$(HOST_KERNEL_PATCHES:%=$(PATCHES)/$(BUILDCONFIG)/%))
	rm -rf linux-sh4*
	REPO=git://git.stlinux.com/stm/linux-sh4-2.6.32.y.git;protocol=git;branch=stmicro; \
	[ -d "$(archivedir)/linux-sh4-2.6.32.y.git" ] && \
	(echo "Updating STlinux kernel source"; cd $(archivedir)/linux-sh4-2.6.32.y.git; git pull;); \
	[ -d "$(archivedir)/linux-sh4-2.6.32.y.git" ] || \
	(echo "Getting STlinux kernel source"; git clone -n $$REPO $(archivedir)/linux-sh4-2.6.32.y.git); \
	(echo "Copying kernel source code to build environment"; cp -ra $(archivedir)/linux-sh4-2.6.32.y.git $(buildprefix)/$(KERNEL_DIR)); \
	(echo "Applying patch level P0$(KERNELLABEL)"; cd $(KERNEL_DIR); git checkout -q $(HOST_KERNEL_REVISION))
	set -e; cd $(KERNEL_DIR); \
		for i in $(HOST_KERNEL_PATCHES); do \
			echo -e "==> \033[31mApplying Patch:\033[0m $$i"; \
			patch -p1 -i $(buildprefix)/Patches/$(BUILDCONFIG)/$$i; \
		done
	$(INSTALL) -m644 $(PATCHES)/$(BUILDCONFIG)/$(HOST_KERNEL_CONFIG) $(buildprefix)/$(KERNEL_DIR)/.config
	-rm $(buildprefix)/$(KERNEL_DIR)/localversion*
	echo "$(KERNELSTMLABEL)" > $(buildprefix)/$(KERNEL_DIR)/localversion-stm
	$(MAKE) -C $(KERNEL_DIR) ARCH=sh oldconfig
	$(MAKE) -C $(KERNEL_DIR) ARCH=sh include/asm
	$(MAKE) -C $(KERNEL_DIR) ARCH=sh include/linux/version.h
	$(MAKE) -C $(KERNEL_DIR) uImage modules \
		ARCH=sh \
		CROSS_COMPILE=$(target)-
	$(MAKE) -C $(KERNEL_DIR) modules_install \
		ARCH=sh \
		CROSS_COMPILE=$(target)- \
		DEPMOD=$(DEPMOD) \
		INSTALL_MOD_PATH=$(targetprefix)
	$(INSTALL) -m644 $(KERNEL_DIR)/arch/sh/boot/uImage $(bootprefix)/vmlinux.ub && \
	$(INSTALL) -m644 $(KERNEL_DIR)/vmlinux $(targetprefix)/boot/vmlinux-sh4-$(KERNELVERSION) && \
	$(INSTALL) -m644 $(KERNEL_DIR)/System.map $(targetprefix)/boot/System.map-sh4-$(KERNELVERSION) && \
	$(INSTALL) -m644 $(KERNEL_DIR)/COPYING $(targetprefix)/boot/LICENSE && \
	cp $(KERNEL_DIR)/arch/sh/boot/uImage $(targetprefix)/boot/ && \
	rm $(targetprefix)/lib/modules/$(KERNELVERSION)/build || true && \
	rm $(targetprefix)/lib/modules/$(KERNELVERSION)/source || true
	touch $@

$(D)/tfkernel.do_compile:
	cd $(KERNEL_DIR) && \
		$(MAKE) $(if $(TF7700),TF7700=y) ARCH=sh CROSS_COMPILE=$(target)- uImage
	touch $@

linux-kernel-clean:
	rm -f $(DEPDIR)/linux-kernel

#
# Helper
#
linux-kernel.menuconfig linux-kernel.xconfig: \
linux-kernel.%:
	$(MAKE) -C $(KERNEL_DIR) ARCH=sh CROSS_COMPILE=sh4-linux- $*
	@echo
	@echo "You have to edit m a n u a l l y Patches/linux-$(KERNELVERSION).config to make changes permanent !!!"
	@echo ""
	diff $(KERNEL_DIR)/.config.old $(KERNEL_DIR)/.config
	@echo ""
