# Maintainer: Cory Sanin <corysanin@artixlinux.org>

pkgname=artix-mlg
pkgver=0.2.10
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
sha512sums=('16926f0d55ddd670fc5ec887b00e2bda429c3c5b5acd97e8e3252d9fd620b428d90518c2ea241de17029bc7a4b7b0b75fd8a8763f9bb30110bd270da4a56f069')
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
