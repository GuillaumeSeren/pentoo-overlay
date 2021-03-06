# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{4,5,6}} )
inherit python-r1 python-utils-r1

COMMIT_HASH="69fdd12708f5d44c416428e2fe369c1d596df1cd"

DESCRIPTION="Enumerate subdomains of websites using OSINT"
HOMEPAGE="https://github.com/aboul3la/Sublist3r"
SRC_URI="https://github.com/aboul3la/Sublist3r/archive/${COMMIT_HASH}.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/argparse[${PYTHON_USEDEP}]
	dev-python/dnspython[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

S="${WORKDIR}/Sublist3r-${COMMIT_HASH}"

src_prepare() {
	#make it a module
	sed -e 's|from subbrute|from sublist3r.subbrute|' -i sublist3r.py || die "sed failed"
	touch __init__.py
	default
}

src_install() {
	python_moduleinto ${PN}
	python_foreach_impl python_domodule subbrute __init__.py
	newbin sublist3r.py sublist3r
	dodoc README.md
}
