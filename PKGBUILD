# Maintainer: Cory Sanin <corysanin@artixlinux.org>

pkgname=artix-metro
pkgver=3.0.0
pkgrel=1
pkgdesc="Artix package pushing automation tool"
arch=('any')
url="https://gitea.artixlinux.org/corysanin"
license=('MIT')
depends=(
    'nodejs'
    'artools-pkg'
    'artix-checkupdates'
)
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha512sums=('6658f2133f9b8f3df3842892a0c1af041cca31a6d893813331265bc89a859d2c50081d833b996d8f47039ac5efa89c8b4afd14cdfa2faae7ce8b7695da547d58')
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
