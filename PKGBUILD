# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=git-dinit
pkgver=20230906
pkgrel=1
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
sha256sums=('c35fb6276b9cfdc8099b57dc13ea3eefab93cba8358ce338d7669acebdf62712'
            '2fc6e95f08118a493aae6fa6012211828bf1587f503a95294760f9bb96f29c5c')

package() {
    install -Dm644 git     "$pkgdir/etc/dinit.d/git"
    install -Dm644 git-pre "$pkgdir/etc/dinit.d/git-pre"
}
