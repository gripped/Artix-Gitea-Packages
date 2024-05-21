# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=dovecot-dinit
pkgver=20230906
pkgrel=2
pkgdesc="dinit service scripts for dovecot"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('dovecot' 'dinit')
conflicts=('init-dovecot')
provides=('init-dovecot')
source=("dovecot" "dovecot-pre")
sha256sums=('cb2cb33d179a93bc1b6ad9b55b9d8e8f1870f0963efee175723ee52486124b82'
            '4abe52e16cf5df19b8ae9db718e3967ecd54796ca4dad8813e2814fe296c1115')

package() {
    install -Dm644 dovecot     "$pkgdir/etc/dinit.d/dovecot"
    install -Dm644 dovecot-pre "$pkgdir/etc/dinit.d/dovecot-pre"
}
