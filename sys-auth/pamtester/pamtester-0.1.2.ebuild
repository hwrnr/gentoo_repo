EAPI=8

inherit autotools

DESCRIPTION="PAM tester"
HOMEPAGE="https://sourceforge.net/projects/pamtester/files/pamtester/"
SRC_URI="https://sourceforge.net/projects/pamtester/files/pamtester/${PV}/${P}.tar.gz/download -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="" # TODO: add dependencies
RDEPEND="${DEPEND}"
BDEPEND="" # TODO: add build dependencies

PATCHES=(
	"${FILESDIR}/remove_std_headers_check.patch"
)

S="${WORKDIR}/${P}"

