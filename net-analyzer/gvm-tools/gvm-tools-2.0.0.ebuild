# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6} )
inherit distutils-r1

DESCRIPTION="Remote control for Greenbone Vulnerability Manager, previously named openvas-cli"
HOMEPAGE="https://www.greenbone.net/en/"
SRC_URI="https://github.com/greenbone/gvm-tools/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/python-gvm[${PYTHON_USEDEP}]
	!net-analyzer/openvas-cli"

DEPEND="
	${RDEPEND}"

src_prepare() {
	distutils-r1_python_prepare_all
	# Exlude tests & correct FHS/Gentoo policy paths
	sed -i "s/packages=find_packages(),.*/packages=find_packages(exclude=['tests*', 'docs']),/" "$S"/setup.py || die
	sed -i -e "s*''*'/usr/share/doc/${P}'*g" "$S"/setup.py || die
}
