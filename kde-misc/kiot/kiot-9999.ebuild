EAPI=8

inherit cmake

DESCRIPTION="Linux (KDE?) integration for Home Assistant via MQTT"
HOMEPAGE="https://github.com/davidedmundson/kiot"
SRC_URI="https://github.com/davidedmundson/kiot/archive/refs/heads/master.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-qt/qtbase:6
	dev-qt/qtmqtt:6[-qml]
	"

RDEPEND="
	${DEPEND}
	"

BDEPEND="
	${DEPEND}
	dev-build/cmake
	"

S="${WORKDIR}/${PN}-master"
