# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=git-dinit
pkgver=20230906
pkgrel=2
pkgdesc="dinit service scripts for git"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('git' 'dinit')
conflicts=('init-git')
provides=('init-git')
source=("git"
        "git-pre")
sha256sums=('1f57fd83f5678754e4b0c3bd38176fda3a0ee0726fbfcba1e445b27e4371a49b'
            '674a4fcf34c42f066168caa68bff02de0eb2826297c02e1e319dd028e90bf486')

package() {
    install -Dm644 git     "$pkgdir/etc/dinit.d/git"
    install -Dm644 git-pre "$pkgdir/etc/dinit.d/git-pre"
}
