# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qt6-build
SRC_URI="https://github.com/qt/qtmqtt/archive/refs/tags/v${PV}.tar.gz"

DESCRIPTION="Standard compliant Qt implementation of the MQTT protocol"

if [[ ${QT6_BUILD_TYPE} == release ]]; then
	KEYWORDS="~amd64 ~arm ~arm64 ~riscv ~x86"
fi

IUSE="qml"

DEPEND="
	qml? ( =dev-qt/qtdeclarative-6.6.1* )
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}"

src_prepare() {
	qt_use_disable_mod qml quick \
		src/src.pro

	qt6-build_src_prepare
}

