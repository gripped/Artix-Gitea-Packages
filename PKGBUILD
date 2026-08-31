# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=4.0.0
pkgrel=1
pkgdesc="An award-winning free and open-source video editor"
arch=(any)
url="https://www.openshot.org/"
license=(GPL-3.0-only)
depends=(
  git
  ffmpeg
  hicolor-icon-theme
  libopenshot
  libopenshot-audio
  python
  python-pyqt6
  python-pyzmq
  python-requests
  qt6-base
  qt6-svg
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  xorg-server-xvfb
)
optdepends=(
  'faac: for exporting audio using AAC'
  'python-pyqt5-webengine: older, JavaScript based UI'
)
source=(
  "git+https://github.com/OpenShot/openshot-qt#tag=v${pkgver}"
  "$pkgname-2.6.1-no_metric_default.patch"
  "$pkgname-4.0.0-explicit-relative-qtapi.patch"
)
sha512sums=('c87755d61386c890b557debabbe9cc47801d9711958ada0a4d209424d6e79d6fded7c505df1f01eb17515a8663d2a86d7e0c8384e14d82d39a7129efb30d4fee'
            'd52441559897ce0de476a6120b7e36b082bbcb0722436a77c1a60456a86d02f370df6bc58384c838a3ad2df47c1603a6fabd5044c303284bac2ea75a99a76a8a'
            'e2357bd8fbdba9130997fad13b8fc595ee7638fb38b5cfa3c74e787509c80ebbae108d7bff6deae842e99378bc72400ba71343eaf065fb610d7ce8abea621178')

prepare() {
	cd "$pkgname-qt"
	# disable default metric collection with google analytics
	patch -Np1 -i ../"$pkgname-2.6.1-no_metric_default.patch"
	# fix launch
	patch -Np1 -i ../"$pkgname-4.0.0-explicit-relative-qtapi.patch"
}

build() {
	cd "$pkgname-qt"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname-qt"
	xvfb-run python3 -m unittest discover -s src/tests -t src/tests --quiet || true
}

package() {
	python -m installer --destdir="$pkgdir" "$pkgname-qt"/dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "$pkgname-qt"/{AUTHORS,CONTRIBUTING,README}.md
}
