# Maintainer: capezotte <capezotte@artixlinux.org>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=4.0.1
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
  python-pyqt6
  python-pyzmq
  python-requests
  python-certifi
  python-defusedxml
  python-distro
  python-numpy
  python-opengl
  python-pillow
  qt6-base
  qt6-svg
  qt6-scxml
)
makedepends=(
  git
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
)
sha512sums=('ba1ca859a591bb075b670943711e2c2347df503c43bb16b227b02a1ae5b6a94d101bef1d9ed6367c3754a12e1e3a4651cc8905e0b99691f712d511efeefd0f27'
            'd52441559897ce0de476a6120b7e36b082bbcb0722436a77c1a60456a86d02f370df6bc58384c838a3ad2df47c1603a6fabd5044c303284bac2ea75a99a76a8a')

prepare() {
	cd "$pkgname-qt"
	# disable default metric collection with google analytics
	patch -Np1 -i ../"$pkgname-2.6.1-no_metric_default.patch"
	# fix launch
	sed -i 's/from qt_api/from .qt_api/' src/launch.py
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
