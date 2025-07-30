# Maintainer: Cory Sanin <corysanin@artixlinux.org>

pkgname=artix-mlg
pkgver=0.2.3
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
sha512sums=('75f05af06f70f81aab93e09e6ed9a0bfbd673f9f983b243dcf9dd9bbcdfceac422088619ae5e3d82109102118e2f198e6ec8a0152b50ce01968235961baf4b5e')
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
