# Maintainer: Cory Sanin <corysanin@artixlinux.org>

pkgname=artix-mlg
pkgver=0.2.6
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
sha512sums=('ddf52fd8b872a9896804a963b47dcc7a3ab1806d032d496c2376500a1a40e46f0052fdc45932fe8288181fcc7dee5ed243a478af2093785d7bd00a189a6c4c6c')
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
