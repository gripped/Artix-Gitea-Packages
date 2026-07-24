# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jkkyll Wu <adaptee at gmail [dot] com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Evine Deng <evinedeng@hotmail.com>

pkgbase=qbittorrent
pkgname=(qbittorrent
         qbittorrent-nox)
pkgver=5.2.3
pkgrel=3
arch=(x86_64)
url='https://www.qbittorrent.org'
license=(GPL-2.0-or-later
         GPL-3.0-or-later)
depends=(glibc
         libgcc
         libstdc++
         libtorrent-rasterbar
         openssl
         qt6-base
         zlib)
makedepends=(boost
             cmake
             git
             qt6-svg
             qt6-tools)
optdepends=('python: needed for torrent search tab')
source=(git+https://github.com/qbittorrent/qBittorrent/#tag=release-$pkgver)
sha256sums=('e3656e156f08645db67f4f9c2eaab6a7a094791d91e7559d983228edac10ab55')
validpgpkeys=('D8F3DA77AAC6741053599C136E4A2D025B7CC9A2') # sledgehammer999 <sledgehammer999@qbittorrent.org>

prepare() {
  cd qBittorrent
  git cherry-pick -n e154c1a811021ab0bd6e6f9595c2b3c6518aaea3 # Fix build with libtorrent 2.1
}

build() {
  cmake -B build -S qBittorrent \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build

  cmake -B build-nox -S qBittorrent \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGUI=OFF \
    -DSYSTEMD=OFF
  cmake --build build-nox
}

package_qbittorrent() {
  pkgdesc='An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar'
  depends+=(qt6-svg hicolor-icon-theme)

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 qBittorrent/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_qbittorrent-nox() {
  pkgdesc='An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar, w/o gui'

  DESTDIR="$pkgdir" cmake --install build-nox
  install -Dm644 qBittorrent/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
