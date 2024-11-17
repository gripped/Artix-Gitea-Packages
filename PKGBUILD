# Maintainer: artist for Artix Linux

pkgname=lxqt-wayland-session
pkgver=0.1.0
pkgrel=2.2
pkgdesc='LXQt Wayland Session support'
arch=('x86_64')
url="https://github.com/lxqt/${pkgname}"
license=('LGPL-2.1')
depends=(
  'wayland-compositor'
  'lxqt-session'
  'qtxdg-tools'
  'layer-shell-qt'
)
makedepends=('cmake' 'lxqt-build-tools')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")

build() {
  cmake -B build -S "${srcdir}/${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 $pkgname-$pkgver/LICENSE.* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('c30f93b7cea82be9ff3105a0c217645172e878170a5e0e8a8e348bb1789138b9')

