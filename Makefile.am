## Makefile for Tuxbox

# Set up the build environment
include make/buildenv.mk

# Include yaud targets
include make/yaud.mk

# Include linux kernel targets
include make/linux-kernel.mk

# Include bootstrap targets
include make/bootstrap.mk

# Target for building and install own independ ccache for tuxbox-cdk
include make/ccache.mk

# Include Archive targets
include make/archive-specs.mk

# Include Driver targets
include make/driver.mk

# Include Tools targets
include make/tools.mk

# Include host apps targets
include make/hostapps.mk

# Include u-boot targets
include make/u-boot.mk

# Include adapted etc files and etc read-write files
include make/root-etc.mk

# Include busybox targets
include make/busybox.mk

# Include contrib lib targets
include make/contrib-libs.mk
include make/python.mk
include make/gstreamer.mk

# Include contrib apps
include make/contrib-apps.mk

# Include net apps
include make/net-apps.mk

# Include enigma2 plugins targets
include make/enigma2-plugins.mk

# Include enigma2-pli-nightly gui targets
include make/enigma2-pli-nightly.mk

# Include neutrino gui targets
include make/neutrino.mk

# Include neutrino-plugins targets
include make/neutrino-plugins.mk

# Include tvheadend targets
include make/tvheadend.mk

# Include titan targets
include make/titan.mk

# A number of cleaning targets
include make/cleantargets.mk

# Create the TAGS file
include make/tags.mk

# Target for building source distributions (hardly used these days of CVS :-)
include make/disttargets.mk

#Trick
include make/enigma2-release.mk

include make/neutrino-release.mk

include make/tvheadend-release.mk

include make/titan-release.mk

#keeping all patches in one file
include make/patches.mk

# Give the user rope to hang himself :-).  (Note: read from the
# generated Makefile during make run, automake or configure does not
# see it.)
-include ./Makefile.local

# this makes sure we do not build top-level dependencies in parallel
# (which would not be too helpful anyway, running many configure and
# downloads in parallel...), but the sub-targets are still built in
# parallel, which is useful on multi-processor / multi-core machines
.NOTPARALLEL:
