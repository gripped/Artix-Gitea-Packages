# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=python-pyotp
_pkgname=pyotp
pkgver=2.12.0
pkgrel=1
pkgdesc='Python library for generating and verifying one-time passwords'
url='https://pyotp.readthedocs.io/'
arch=(any)
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-hatch-vcs
  python-sphinx
  python-guzzle-sphinx-theme
  python-sphinxext-opengraph
)
options=(!makeflags)
source=("git+https://github.com/pyotp/pyotp#tag=v$pkgver")
sha512sums=('9e3a2afc76a83b0fa93679a203c9ed6d122152a635eff71f160dccea04dd0c140243f72d24901bf2cda9c7f1958f63ae1431d157c9325eeb21a5ecf35608e2e8')
b2sums=('3f1accfe2ff911ee60469199f1ccfdbccbfa64109023b9c89756f395aee69e312dca0b8ac9fc015c7c304720700dd3c3564c9a455309371935db54af84c97508')

build() {
  cd ${_pkgname}
  python -m build --wheel --skip-dependency-check --no-isolation
  sphinx-build -b text docs docs/_build/text
  sphinx-build -b man docs docs/_build/man
}

check() {
  cd ${_pkgname}
  python -m unittest -v
}

package() {
  cd ${_pkgname}
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # documentation
  install -Dm 644 README.rst ./docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"

  # man page
  install -Dm 644 ./docs/_build/man/${_pkgname}.1 -t "${pkgdir}/usr/share/man/man1"
  ln -s /usr/share/man/man1/${_pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et:
