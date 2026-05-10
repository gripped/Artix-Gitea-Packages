# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=3.5.1
pkgrel=1
pkgdesc="An award-winning free and open-source video editor"
arch=(any)
url="https://www.openshot.org/"
license=(GPL-3.0-only)
depends=(
  ffmpeg
  hicolor-icon-theme
  libopenshot
  libopenshot-audio
  python
  python-pyqt5
  python-pyzmq
  python-requests
  qt5-base
  qt5-svg
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
  https://github.com/OpenShot/openshot-qt/archive/v$pkgver/$pkgname-$pkgver.tar.gz
  $pkgname-2.6.1-no_metric_default.patch
)
sha512sums=('c7dbb408ede0f688abb1e59cc49e46f371bddba193b3c4d6c8e5f2ca76f58b7ab5646d482c080198a80068d04863af8c90b2bb39569afe90a4380afe3b0fecf8'
            'd52441559897ce0de476a6120b7e36b082bbcb0722436a77c1a60456a86d02f370df6bc58384c838a3ad2df47c1603a6fabd5044c303284bac2ea75a99a76a8a')

prepare() {
	cd $pkgname-qt-$pkgver
	# disable default metric collection with google analytics
	patch -Np1 -i ../$pkgname-2.6.1-no_metric_default.patch
}

build() {
	cd $pkgname-qt-$pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd $pkgname-qt-$pkgver
	xvfb-run python3 -m unittest discover -s src/tests -t src/tests --quiet || true
}

package() {
	python -m installer --destdir="$pkgdir" $pkgname-qt-$pkgver/dist/*.whl
	cd $pkgname-qt-$pkgver
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/"  {AUTHORS,CONTRIBUTING,README}.md
}
