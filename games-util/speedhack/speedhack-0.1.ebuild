# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# NOTE: The comments in this file are for instruction and documentation.
# They're not meant to appear with your final, production ebuild.  Please
# remember to remove them before submitting or committing your ebuild.  That
# doesn't mean you can't add your own comments though.

# The EAPI variable tells the ebuild format in use.
# It is suggested that you use the latest EAPI approved by the Council.
# The PMS contains specifications for all EAPIs. Eclasses will test for this
# variable if they need to use features that are not universal in all EAPIs.
# If an eclass doesn't support latest EAPI, use the previous EAPI instead.
EAPI=7


# inherit lists eclasses to inherit functions from. For example, an ebuild
# that needs the eautoreconf function from autotools.eclass won't work
# without the following line:
#inherit autotools
#
# Eclasses tend to list descriptions of how to use their functions properly.
# Take a look at the eclass/ directory for more examples.

# Short one-line description of this package.
DESCRIPTION="A simple dynamic library to slowdown or speedup games on Linux "

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE="https://github.com/evg-zhabotinsky/libspeedhack"

# Point to any required sources; these will be automatically downloaded by
# Portage.
SRC_URI="https://github.com/evg-zhabotinsky/libspeedhack/archive/refs/tags/0.1-x86-multilib.tar.gz"

# Source directory; the dir where the sources can be found (automatically
# unpacked) inside ${WORKDIR}.  The default value for S is ${WORKDIR}/${P}
# If you don't need to change it, leave the S= line out of the ebuild
# to keep it tidy.
#S="${WORKDIR}/${P}"
S="${WORKDIR}/libspeedhack-0.1-x86-multilib"


# License of the package.  This must match the name of file(s) in the
# licenses/ directory.  For complex license combination see the developer
# docs on gentoo.org for details.
LICENSE="MIT"

# The SLOT variable is used to tell Portage if it's OK to keep multiple
# versions of the same package installed at the same time.  For example,
# if we have a libfoo-1.2.2 and libfoo-1.3.2 (which is not compatible
# with 1.2.2), it would be optimal to instruct Portage to not remove
# libfoo-1.2.2 if we decide to upgrade to libfoo-1.3.2.  To do this,
# we specify SLOT="1.2" in libfoo-1.2.2 and SLOT="1.3" in libfoo-1.3.2.
# emerge clean understands SLOTs, and will keep the most recent version
# of each SLOT and remove everything else.
# Note that normal applications should use SLOT="0" if possible, since
# there should only be exactly one version installed at a time.
# Do not use SLOT="", because the SLOT variable must not be empty.
SLOT="0"

# Using KEYWORDS, we can record masking information *inside* an ebuild
# instead of relying on an external package.mask file.  Right now, you
# should set the KEYWORDS variable for every ebuild so that it contains
# the names of all the architectures with which the ebuild works.
# All of the official architectures can be found in the arch.list file
# which is in the profiles/ directory.  Usually you should just set this
# to "~amd64".  The ~ in front of the architecture indicates that the
# package is new and should be considered unstable until testing proves
# its stability.  So, if you've confirmed that your ebuild works on
# amd64 and ppc, you'd specify:
# KEYWORDS="~amd64 ~ppc"
# Once packages go stable, the ~ prefix is removed.
# For binary packages, use -* and then list the archs the bin package
# exists for.  If the package was for an x86 binary package, then
# KEYWORDS would be set like this: KEYWORDS="-* x86"
# Do not use KEYWORDS="*"; this is not valid in an ebuild context.
KEYWORDS="~amd64"

# Comprehensive list of any and all USE flags leveraged in the ebuild,
# with some exceptions, e.g., ARCH specific flags like "amd64" or "ppc".
# Not needed if the ebuild doesn't use any USE flags.
IUSE=""


src_configure() {
	# Don't do anything here, as this package doesn't use configure
	echo "Configuring..."
}

# The following src_compile function is implemented as default by portage, so
# you only need to call it, if you need different behaviour.
src_compile() {
	# emake is a script that calls the standard GNU make with parallel
	# building options for speedier builds (especially on SMP systems).
	# Try emake first.  It might not work for some packages, because
	# some makefiles have bugs related to parallelism, in these cases,
	# use emake -j1 to limit make to a single process.  The -j1 is a
	# visual clue to others that the makefiles have bugs that have been
	# worked around.

	emake multilib
}

# The following src_install function is implemented as default by portage, so
# you only need to call it, if you need different behaviour.
src_install() {
	# You must *personally verify* that this trick doesn't install
	# anything outside of DESTDIR; do this by reading and
	# understanding the install part of the Makefiles.
	# This is the preferred way to install.
	#emake DESTDIR="${D}" install
	mkdir -p "${D}/usr/lib64" || die
	mkdir -p "${D}/usr/lib" || die
	mkdir -p "${D}/usr/bin" || die
	ls -la ${D}/usr
	mv ${S}/lib64/libspeedhack.so "${D}/usr/lib64/" || die
	mv ${S}/lib32/libspeedhack.so "${D}/usr/lib/" || die
	mv ${S}/speedhack "${D}/usr/bin/" || die
}
