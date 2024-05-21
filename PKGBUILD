# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=libvirt-dinit
pkgver=20211102
pkgrel=6
pkgdesc="dinit service scripts for libvirt"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('libvirt' 'dinit')
conflicts=('init-libvirt')
provides=('init-libvirt')
source=("libvirtd" "virtlockd" "virtlogd")
sha256sums=('1a1fae340198da0d79de5bb0021510665f19aace7a9dadeb9951526923c0f893'
            '15335dbbb61ae163cea27eac712f7716c7c95fdb1d69e6b4c11654859d0eb9a9'
            '78d6230d8de0899d1ba2278422dde77af4e3db9111836cfd390fca921ffe7f48')

package() {
    install -Dm644 libvirtd  "$pkgdir/etc/dinit.d/libvirtd"
    install -Dm644 virtlockd "$pkgdir/etc/dinit.d/virtlockd"
    install -Dm644 virtlogd  "$pkgdir/etc/dinit.d/virtlogd"
}
