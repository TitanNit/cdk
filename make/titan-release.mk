#
# auxiliary targets for model-specific builds
#

#
# release_common_utils
#
release_titan_common_utils:
#	remove the slink to busybox
	rm -f $(prefix)/release/sbin/halt
	cp -f $(targetprefix)/sbin/halt $(prefix)/release/sbin/
	cp -f $(targetprefix)/etc/init.d/umountfs $(prefix)/release/etc/init.d/
	cp -f $(targetprefix)/etc/init.d/sendsigs $(prefix)/release/etc/init.d/
	cp -f $(targetprefix)/etc/init.d/reboot $(prefix)/release/etc/init.d/
	cp -f $(targetprefix)/etc/init.d/rc $(prefix)/release/etc/init.d/
	cp -f $(targetprefix)/etc/init.d/network $(prefix)/release/etc/init.d/
	cp -f $(targetprefix)/etc/init.d/networking $(prefix)/release/etc/init.d/
	cp -f $(targetprefix)/etc/init.d/mountvirtfs $(prefix)/release/etc/init.d/
	cp -f $(targetprefix)/etc/init.d/mountall $(prefix)/release/etc/init.d/
	cp -f $(targetprefix)/etc/init.d/hostname $(prefix)/release/etc/init.d/
	cp -f $(targetprefix)/etc/init.d/vsftpd $(prefix)/release/etc/init.d/
	cp -f $(targetprefix)/etc/init.d/bootclean.sh $(prefix)/release/etc/init.d/
	cp -f $(targetprefix)/etc/init.d/getfb.awk $(prefix)/release/etc/init.d/
	cp -f $(targetprefix)/etc/init.d/makedev $(prefix)/release/etc/init.d/
	cp -f $(targetprefix)/etc/init.d/udhcpc $(prefix)/release/etc/init.d/
	cp -f $(targetprefix)/etc/init.d/autofs $(prefix)/release/etc/init.d/
	cp -f $(targetprefix)/etc/init.d/swap $(prefix)/release/etc/init.d/
	mkdir -p $(prefix)/release/etc/rc.d/rc0.d
	ln -s ../init.d $(prefix)/release/etc/rc.d
	ln -fs halt $(prefix)/release/sbin/reboot
	ln -fs halt $(prefix)/release/sbin/poweroff
	ln -s ../init.d/sendsigs $(prefix)/release/etc/rc.d/rc0.d/S20sendsigs
	ln -s ../init.d/umountfs $(prefix)/release/etc/rc.d/rc0.d/S40umountfs
	ln -s ../init.d/halt $(prefix)/release/etc/rc.d/rc0.d/S90halt
	mkdir -p $(prefix)/release/etc/rc.d/rc6.d
	ln -s ../init.d/sendsigs $(prefix)/release/etc/rc.d/rc6.d/S20sendsigs
	ln -s ../init.d/umountfs $(prefix)/release/etc/rc.d/rc6.d/S40umountfs
	ln -s ../init.d/reboot $(prefix)/release/etc/rc.d/rc6.d/S90reboot

#
# release_cube_common
#
release_titan_cube_common:
	cp $(buildprefix)/root/release/halt_cuberevo $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(buildprefix)/root/release/reboot_cuberevo $(prefix)/release/etc/init.d/reboot
	chmod 777 $(prefix)/release/etc/init.d/reboot
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7109.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/bin/eeprom $(prefix)/release/bin
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/ipbox/micom.ko $(prefix)/release/lib/modules/
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx21143}.fw
#	rm -f $(prefix)/release/bin/vfdctl

#
# release_cube_common_tuner
#
release_titan_cube_common_tuner:
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/multituner/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/drivers/media/dvb/frontends/dvb-pll.ko $(prefix)/release/lib/modules/

#
# release_cuberevo_9500hd
#
release_titan_cuberevo_9500hd: release_titan_common_utils release_titan_cube_common release_titan_cube_common_tuner
	echo "cuberevo-9500hd" > $(prefix)/release/etc/hostname

#
# release_cuberevo_2000hd
#
release_titan_cuberevo_2000hd: release_titan_common_utils release_titan_cube_common release_titan_cube_common_tuner
	echo "cuberevo-2000hd" > $(prefix)/release/etc/hostname

#
# release_cuberevo_250hd
#
release_titan_cuberevo_250hd: release_titan_common_utils release_titan_cube_common release_titan_cube_common_tuner
	echo "cuberevo-250hd" > $(prefix)/release/etc/hostname

#
# release_cuberevo_mini_fta
#
release_titan_cuberevo_mini_fta: release_titan_common_utils release_titan_cube_common release_titan_cube_common_tuner
	echo "cuberevo-mini-fta" > $(prefix)/release/etc/hostname

#
# release_cuberevo_mini2
#
release_titan_cuberevo_mini2: release_titan_common_utils release_titan_cube_common release_titan_cube_common_tuner
	echo "cuberevo-mini2" > $(prefix)/release/etc/hostname

#
# release_cuberevo_mini
#
release_titan_cuberevo_mini: release_titan_common_utils release_titan_cube_common release_titan_cube_common_tuner
	echo "cuberevo-mini" > $(prefix)/release/etc/hostname

#
# release_cuberevo
#
release_titan_cuberevo: release_titan_common_utils release_titan_cube_common release_titan_cube_common_tuner
	echo "cuberevo" > $(prefix)/release/etc/hostname

#
# release_common_ipbox
#
release_titan_common_ipbox:
	cp $(buildprefix)/root/release/halt_ipbox $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/siinfo/siinfo.ko $(prefix)/release/lib/modules/
	cp -f $(buildprefix)/root/release/fstab_ipbox $(prefix)/release/etc/fstab
	cp $(targetprefix)/boot/video_7109.elf $(prefix)/release/lib/firmware/video.elf
	cp -dp $(buildprefix)/root/release/lircd_ipbox.conf $(prefix)/release/etc/lircd.conf
	cp -p $(buildprefix)/root/release/lircd_ipbox $(prefix)/release/usr/bin/lircd
	rm -f $(prefix)/release/lib/firmware/*
	rm -f $(prefix)/release/lib/modules/boxtype.ko
	rm -f $(prefix)/release/lib/modules/bpamem.ko
	rm -f $(prefix)/release/lib/modules/ramzswap.ko
	rm -f $(prefix)/release/lib/modules/simu_button.ko
	rm -f $(prefix)/release/lib/modules/stmvbi.ko
	rm -f $(prefix)/release/lib/modules/stmvout.ko
	rm -f $(prefix)/release/bin/gotosleep
	rm -f $(prefix)/release/etc/network/interfaces

#
# release_ipbox9900
#
release_titan_ipbox9900: release_titan_common_utils release_titan_common_ipbox
	echo "ipbox9900" > $(prefix)/release/etc/hostname
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/ipbox99xx/micom.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/rmu/rmu.ko $(prefix)/release/lib/modules/
	cp -p $(buildprefix)/root/release/tvmode_ipbox $(prefix)/release/usr/bin/tvmode

#
# release_ipbox99
#
release_titan_ipbox99: release_titan_common_utils release_titan_common_ipbox
	echo "ipbox99" > $(prefix)/release/etc/hostname
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/ipbox99xx/micom.ko $(prefix)/release/lib/modules/
	cp -p $(buildprefix)/root/release/tvmode_ipbox $(prefix)/release/usr/bin/tvmode

#
# release_ipbox55
#
release_titan_ipbox55: release_titan_common_utils release_titan_common_ipbox
	echo "ipbox55" > $(prefix)/release/etc/hostname
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/ipbox55/front.ko $(prefix)/release/lib/modules/
	cp -p $(buildprefix)/root/release/tvmode_ipbox55 $(prefix)/release/usr/bin/tvmode

#
# release_ufs910
#
release_titan_ufs910: release_titan_common_utils
	echo "ufs910" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_ufs $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/vfd/vfd.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-stx7100.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7100.elf $(prefix)/release/lib/firmware/video.elf
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx24116,stv6306}.fw
	mv $(prefix)/release/lib/firmware/dvb-fe-cx21143.fw $(prefix)/release/lib/firmware/dvb-fe-cx24116.fw
	rm $(prefix)/release/lib/firmware/component_7105_pdk7105.fw
	rm $(prefix)/release/lib/firmware/component_7111_mb618.fw
	cp -dp $(buildprefix)/root/release/lircd_ufs910.conf $(prefix)/release/etc/lircd.conf
	cp -p $(targetprefix)/usr/sbin/lircd $(prefix)/release/usr/bin/
	rm -f $(prefix)/release/bin/vdstandby
	rm -f $(prefix)/release/bin/eeprom

#
# release_ufs912
#
release_titan_ufs912: release_titan_common_utils
	echo "ufs912" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_ufs912 $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/micom/micom.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7111.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/boot/audio_7111.elf $(prefix)/release/lib/firmware/audio.elf
	mv $(prefix)/release/lib/firmware/component_7111_mb618.fw $(prefix)/release/lib/firmware/component.fw
	rm $(prefix)/release/lib/firmware/component_7105_pdk7105.fw
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx24116,cx21143,stv6306}.fw
	rm -f $(prefix)/release/bin/gotosleep
	rm -f $(prefix)/release/bin/eeprom

#
# release_ufs913
#
release_titan_ufs913: release_titan_common_utils
	echo "ufs913" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_ufs912 $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/micom/micom.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/multituner/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-sti7105.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7105.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/boot/audio_7105.elf $(prefix)/release/lib/firmware/audio.elf
	mv $(prefix)/release/lib/firmware/component_7105_pdk7105.fw $(prefix)/release/lib/firmware/component.fw
	rm $(prefix)/release/lib/firmware/component_7111_mb618.fw
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,cx24116,cx21143,stv6306}.fw
	rm -f $(prefix)/release/bin/gotosleep
	rm -f $(prefix)/release/bin/eeprom

#
# release_ufs922
#
release_titan_ufs922: release_titan_common_utils
	echo "ufs922" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_ufs $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/micom/micom.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/ufs922_fan/fan_ctrl.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7109.elf $(prefix)/release/lib/firmware/video.elf
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl6222,cx24116}.fw
	rm -f $(prefix)/release/bin/gotosleep
	rm -f $(prefix)/release/bin/eeprom

#
# release_ufc960
#
release_titan_ufc960: release_titan_common_utils
	echo "ufc960" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_ufs $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/micom/micom.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7109.elf $(prefix)/release/boot/video.elf
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx24116}.fw
	rm -f $(prefix)/release/bin/gotosleep
	rm -f $(prefix)/release/bin/eeprom

#
# release_spark
#
release_titan_spark: release_titan_common_utils
	echo "spark" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_spark $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/aotom_spark/aotom.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/lnb/lnb.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7111.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/boot/audio_7111.elf $(prefix)/release/lib/firmware/audio.elf
	mv $(prefix)/release/lib/firmware/component_7111_mb618.fw $(prefix)/release/lib/firmware/component.fw
	rm $(prefix)/release/lib/firmware/component_7105_pdk7105.fw
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx24116,cx21143,stv6306}.fw
	rm -f $(prefix)/release/bin/gotosleep
	rm -f $(prefix)/release/bin/vdstandby
	rm -f $(prefix)/release/bin/eeprom
	cp -dp $(buildprefix)/root/release/lircd_spark.conf $(prefix)/release/etc/lircd.conf
	cp -p $(targetprefix)/usr/sbin/lircd $(prefix)/release/usr/bin/
	cp -f $(buildprefix)/root/sbin/flash_* $(prefix)/release/sbin
	cp -f $(buildprefix)/root/sbin/nand* $(prefix)/release/sbin

#
# release_spark7162
#
release_titan_spark7162: release_titan_common_utils
	echo "spark7162" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_spark7162 $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/aotom_spark/aotom.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-sti7105.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp -f $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/i2c_spi/i2s.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7105.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/boot/audio_7105.elf $(prefix)/release/lib/firmware/audio.elf
	mv $(prefix)/release/lib/firmware/component_7105_pdk7105.fw $(prefix)/release/lib/firmware/component.fw
	rm -f $(prefix)/release/lib/firmware/component_7111_mb618.fw
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx24116,cx21143,stv6306}.fw
	rm -f $(prefix)/release/bin/gotosleep
	rm -f $(prefix)/release/bin/vdstandby
	rm -f $(prefix)/release/bin/eeprom
	cp -f $(buildprefix)/root/sbin/flashcp $(prefix)/release/sbin
	cp -f $(buildprefix)/root/sbin/flash_* $(prefix)/release/sbin
	cp -f $(buildprefix)/root/sbin/nand* $(prefix)/release/sbin

#
# release_fortis_hdbox
#
release_titan_fortis_hdbox: release_titan_common_utils
	echo "fortis" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_fortis_hdbox $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/nuvoton/nuvoton.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7109.elf $(prefix)/release/lib/firmware/video.elf
	rm -f $(prefix)/release/lib/firmware/component_7111_mb618.fw
	rm -f $(prefix)/release/lib/firmware/component_7105_pdk7105.fw
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx24116,cx21143,stv6306}.fw
	rm -f $(prefix)/release/bin/eeprom

#
# release_atevio7500
#
release_titan_atevio7500: release_titan_common_utils
	echo "atevio7500" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_fortis_hdbox $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/nuvoton/nuvoton.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/multituner/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-sti7105.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7105.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/boot/audio_7105.elf $(prefix)/release/lib/firmware/audio.elf
	mv $(prefix)/release/lib/firmware/component_7105_pdk7105.fw $(prefix)/release/lib/firmware/component.fw
	rm -f $(prefix)/release/lib/firmware/component_7111_mb618.fw
	cp $(targetprefix)/lib/firmware/dvb-fe-avl2108.fw $(prefix)/release/lib/firmware/
	cp $(targetprefix)/lib/firmware/dvb-fe-stv6306.fw $(prefix)/release/lib/firmware/
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl6222,cx24116,cx21143}.fw
	rm -f $(prefix)/release/lib/modules/boxtype.ko
	rm -f $(prefix)/release/lib/modules/mpeg2hw.ko
	rm -f $(prefix)/release/bin/eeprom

#
# release_octagon1008
#
release_titan_octagon1008: release_titan_common_utils
	echo "octagon1008" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_octagon1008 $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/nuvoton/nuvoton.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7109.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/lib/firmware/dvb-fe-avl2108.fw $(prefix)/release/lib/firmware/
	cp $(targetprefix)/lib/firmware/dvb-fe-stv6306.fw $(prefix)/release/lib/firmware/
	rm -f $(prefix)/release/lib/firmware/component_7111_mb618.fw
	rm -f $(prefix)/release/lib/firmware/component_7105_pdk7105.fw
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl6222,cx24116,cx21143}.fw
	rm -f $(prefix)/release/bin/eeprom

#
# release_hs7110
#
release_titan_hs7110: release_titan_common_utils
	echo "hs7110" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_hs7110 $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/nuvoton/nuvoton.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/lnb/lnb.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7111.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/boot/audio_7111.elf $(prefix)/release/lib/firmware/audio.elf
	mv $(prefix)/release/lib/firmware/component_7111_mb618.fw $(prefix)/release/lib/firmware/component.fw
	rm $(prefix)/release/lib/firmware/component_7105_pdk7105.fw
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx24116,cx21143,stv6306}.fw

#
# release_hs7810a
#
release_titan_hs7810a: release_titan_common_utils
	echo "hs7810a" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_hs7810a $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/nuvoton/nuvoton.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/lnb/lnb.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7111.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/boot/audio_7111.elf $(prefix)/release/lib/firmware/audio.elf
	mv $(prefix)/release/lib/firmware/component_7111_mb618.fw $(prefix)/release/lib/firmware/component.fw
	rm $(prefix)/release/lib/firmware/component_7105_pdk7105.fw
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx24116,cx21143,stv6306}.fw

#
# release_hs7119
#
release_titan_hs7119: release_titan_common_utils
	echo "hs7119" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_hs7119 $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/nuvoton/nuvoton.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/lnb/lnb.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7111.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/boot/audio_7111.elf $(prefix)/release/lib/firmware/audio.elf
	mv $(prefix)/release/lib/firmware/component_7111_mb618.fw $(prefix)/release/lib/firmware/component.fw
	rm $(prefix)/release/lib/firmware/component_7105_pdk7105.fw
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx24116,cx21143,stv6306}.fw

#
# release_hs7819
#
release_titan_hs7819: release_titan_common_utils
	echo "hs7819" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_hs7819 $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/nuvoton/nuvoton.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/lnb/lnb.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7111.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/boot/audio_7111.elf $(prefix)/release/lib/firmware/audio.elf
	mv $(prefix)/release/lib/firmware/component_7111_mb618.fw $(prefix)/release/lib/firmware/component.fw
	rm $(prefix)/release/lib/firmware/component_7105_pdk7105.fw
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx24116,cx21143,stv6306}.fw

#
# release_atemio520
#
release_titan_atemio520: release_titan_common_utils
	echo "atemio520" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_atemio520 $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/cn_micom/cn_micom.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/lnb/lnb.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7111.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/boot/audio_7111.elf $(prefix)/release/lib/firmware/audio.elf
	mv $(prefix)/release/lib/firmware/component_7111_mb618.fw $(prefix)/release/lib/firmware/component.fw
	rm $(prefix)/release/lib/firmware/component_7105_pdk7105.fw
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx24116,cx21143,stv6306}.fw

#
# release_atemio530
#
release_titan_atemio530: release_titan_common_utils
	echo "atemio530" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_atemio530 $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/cn_micom/cn_micom.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/lnb/lnb.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7111.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/boot/audio_7111.elf $(prefix)/release/lib/firmware/audio.elf
	mv $(prefix)/release/lib/firmware/component_7111_mb618.fw $(prefix)/release/lib/firmware/component.fw
	rm $(prefix)/release/lib/firmware/component_7105_pdk7105.fw
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx24116,cx21143,stv6306}.fw

#
# release_hl101
#
release_titan_hl101: release_titan_common_utils
	echo "hl101" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_hl101 $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/proton/proton.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7109.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/lib/firmware/dvb-fe-avl2108.fw $(prefix)/release/lib/firmware/
	cp $(targetprefix)/lib/firmware/dvb-fe-stv6306.fw $(prefix)/release/lib/firmware/
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl6222,cx24116,cx21143}.fw
	cp -dp $(buildprefix)/root/release/lircd_hl101.conf $(prefix)/release/etc/lircd.conf
	cp -p $(targetprefix)/usr/sbin/lircd $(prefix)/release/usr/bin/

#
# release_adb_box
#
release_titan_adb_box: release_titan_common_utils
	echo "Adb_Box" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_adb_box $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/adb_box_vfd/vfd.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-stx7100.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/adb_box_fan/cooler.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/cec_adb_box/cec_ctrl.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/dvbt/as102/dvb-as102.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7100.elf $(prefix)/release/lib/firmware/video.elf
	cp $(buildprefix)/root/firmware/as102_data1_st.hex $(prefix)/release/lib/firmware/
	cp $(buildprefix)/root/firmware/as102_data2_st.hex $(prefix)/release/lib/firmware/
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl6222,cx24116,cx21143}.fw
	cp -f $(buildprefix)/root/release/fstab_adb_box $(prefix)/release/etc/fstab
	cp -dp $(buildprefix)/root/release/lircd_adb_box.conf $(prefix)/release/etc/lircd.conf
	cp -p $(targetprefix)/usr/sbin/lircd $(prefix)/release/usr/bin/lircd

#
# release_vip1_v2
#
release_titan_vip1_v2: release_titan_common_utils
	echo "Edision-v2" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_vip2 $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/aotom/aotom.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7109.elf $(prefix)/release/lib/firmware/video.elf
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx24116,cx21143,stv6306}.fw
	cp -f $(buildprefix)/root/release/fstab_vip2 $(prefix)/release/etc/fstab
	cp -dp $(buildprefix)/root/release/lircd_vip1_v2.conf $(prefix)/release/etc/lircd.conf
	cp -p $(targetprefix)/usr/sbin/lircd $(prefix)/release/usr/bin/

#
# release_vip2_v1
#
release_titan_vip2_v1: release_titan_common_utils
	echo "Edision-v1" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_vip2 $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/aotom/aotom.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7109.elf $(prefix)/release/lib/firmware/video.elf
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx24116,cx21143,stv6306}.fw
	cp -f $(buildprefix)/root/release/fstab_vip2 $(prefix)/release/etc/fstab
	cp -dp $(buildprefix)/root/release/lircd_vip2_v1.conf $(prefix)/release/etc/lircd.conf
	cp -p $(targetprefix)/usr/sbin/lircd $(prefix)/release/usr/bin/

#
# release_hs5101
#
release_titan_hs5101: release_titan_common_utils
	echo "hs5101" > $(prefix)/release/etc/hostname
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/button_hs5101/button.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/vfd_hs5101/vfd.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-stx7100.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7100.elf $(prefix)/release/lib/firmware/video.elf
	cp -dp $(buildprefix)/root/release/lircd_hs5101.conf $(prefix)/release/etc/lircd.conf
	cp -p $(targetprefix)/usr/sbin/lircd $(prefix)/release/usr/bin/
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,avl6222,cx21143,stv6306}.fw
	rm -f $(prefix)/release/bin/vdstandby

#
# release_tf7700
#
release_titan_tf7700: release_titan_common_utils
	echo "tf7700" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_tf7700 $(prefix)/release/etc/init.d/halt
	chmod 755 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/tffp/tffp.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontends/*.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7109.elf $(prefix)/release/lib/firmware/video.elf
	cp -f $(buildprefix)/root/release/fstab_tf7700 $(prefix)/release/etc/fstab

#
# release_vitamin_hd5000
#
release_titan_vitamin_hd5000: release_titan_common_utils
	echo "vitamin_hd5000" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_ufs912 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/vitamin_hd5000/micom.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/smartcard/smartcard.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7111.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/boot/audio_7111.elf $(prefix)/release/lib/firmware/audio.elf
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,cx24116,cx21143,stv6306}.fw
	mv $(prefix)/release/lib/firmware/component_7111_mb618.fw $(prefix)/release/lib/firmware/component.fw
	rm $(prefix)/release/lib/firmware/component_7105_pdk7105.fw

#
# release_SAGEMCOM88
#
release_titan_sagemcom88: release_titan_common_utils
	echo "sagemcom88" > $(prefix)/release/etc/hostname
	cp $(buildprefix)/root/release/halt_ufs912 $(prefix)/release/etc/init.d/halt
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmcore-display-sti7105.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/front_led/front_led.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/frontcontroller/front_vfd/front_vfd.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/sagemcomtype/sagemcomtype.ko $(prefix)/release/lib/modules/
	cp $(targetprefix)/boot/video_7105.elf $(prefix)/release/lib/firmware/video.elf
	cp $(targetprefix)/boot/audio_7105.elf $(prefix)/release/lib/firmware/audio.elf
	[ -e $(buildprefix)/root/release/fe_core_sagemcom88$(KERNELSTMLABEL).ko ] && cp $(buildprefix)/root/release/fe_core_sagemcom88$(KERNELSTMLABEL).ko $(prefix)/release/lib/modules/fe_core.ko || true
	rm -f $(prefix)/release/lib/firmware/dvb-fe-{avl2108,cx24116,cx21143,stv6306}.fw
	mv $(prefix)/release/lib/firmware/component_7105_pdk7105.fw $(prefix)/release/lib/firmware/component.fw
	rm $(prefix)/release/lib/firmware/component_7111_mb618.fw
	cp -p $(targetprefix)/usr/sbin/lircd $(prefix)/release/usr/bin/
	cp -p $(targetprefix)/usr/sbin/lircmd $(prefix)/release/usr/bin/
	cp -p $(targetprefix)/usr/bin/irexec $(prefix)/release/usr/bin/
	cp -p $(targetprefix)/usr/bin/irrecord $(prefix)/release/usr/bin/
	cp -p $(targetprefix)/usr/bin/irsend $(prefix)/release/usr/bin/
	cp -p $(targetprefix)/usr/bin/irw $(prefix)/release/usr/bin/
	cp -dp $(buildprefix)/root/release/lircd_sagemcom88.conf $(prefix)/release/etc/lircd.conf

#
# release_base
#
# the following target creates the common file base
release_titan_base:
	rm -rf $(prefix)/release || true
	$(INSTALL_DIR) $(prefix)/release && \
	$(INSTALL_DIR) $(prefix)/release/{bin,boot,dev,dev.static,etc,hdd,lib,media,mnt,proc,ram,root,sbin,swap,sys,tmp,usr,var} && \
	$(INSTALL_DIR) $(prefix)/release/etc/{init.d,network,mdev} && \
	$(INSTALL_DIR) $(prefix)/release/etc/network/{if-down.d,if-post-down.d,if-pre-up.d,if-up.d} && \
	$(INSTALL_DIR) $(prefix)/release/lib/{modules,udev,firmware} && \
	$(INSTALL_DIR) $(prefix)/release/media/{dvd,nfs,usb,sda1,sdb1} && \
	ln -sf /hdd $(prefix)/release/media/hdd && \
	$(INSTALL_DIR) $(prefix)/release/mnt/{hdd,nfs,usb} && \
	$(INSTALL_DIR) $(prefix)/release/usr/{bin,lib,local,share} && \
	$(INSTALL_DIR) $(prefix)/release/usr/local/{bin,sbin} && \
	$(INSTALL_DIR) $(prefix)/release/usr/share/{fonts,udhcpc,zoneinfo} && \
	ln -sf /usr/share $(prefix)/release/share && \
	$(INSTALL_DIR) $(prefix)/release/var/{bin,boot,etc,httpd,lib,update} && \
	$(INSTALL_DIR) $(prefix)/release/var/lib/nfs && \
	touch $(prefix)/release/var/etc/.firstboot && \
	cp -a $(targetprefix)/bin/* $(prefix)/release/bin/ && \
	cp -dp $(targetprefix)/sbin/init $(prefix)/release/sbin/ && \
	cp -dp $(targetprefix)/sbin/killall5 $(prefix)/release/sbin/ && \
	cp -dp $(targetprefix)/sbin/portmap $(prefix)/release/sbin/ && \
	cp -dp $(targetprefix)/sbin/hd-idle $(prefix)/release/sbin/ && \
	cp -dp $(targetprefix)/sbin/mke2fs $(prefix)/release/sbin/ && \
	ln -sf /sbin/mke2fs $(prefix)/release/sbin/mkfs.ext2 && \
	ln -sf /sbin/mke2fs $(prefix)/release/sbin/mkfs.ext3 && \
	ln -sf /sbin/mke2fs $(prefix)/release/sbin/mkfs.ext4 && \
	ln -sf /sbin/mke2fs $(prefix)/release/sbin/mkfs.ext4dev && \
	cp -dp $(targetprefix)/sbin/fsck $(prefix)/release/sbin/ && \
	cp -dp $(targetprefix)/sbin/e2fsck $(prefix)/release/sbin/ && \
	cp -dp $(targetprefix)/sbin/shutdown $(prefix)/release/sbin/ && \
	ln -sf /sbin/e2fsck $(prefix)/release/sbin/fsck.ext2 && \
	ln -sf /sbin/e2fsck $(prefix)/release/sbin/fsck.ext3 && \
	ln -sf /sbin/e2fsck $(prefix)/release/sbin/fsck.ext4 && \
	ln -sf /sbin/e2fsck $(prefix)/release/sbin/fsck.ext4dev && \
	cp -dp $(targetprefix)/sbin/sfdisk $(prefix)/release/sbin/ && \
	cp -dp $(targetprefix)/sbin/tune2fs $(prefix)/release/sbin/ && \
	cp -dp $(targetprefix)/etc/init.d/portmap $(prefix)/release/etc/init.d/ && \
	cp -dp $(buildprefix)/root/sbin/MAKEDEV $(prefix)/release/sbin/MAKEDEV && \
	ln -sf ../sbin/MAKEDEV $(prefix)/release/dev/MAKEDEV && \
	ln -sf ../../sbin/MAKEDEV $(prefix)/release/lib/udev/MAKEDEV && \
	cp $(targetprefix)/boot/uImage $(prefix)/release/boot/ && \
	cp $(targetprefix)/boot/audio.elf $(prefix)/release/lib/firmware/audio.elf && \
	cp -dp $(targetprefix)/etc/fstab $(prefix)/release/etc/ && \
	cp -dp $(buildprefix)/root/etc/group $(prefix)/release/etc/ && \
	cp -dp $(targetprefix)/etc/host.conf $(prefix)/release/etc/ && \
	cp -dp $(targetprefix)/etc/hostname $(prefix)/release/etc/ && \
	cp -dp $(targetprefix)/etc/hosts $(prefix)/release/etc/ && \
	cp $(buildprefix)/root/root_titan/etc/inetd.conf $(prefix)/release/etc/ && \
	cp -dp $(targetprefix)/etc/localtime $(prefix)/release/etc/ && \
	ln -sf /proc/mounts $(prefix)/release/etc/mtab && \
	cp -dp $(buildprefix)/root/etc/nsswitch.conf $(prefix)/release/etc/ && \
	cp -dp $(buildprefix)/root/etc/passwd $(prefix)/release/etc/ && \
	cp -dp $(targetprefix)/etc/profile $(prefix)/release/etc/ && \
	cp -dp $(targetprefix)/etc/protocols $(prefix)/release/etc/ && \
	cp -dp $(targetprefix)/etc/resolv.conf $(prefix)/release/etc/ && \
	cp -dp $(targetprefix)/etc/services $(prefix)/release/etc/ && \
	cp -dp $(targetprefix)/etc/shells $(prefix)/release/etc/ && \
	cp -dp $(targetprefix)/etc/shells.conf $(prefix)/release/etc/ && \
	cp -dp $(targetprefix)/etc/vsftpd.conf $(prefix)/release/etc/ && \
	cp -dp $(targetprefix)/etc/timezone.xml $(prefix)/release/etc/ && \
	cp -dp $(targetprefix)/etc/vdstandby.cfg $(prefix)/release/etc/ && \
	cp -dp $(targetprefix)/etc/network/interfaces $(prefix)/release/etc/network/ && \
	cp -dp $(targetprefix)/etc/network/options $(prefix)/release/etc/network/ && \
	cp -aR $(buildprefix)/root/etc/mdev/* $(prefix)/release/etc/mdev/ && \
	cp -aR $(buildprefix)/root/usr/share/udhcpc/* $(prefix)/release/usr/share/udhcpc/ && \
	cp -aR $(buildprefix)/root/usr/share/zoneinfo/* $(prefix)/release/usr/share/zoneinfo/ && \
	echo "576i50" > $(prefix)/release/etc/videomode && \
	cp $(buildprefix)/root/release/rcS_titan$(if $(TF7700),_$(TF7700))$(if $(OCTAGON1008),_$(OCTAGON1008))$(if $(FORTIS_HDBOX),_$(FORTIS_HDBOX))$(if $(ATEVIO7500),_$(ATEVIO7500))$(if $(HS7110),_$(HS7110))$(if $(HS7810A),_$(HS7810A))$(if $(HS7119),_$(HS7119))$(if $(HS7819),_$(HS7819))$(if $(ATEMIO520),_$(ATEMIO520))$(if $(ATEMIO530),_$(ATEMIO530))$(if $(HL101),_$(HL101))$(if $(VIP1_V2),_$(VIP1_V2))$(if $(VIP2_V1),_$(VIP2_V1))$(if $(ADB_BOX),_$(ADB_BOX))$(if $(UFS910),_$(UFS910))$(if $(UFS912),_$(UFS912))$(if $(UFS913),_$(UFS913))$(if $(UFS922),_$(UFS922))$(if $(CUBEREVO),_$(CUBEREVO))$(if $(CUBEREVO_MINI),_$(CUBEREVO_MINI))$(if $(CUBEREVO_MINI2),_$(CUBEREVO_MINI2))$(if $(CUBEREVO_MINI_FTA),_$(CUBEREVO_MINI_FTA))$(if $(CUBEREVO_250HD),_$(CUBEREVO_250HD))$(if $(CUBEREVO_2000HD),_$(CUBEREVO_2000HD))$(if $(CUBEREVO_9500HD),_$(CUBEREVO_9500HD))$(if $(SPARK),_$(SPARK))$(if $(SPARK7162),_$(SPARK7162)) $(prefix)/release/etc/init.d/rcS && \
	chmod 755 $(prefix)/release/etc/init.d/rcS && \
	export CROSS_COMPILE=$(target)- && \
		$(MAKE) install -C @DIR_busybox@ CONFIG_PREFIX=$(prefix)/release && \
	cp -dp $(targetprefix)/usr/bin/vsftpd $(prefix)/release/usr/bin/ && \
	cp $(buildprefix)/root/bin/autologin $(prefix)/release/bin/ && \
	cp $(buildprefix)/root/usr/sbin/fw_printenv $(prefix)/release/usr/sbin/ && \
	ln -sf ../../usr/sbin/fw_printenv $(prefix)/release/usr/sbin/fw_setenv && \
	cp -dp $(targetprefix)/sbin/hotplug $(prefix)/release/sbin/ && \
	cp -dp $(targetprefix)/sbin/blkid $(prefix)/release/sbin/ && \
	cp -p $(targetprefix)/usr/bin/ffmpeg $(prefix)/release/sbin/ && \
	ln -sf ../../bin/busybox $(prefix)/release/usr/bin/ether-wake && \
	cp -dp $(targetprefix)/sbin/mkfs $(prefix)/release/sbin/
if !ENABLE_UFS910
if !ENABLE_UFS922
	cp -dp $(targetprefix)/sbin/jfs_fsck $(prefix)/release/sbin/ && \
	ln -sf /sbin/jfs_fsck $(prefix)/release/sbin/fsck.jfs && \
	cp -dp $(targetprefix)/sbin/jfs_mkfs $(prefix)/release/sbin/ && \
	ln -sf /sbin/jfs_mkfs $(prefix)/release/sbin/mkfs.jfs && \
	cp -dp $(targetprefix)/sbin/jfs_tune $(prefix)/release/sbin/
endif
endif

	cp -dp $(buildprefix)/root/release/inittab$(if $(FORTIS_HDBOX)$(OCTAGON1008)$(CUBEREVO)$(CUBEREVO_MINI2)$(CUBEREVO_2000HD),_ttyAS1) $(prefix)/release/etc/inittab
	cp $(buildprefix)/root/release/fw_env.config$(if $(ATEVIO7500),_$(ATEVIO7500))$(if $(FORTIS_HDBOX),_$(FORTIS_HDBOX))$(if $(OCTAGON1008),_$(OCTAGON1008))$(if $(TF7700),_$(TF7700))$(if $(UFS910),_$(UFS910))$(if $(UFS912),_$(UFS912))$(if $(UFS913),_$(UFS913))$(if $(UFS922),_$(UFS922))$(if $(ADB_BOX),_$(ADB_BOX))$(if $(CUBEREVO),_$(CUBEREVO))$(if $(CUBEREVO_MINI),_$(CUBEREVO_MINI))$(if $(CUBEREVO_MINI2),_$(CUBEREVO_MINI2))$(if $(CUBEREVO_250HD),_$(CUBEREVO_250HD))$(if $(CUBEREVO_2000HD),_$(CUBEREVO_2000HD))$(if $(IPBOX9900),_$(IPBOX9900))$(if $(IPBOX99),_$(IPBOX99))$(if $(IPBOX55),_$(IPBOX55))$(if $(SPARK),_$(SPARK))$(if $(SPARK7162),_$(SPARK7162))$(if $(VITAMIN_HD5000),_$(VITAMIN_HD5000)) $(prefix)/release/etc/fw_env.config

#
# Player
#
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stm_v4l2.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stm_v4l2.ko $(prefix)/release/lib/modules/ || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmvbi.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmvbi.ko $(prefix)/release/lib/modules/ || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmvout.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmvout.ko $(prefix)/release/lib/modules/ || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmfb.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/stgfb/stmfb/stmfb.ko $(prefix)/release/lib/modules/ || true
	cd $(targetprefix)/lib/modules/$(KERNELVERSION)/extra && \
	for mod in \
		sound/pseudocard/pseudocard.ko \
		sound/silencegen/silencegen.ko \
		stm/mmelog/mmelog.ko \
		stm/monitor/stm_monitor.ko \
		media/dvb/stm/dvb/stmdvb.ko \
		sound/ksound/ksound.ko \
		media/dvb/stm/mpeg2_hard_host_transformer/mpeg2hw.ko \
		media/dvb/stm/backend/player2.ko \
		media/dvb/stm/h264_preprocessor/sth264pp.ko \
		media/dvb/stm/allocator/stmalloc.ko \
		stm/platform/platform.ko \
		stm/platform/p2div64.ko \
		media/sysfs/stm/stmsysfs.ko \
	;do \
		echo `pwd` player2/linux/drivers/$$mod; \
		if [ -e player2/linux/drivers/$$mod ]; then \
			cp player2/linux/drivers/$$mod $(prefix)/release/lib/modules/; \
			sh4-linux-strip --strip-unneeded $(prefix)/release/lib/modules/`basename $$mod`; \
		else \
			touch $(prefix)/release/lib/modules/`basename $$mod`; \
		fi; \
		echo "."; \
	done
	echo "touched";

#
# modules
#
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/avs/avs.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/avs/avs.ko $(prefix)/release/lib/modules/ || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/bpamem/bpamem.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/bpamem/bpamem.ko $(prefix)/release/lib/modules/ || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/boxtype/boxtype.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/boxtype/boxtype.ko $(prefix)/release/lib/modules/ || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/compcache/ramzswap.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/compcache/ramzswap.ko $(prefix)/release/lib/modules/ || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/e2_proc/e2_proc.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/e2_proc/e2_proc.ko $(prefix)/release/lib/modules/ || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/net/ipv6/ipv6.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/net/ipv6/ipv6.ko $(prefix)/release/lib/modules || true

#
# multicom 324
#
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/embxshell/embxshell.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/embxshell/embxshell.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/embxmailbox/embxmailbox.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/embxmailbox/embxmailbox.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/embxshm/embxshm.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/embxshm/embxshm.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/mme/mme_host.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/mme/mme_host.ko $(prefix)/release/lib/modules || true

#
# multicom 406
#
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/src/embx/embx.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/src/embx/embx.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/src/embxmailbox/embxmailbox.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/src/embxmailbox/embxmailbox.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/src/embxshm/embxshm.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/src/embxshm/embxshm.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/src/ics/ics.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/src/ics/ics.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/src/ics/ics_user.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/src/ics/ics_user.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/src/mme/mme.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/src/mme/mme.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/src/mme/mme_user.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/multicom/src/mme/mme_user.ko $(prefix)/release/lib/modules || true

	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/simu_button/simu_button.ko $(prefix)/release/lib/modules/
if !ENABLE_VIP2_V1
if !ENABLE_SPARK
if !ENABLE_SPARK7162
	cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/cic/*.ko $(prefix)/release/lib/modules/
endif
endif
endif
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/button/button.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/button/button.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/cec/cec.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/cec/cec.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/cpu_frequ/cpu_frequ.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/cpu_frequ/cpu_frequ.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/led/led.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/led/led.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/pti/pti.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/pti/pti.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/pti_np/pti.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/pti_np/pti.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/smartcard/smartcard.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/smartcard/smartcard.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/autofs4/autofs4.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/autofs4/autofs4.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/drivers/net/tun.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/drivers/net/tun.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/drivers/usb/serial/ftdi_sio.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/drivers/usb/serial/ftdi_sio.ko $(prefix)/release/lib/modules/ftdi_sio.ko || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/drivers/usb/serial/pl2303.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/drivers/usb/serial/pl2303.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/drivers/usb/serial/usbserial.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/drivers/usb/serial/usbserial.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/fuse/fuse.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/fuse/fuse.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/ntfs/ntfs.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/ntfs/ntfs.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/cifs/cifs.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/cifs/cifs.ko $(prefix)/release/lib/modules || true
if !ENABLE_UFS910
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/jfs/jfs.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/jfs/jfs.ko $(prefix)/release/lib/modules || true
endif
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/nfsd/nfsd.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/nfsd/nfsd.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/exportfs/exportfs.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/exportfs/exportfs.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/nfs_common/nfs_acl.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/nfs_common/nfs_acl.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/nfs/nfs.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/nfs/nfs.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/wireless/rt2870sta/rt2870sta.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/wireless/rt2870sta/rt2870sta.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/wireless/rt3070sta/rt3070sta.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/wireless/rt3070sta/rt3070sta.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/wireless/rt5370sta/rt5370sta.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/wireless/rt5370sta/rt5370sta.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/wireless/rtl871x/8712u.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/wireless/rtl871x/8712u.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/wireless/rtl8188eu/8188eu.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/wireless/rtl8188eu/8188eu.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/wireless/rtl8192cu/8192cu.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/wireless/rtl8192cu/8192cu.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/sata_switch/sata.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/extra/sata_switch/sata.ko $(prefix)/release/lib/modules || true
	[ -e $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/mini_fo/mini_fo.ko ] && cp $(targetprefix)/lib/modules/$(KERNELVERSION)/kernel/fs/mini_fo/mini_fo.ko $(prefix)/release/lib/modules || true

#
# lib usr/lib
#
	cp -R $(targetprefix)/lib/* $(prefix)/release/lib/

	cp -R $(targetprefix)/usr/lib/* $(prefix)/release/usr/lib/
	chmod 755 $(prefix)/release/usr/lib/*

#
# fonts
#

#
# titan
#
	ln -sf /usr/share $(prefix)/release/usr/local/share
	cp $(targetprefix)/usr/local/bin/titan $(prefix)/release/usr/local/bin/

#
# WLAN
#
	if [ -e $(targetprefix)/usr/sbin/ifrename ]; then \
		cp -dp $(targetprefix)/usr/sbin/ifrename $(prefix)/release/usr/sbin/; \
		cp -dp $(targetprefix)/usr/sbin/iwconfig $(prefix)/release/usr/sbin/; \
		cp -dp $(targetprefix)/usr/sbin/iwevent $(prefix)/release/usr/sbin/; \
		cp -dp $(targetprefix)/usr/sbin/iwgetid $(prefix)/release/usr/sbin/; \
		cp -dp $(targetprefix)/usr/sbin/iwlist $(prefix)/release/usr/sbin/; \
		cp -dp $(targetprefix)/usr/sbin/iwpriv $(prefix)/release/usr/sbin/; \
		cp -dp $(targetprefix)/usr/sbin/iwspy $(prefix)/release/usr/sbin/; \
		cp -dp $(targetprefix)/usr/sbin/wpa_cli $(prefix)/release/usr/sbin/; \
		cp -dp $(targetprefix)/usr/sbin/wpa_passphrase $(prefix)/release/usr/sbin/; \
		cp -dp $(targetprefix)/usr/sbin/wpa_supplicant $(prefix)/release/usr/sbin/; \
	fi

#
# alsa
#
	if [ -e $(targetprefix)/usr/share/alsa ]; then \
		mkdir -p $(prefix)/release/usr/share/alsa/; \
		cp -dp $(targetprefix)/usr/share/alsa/alsa.conf $(prefix)/release/usr/share/alsa/alsa.conf; \
	fi

#
# NFS-UTILS
#
	if [ -e $(targetprefix)/usr/sbin/rpc.nfsd ]; then \
		cp -f $(targetprefix)/etc/exports $(prefix)/release/etc/; \
		cp -f $(targetprefix)/etc/init.d/nfs-common $(prefix)/release/etc/init.d/; \
		cp -f $(targetprefix)/etc/init.d/nfs-kernel-server $(prefix)/release/etc/init.d/; \
		cp -f $(targetprefix)/usr/sbin/exportfs $(prefix)/release/usr/sbin/; \
		cp -f $(targetprefix)/usr/sbin/rpc.nfsd $(prefix)/release/usr/sbin/; \
		cp -f $(targetprefix)/usr/sbin/rpc.mountd $(prefix)/release/usr/sbin/; \
		cp -f $(targetprefix)/usr/sbin/rpc.statd $(prefix)/release/usr/sbin/; \
	fi

#
# AUTOFS
#
	if [ -d $(prefix)/release/usr/lib/autofs ]; then \
		cp -f $(targetprefix)/usr/sbin/automount $(prefix)/release/usr/sbin/; \
		cp -f $(buildprefix)/root/etc/auto.hotplug $(prefix)/release/etc/; \
		cp -f $(buildprefix)/root/etc/auto.network $(prefix)/release/etc/; \
		cp -f $(buildprefix)/root/etc/init.d/autofs $(prefix)/release/etc/init.d/; \
		ln -s /usr/sbin/automount $(prefix)/release/sbin/automount; \
	fi

#
# GSTREAMER
#
if ENABLE_MEDIAFWGSTREAMER
	if [ -d $(prefix)/release/usr/lib/gstreamer-1.0 ]; then \
		rm -rf $(prefix)/release/usr/lib/gstreamer-1.0/*; \
		cp -a $(targetprefix)/usr/bin/gst-* $(prefix)/release/usr/bin/; \
		sh4-linux-strip --strip-unneeded $(prefix)/release/usr/bin/gst-launch*; \
		cp -a $(targetprefix)/usr/lib/gstreamer-1.0/libgst*.so $(prefix)/release/usr/lib/gstreamer-1.0/; \
		sh4-linux-strip --strip-unneeded $(prefix)/release/usr/lib/gstreamer-1.0/*; \
	fi
endif

#
# GRAPHLCD
#
	if [ -e $(prefix)/release/usr/lib/libglcddrivers.so ]; then \
		cp -f $(targetprefix)/etc/graphlcd.conf $(prefix)/release/etc/graphlcd.conf; \
		rm -f $(prefix)/release/usr/lib/libglcdskin.so*; \
	fi

#
# minidlna
#
	if [ -e $(targetprefix)/usr/sbin/minidlnad ]; then \
		cp -f $(targetprefix)/usr/sbin/minidlnad $(prefix)/release/usr/sbin/; \
	fi

#
# DIRECTFB
#
	if [ -d $(prefix)/release/usr/lib/directfb-1.4-5 ]; then \
		rm -rf $(prefix)/release/usr/lib/directfb-1.4-5/gfxdrivers/*.{a,o,la}; \
		rm -rf $(prefix)/release/usr/lib/directfb-1.4-5/inputdrivers/*; \
		cp -a $(targetprefix)/usr/lib/directfb-1.4-5/inputdrivers/libdirectfb_enigma2remote.so $(prefix)/release/usr/lib/directfb-1.4-5/inputdrivers/; \
		cp -a $(targetprefix)/usr/lib/directfb-1.4-5/inputdrivers/libdirectfb_linux_input.so $(prefix)/release/usr/lib/directfb-1.4-5/inputdrivers/; \
		rm -rf $(prefix)/release/usr/lib/directfb-1.4-5/systems/*.{a,o,la}; \
		rm -rf $(prefix)/release/usr/lib/directfb-1.4-5/systems/libdirectfb_dummy.so; \
		rm -rf $(prefix)/release/usr/lib/directfb-1.4-5/systems/libdirectfb_fbdev.so; \
		rm -rf $(prefix)/release/usr/lib/directfb-1.4-5/wm/*.{a,o,la}; \
		rm -rf $(prefix)/release/usr/lib/directfb-1.4-5/interfaces/IDirectFBFont/*.{a,o,la}; \
		rm -rf $(prefix)/release/usr/lib/directfb-1.4-5/interfaces/IDirectFBImageProvider/*.{a,o,la}; \
		rm -rf $(prefix)/release/usr/lib/directfb-1.4-5/interfaces/IDirectFBVideoProvider/*.{a,o,la}; \
	fi
	if [ -d $(prefix)/release/usr/lib/icu ]; then \
		rm -rf $(prefix)/release/usr/lib/icu; \
	fi
	if [ -d $(prefix)/release/usr/lib/glib-2.0 ]; then \
		rm -rf $(prefix)/release/usr/lib/glib-2.0; \
	fi
	if [ -d $(prefix)/release/usr/lib/enchant ]; then \
		rm -rf $(prefix)/release/usr/lib/enchant; \
	fi

#
# udpxy
#
	if [ -e $(targetprefix)/usr/bin/udpxy ]; then \
		cp -f $(targetprefix)/usr/bin/udpxy $(prefix)/release/usr/bin; \
		cp -a $(targetprefix)/usr/bin/udpxrec $(prefix)/release/usr/bin; \
	fi

#
# xupnpd
#
	if [ -e $(targetprefix)/usr/bin/xupnpd ]; then \
		cp -f $(targetprefix)/usr/bin/xupnpd $(prefix)/release/usr/bin; \
		cp -aR $(targetprefix)/usr/share/xupnpd $(prefix)/release/usr/share; \
		mkdir -p $(prefix)/release/usr/share/xupnpd/playlists; \
	fi

#
# lua
#
	if [ -d $(targetprefix)/usr/share/lua ]; then \
		cp -aR $(targetprefix)/usr/share/lua $(prefix)/release/usr/share; \
	fi

#
# shairport
#
	if [ -e $(targetprefix)/usr/bin/shairport ]; then \
		cp -f $(targetprefix)/usr/bin/shairport $(prefix)/release/usr/bin; \
		cp -f $(targetprefix)/usr/bin/mDNSPublish $(prefix)/release/usr/bin; \
		cp -f $(targetprefix)/usr/bin/mDNSResponder $(prefix)/release/usr/bin; \
		cp -f $(buildprefix)/root/etc/init.d/shairport $(prefix)/release/etc/init.d/shairport; \
		chmod 755 $(prefix)/release/etc/init.d/shairport; \
		cp -f $(targetprefix)/usr/lib/libhowl.so* $(prefix)/release/usr/lib; \
		cp -f $(targetprefix)/usr/lib/libmDNSResponder.so* $(prefix)/release/usr/lib; \
	fi

#
# Neutrino HD2 Workaround Build in Player
#
	if [ -e $(targetprefix)/usr/local/bin/eplayer3 ]; then \
		cp -f $(targetprefix)/usr/local/bin/eplayer3 $(prefix)/release/bin/; \
		cp -f $(targetprefix)/usr/local/bin/meta $(prefix)/release/bin/; \
	fi

#
# delete unnecessary files
#
	rm -f $(prefix)/release/lib/*.{a,o,la}
	rm -rf $(prefix)/release/usr/lib/{engines,enigma2,gconv,libxslt-plugins,pkgconfig,python$(PYTHON_VERSION),sigc++-2.0}
	rm -f $(prefix)/release/usr/lib/*.{a,o,la}
	rm -f $(prefix)/release/usr/lib/lua/5.2/*.la
	rm -rf $(prefix)/release/lib/autofs
	rm -f $(prefix)/release/lib/libSegFault*
	rm -f $(prefix)/release/lib/libthread_db*
	rm -f $(prefix)/release/lib/libanl*
	rm -rf $(prefix)/release/usr/lib/m4-nofpu/
	rm -f $(prefix)/release/lib/modules/lzo*.ko
	rm -rf $(prefix)/release/lib/modules/$(KERNELVERSION)
	rm -rf $(prefix)/release/usr/lib/alsa-lib
	rm -rf $(prefix)/release/usr/lib/alsaplayer
	rm -rf $(prefix)/release/usr/lib/audit
	rm -rf $(prefix)/release/usr/lib/glib-2.0
#	rm -f $(prefix)/release/usr/lib/libexpat*
	rm -f $(prefix)/release/usr/lib/xml2Conf.sh
	rm -f $(prefix)/release/usr/lib/libfontconfig*
	rm -f $(prefix)/release/usr/lib/libtermcap*
	rm -f $(prefix)/release/usr/lib/libmenu*
	rm -f $(prefix)/release/usr/lib/libpanel*
#	rm -f $(prefix)/release/usr/lib/libdvdcss*
#	rm -f $(prefix)/release/usr/lib/libdvdnav*
#	rm -f $(prefix)/release/usr/lib/libdvdread*
	rm -f $(prefix)/release/usr/lib/libncurses*
	rm -f $(prefix)/release/usr/lib/libthread_db*
	rm -f $(prefix)/release/usr/lib/libanl*
	rm -f $(prefix)/release/usr/lib/libopkg*
	rm -f $(prefix)/release/bin/gitVCInfo
	rm -f $(prefix)/release/bin/libstb-hal-test
	rm -f $(prefix)/release/bin/wdctl

#
# The main target depends on the model.
# IMPORTANT: it is assumed that only one variable is set. Otherwise the target name won't be resolved.
#
$(D)/release_titan: \
$(D)/%release_titan: release_titan_base release_titan_$(TF7700)$(HL101)$(VIP1_V2)$(VIP2_V1)$(UFS910)$(UFS912)$(UFS913)$(UFS922)$(UFC960)$(SPARK)$(SPARK7162)$(OCTAGON1008)$(FORTIS_HDBOX)$(ATEVIO7500)$(HS7110)$(HS7810A)$(HS7119)$(HS7819)$(ATEMIO520)$(ATEMIO530)$(CUBEREVO)$(CUBEREVO_MINI)$(CUBEREVO_MINI2)$(CUBEREVO_MINI_FTA)$(CUBEREVO_250HD)$(CUBEREVO_2000HD)$(CUBEREVO_9500HD)$(ADB_BOX)$(VITAMIN_HD5000)$(SAGEMCOM88)
	touch $@

#
# FOR YOUR OWN CHANGES use these folder in cdk/own_build/titan
#
#	default for all receiver
	find $(buildprefix)/own_build/titan/ -mindepth 1 -maxdepth 1 -exec cp -at$(prefix)/release/ -- {} +
#	receiver specific (only if directory exist)
	[ -d "$(buildprefix)/own_build/titan.$(BOXTYPE)" ] && find $(buildprefix)/own_build/titan.$(BOXTYPE)/ -mindepth 1 -maxdepth 1 -exec cp -at$(prefix)/release/ -- {} + || true
	rm -f $(prefix)/release/for_your_own_changes

# nicht die feine Art, aber funktioniert ;)
	cp -dpfr $(prefix)/release/etc $(prefix)/release/var
	rm -fr $(prefix)/release/etc
	ln -sf /var/etc $(prefix)/release

	ln -s /tmp $(prefix)/release/lib/init
	ln -s /tmp $(prefix)/release/var/lib/urandom
	ln -s /tmp $(prefix)/release/var/lock
	ln -s /tmp $(prefix)/release/var/log
	ln -s /tmp $(prefix)/release/var/run
	ln -s /tmp $(prefix)/release/var/tmp



#
# sh4-linux-strip all
#
	find $(prefix)/release/ -name '*' -exec sh4-linux-strip --strip-unneeded {} &>/dev/null \;

#
# release-clean
#
release-titan-clean:
	rm -f $(D)/release_titan
