EAPI=8

inherit desktop xdg-utils

DESCRIPTION="NoSQLBooster is a cross-platform GUI tool for MongoDB Server"
HOMEPAGE=""
SRC_URI="https://s3.nosqlbooster.com/download/releasesv10/${P}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

S="${WORKDIR}/${P}"

src_install() {
    insinto /opt/${PN}
    doins -r ./*

    fperms +x /opt/${PN}/nosqlbooster4mongo

    dosym ../../opt/${PN}/nosqlbooster4mongo /usr/bin/nosqlbooster

	doicon "${FILESDIR}/icon.png"
    make_desktop_entry nosqlbooster "NoSQLBooster for MongoDB" icon "Development;Database;"
}

pkg_postinst() {
    xdg_desktop_database_update
    xdg_icon_cache_update
}

pkg_postrm() {
    xdg_desktop_database_update
    xdg_icon_cache_update
}
