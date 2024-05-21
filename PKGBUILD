# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=dnscrypt-proxy-dinit
pkgver=20211025
pkgrel=4
pkgdesc="dinit service scripts for dnscrypt-proxy"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('dnscrypt-proxy' 'dinit')
groups=('dinit-world')
conflicts=('init-dnscrypt-proxy')
provides=('init-dnscrypt-proxy')
source=("dnscrypt-proxy")
sha256sums=('641230e11e495a65318c3575bc8d7dbb95934f304fa06dda2bc42bfc76cd85e1')

package() {
    install -Dm644 dnscrypt-proxy "$pkgdir/etc/dinit.d/dnscrypt-proxy"
}
