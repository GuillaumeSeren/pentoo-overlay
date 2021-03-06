# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Adds read support for Excel files (xls and xlsx) to agate"
HOMEPAGE="https://agate-excel.readthedocs.io/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="~amd64 ~arm64 ~mips ~x86"
LICENSE="MIT"
SLOT=0
IUSE=""

RDEPEND="${PYTHON_DEPS}
	dev-python/agate[${PYTHON_USEDEP}]
	dev-python/xlrd[${PYTHON_USEDEP}]
	dev-python/openpyxl[${PYTHON_USEDEP}]"
