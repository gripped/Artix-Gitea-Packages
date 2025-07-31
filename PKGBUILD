# Maintainer: Cory Sanin <corysanin@artixlinux.org>

pkgname=artix-mlg
pkgver=0.2.4
pkgrel=1
pkgdesc="Artix mirrorlist generator"
arch=('any')
url="https://gitea.artixlinux.org/corysanin/artix-mlg"
license=('MIT')
depends=(
    'nodejs'
)
makedepends=(
    'npm'
)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha512sums=('b38567ad430049b62b7630a0bffe40ae6ee7f978183d751a887292a9bfd99efbed35ef25c9b43aefd2475d1041779ce9fc844236484983b208c0bf1e85e587d0')
options=("!strip")

package() {
    npm install -g --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    chmod -R u=rwX,go=rX "$pkgdir"

    # npm installs package.json owned by build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"

    install -d "$pkgdir"/usr/share/licenses/$pkgname
    ln -s /usr/lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

}
