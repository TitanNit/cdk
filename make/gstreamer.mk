##############################   GSTREAMER + PLUGINS   #########################
#
# gstreamer
#
$(D)/gstreamer: $(D)/bootstrap $(D)/glib2 $(D)/libxml2_e2 $(D)/glibnetworking @DEPENDS_gstreamer@
	@PREPARE_gstreamer@
	cd @DIR_gstreamer@ && \
		$(CONFIGURE) \
			--prefix=/usr \
			--libexecdir=/usr/lib \
			--disable-gtk-doc \
			--disable-docbook \
			--disable-dependency-tracking \
			--disable-check \
			--disable-gst-debug \
			--disable-examples \
			--disable-tests \
			--disable-debug \
			--enable-introspection=no \
			ac_cv_func_register_printf_function=no \
		&& \
		$(MAKE) && \
		@INSTALL_gstreamer@
	@CLEANUP_gstreamer@
	touch $@

#
# gst_plugins_base
#
$(D)/gst_plugins_base: $(D)/bootstrap $(D)/glib2 $(D)/orc $(D)/gstreamer $(D)/libogg $(D)/libalsa @DEPENDS_gst_plugins_base@
	@PREPARE_gst_plugins_base@
	cd @DIR_gst_plugins_base@ && \
		$(CONFIGURE) \
			--prefix=/usr \
			--disable-freetypetest \
			--disable-libvisual \
			--disable-valgrind \
			--disable-debug \
			--disable-tests \
			--disable-examples \
			--disable-debug \
		&& \
		$(MAKE) && \
		@INSTALL_gst_plugins_base@
	@CLEANUP_gst_plugins_base@
	touch $@

#
# gst_plugins_good
#
$(D)/gst_plugins_good: $(D)/bootstrap $(D)/gstreamer $(D)/gst_plugins_base $(D)/libsoup $(D)/libflac @DEPENDS_gst_plugins_good@
	@PREPARE_gst_plugins_good@
	cd @DIR_gst_plugins_good@ && \
		$(CONFIGURE) \
			--prefix=/usr \
			--enable-oss \
			--enable-gst_v4l2 \
			--without-libv4l2 \
			--disable-examples \
			--disable-debug \
		&& \
		$(MAKE) && \
		@INSTALL_gst_plugins_good@
	@CLEANUP_gst_plugins_good@
	touch $@

#
# gst_plugins_bad
#
$(D)/gst_plugins_bad: $(D)/bootstrap $(D)/gstreamer $(D)/gst_plugins_base libmodplug @DEPENDS_gst_plugins_bad@
	@PREPARE_gst_plugins_bad@
	cd @DIR_gst_plugins_bad@ && \
		$(BUILDENV) \
		autoreconf --force --install && \
		./configure \
			--build=$(build) \
			--host=$(target) \
			--prefix=/usr \
			--disable-fatal-warnings \
			--enable-dvb \
			--enable-shm \
			--enable-fbdev \
			--enable-decklink \
			--enable-dts \
			--enable-mpegdemux \
			--disable-acm \
			--disable-android_media \
			--disable-apexsink \
			--disable-apple_media \
			--disable-avc \
			--disable-chromaprint \
			--disable-cocoa \
			--disable-daala \
			--disable-dc1394 \
			--disable-direct3d \
			--disable-directdraw \
			--disable-directsound \
			--disable-gme \
			--disable-gsettings \
			--disable-gsm \
			--disable-kate \
			--disable-ladspa \
			--disable-linsys \
			--disable-lv2 \
			--disable-mimic \
			--disable-mplex \
			--disable-musepack \
			--disable-mythtv \
			--disable-nas \
			--disable-ofa \
			--disable-openjpeg \
			--disable-opensles \
			--disable-pvr \
			--disable-quicktime \
			--disable-resindvd \
			--disable-sdl \
			--disable-sdltest \
			--disable-sndio \
			--disable-soundtouch \
			--disable-spandsp \
			--disable-spc \
			--disable-srtp \
			--disable-teletextdec \
			--disable-timidity \
			--disable-vcd \
			--disable-vdpau \
			--disable-voaacenc \
			--disable-voamrwbenc \
			--disable-wasapi \
			--disable-wildmidi \
			--disable-wininet \
			--disable-winscreencap \
			--disable-zbar \
			--disable-examples \
			--disable-debug \
			--enable-orc \
		&& \
		$(MAKE) && \
		@INSTALL_gst_plugins_bad@
	@CLEANUP_gst_plugins_bad@
	touch $@

#
# gst_plugins_ugly
#
$(D)/gst_plugins_ugly: $(D)/bootstrap $(D)/gstreamer $(D)/gst_plugins_base @DEPENDS_gst_plugins_ugly@
	@PREPARE_gst_plugins_ugly@
	cd @DIR_gst_plugins_ugly@ && \
		$(CONFIGURE) \
			--prefix=/usr \
			--disable-fatal-warnings \
			--disable-amrnb \
			--disable-amrwb \
			--disable-sidplay \
			--disable-twolame \
			--disable-debug \
			--enable-orc \
		&& \
		$(MAKE) && \
		@INSTALL_gst_plugins_ugly@
	@CLEANUP_gst_plugins_ugly@
	touch $@

#
# gst_libav
#
$(D)/gst_libav: $(D)/bootstrap $(D)/gstreamer $(D)/gst_plugins_base @DEPENDS_gst_libav@
	@PREPARE_gst_libav@
	cd @DIR_gst_libav@ && \
		$(CONFIGURE) \
			--prefix=/usr \
			--disable-fatal-warnings \
			\
			--with-libav-extra-configure=" \
			--enable-gpl \
			--enable-static \
			--enable-pic \
			--disable-protocols \
			--disable-devices \
			--disable-network \
			--disable-hwaccels \
			--disable-filters \
			--disable-doc \
			--enable-optimizations \
			--enable-cross-compile \
			--target-os=linux \
			--arch=sh4 \
			--cross-prefix=$(target)- \
			\
			--disable-muxers \
			--disable-encoders \
			--disable-decoders \
			--enable-decoder=ogg \
			--enable-decoder=vorbis \
			--enable-decoder=flac \
			\
			--disable-demuxers \
			--enable-demuxer=ogg \
			--enable-demuxer=vorbis \
			--enable-demuxer=flac \
			--enable-demuxer=mpegts \
			\
			--disable-debug \
			--disable-bsfs \
			--enable-pthreads \
			--enable-bzlib" \
		&& \
		$(MAKE) && \
		@INSTALL_gst_libav@
	@CLEANUP_gst_libav@
	touch $@

#
# gst_plugins_fluendo_mpegdemux
#
$(D)/gst_plugins_fluendo_mpegdemux: $(D)/bootstrap $(D)/gstreamer $(D)/gst_plugins_base @DEPENDS_gst_plugins_fluendo_mpegdemux@
	@PREPARE_gst_plugins_fluendo_mpegdemux@
	cd @DIR_gst_plugins_fluendo_mpegdemux@ && \
		$(CONFIGURE) \
			--prefix=/usr \
			--with-check=no \
		&& \
		$(MAKE) && \
		@INSTALL_gst_plugins_fluendo_mpegdemux@
	@CLEANUP_gst_plugins_fluendo_mpegdemux@
	touch $@

#
# gst_plugin_subsink
#
$(D)/gst_plugin_subsink: $(D)/bootstrap $(D)/gstreamer $(D)/gst_plugins_base $(D)/gst_plugins_good $(D)/gst_plugins_bad $(D)/gst_plugins_ugly @DEPENDS_gst_plugin_subsink@
	@PREPARE_gst_plugin_subsink@
	cd @DIR_gst_plugin_subsink@ && \
		aclocal --force -I m4 && \
		libtoolize --copy --ltdl --force && \
		autoconf --force && \
		autoheader --force && \
		automake --add-missing --copy --force-missing --foreign && \
		$(CONFIGURE) \
			--prefix=/usr \
		&& \
		$(MAKE) && \
		@INSTALL_gst_plugin_subsink@
	@CLEANUP_gst_plugin_subsink@
	touch $@

#
# gmediarender
#
$(D)/gst_gmediarender: $(D)/bootstrap $(D)/gst_plugins_dvbmediasink $(D)/libupnp @DEPENDS_gst_gmediarender@
	@PREPARE_gst_gmediarender@
	cd @DIR_gst_gmediarender@ && \
		$(CONFIGURE) \
			--prefix=/usr \
			--with-libupnp=$(targetprefix)/usr \
		&& \
		$(MAKE) all && \
		@INSTALL_gst_gmediarender@
	@CLEANUP_gst_gmediarender@
	touch $@

#
# gst_plugins_dvbmediasink
#
$(D)/gst_plugins_dvbmediasink: $(D)/bootstrap $(D)/gstreamer $(D)/gst_plugins_base $(D)/gst_plugins_good $(D)/gst_plugins_bad $(D)/gst_plugins_ugly $(D)/gst_plugin_subsink $(D)/libdca @DEPENDS_gst_plugins_dvbmediasink@
	@PREPARE_gst_plugins_dvbmediasink@
	[ -d "$(archivedir)/gst-plugins-dvbmediasink.git" ] && \
	(cd $(archivedir)/gst-plugins-dvbmediasink.git; git pull; cd "$(buildprefix)";); \
	cd @DIR_gst_plugins_dvbmediasink@ && \
		aclocal --force -I m4 && \
		libtoolize --copy --force && \
		autoconf --force && \
		autoheader --force && \
		automake --add-missing --copy --force-missing --foreign && \
		$(CONFIGURE) \
			--prefix=/usr \
			--with-wma \
			--with-wmv \
			--with-pcm \
			--with-eac3 \
			--with-dtsdownmix \
			--with-mpeg4v2 \
			--with-gstversion=1.0 \
		&& \
		$(MAKE) && \
		@INSTALL_gst_plugins_dvbmediasink@
	@CLEANUP_gst_plugins_dvbmediasink@
	touch $@
