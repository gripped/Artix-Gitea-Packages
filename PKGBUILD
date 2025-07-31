# Maintainer: Cory Sanin <corysanin@artixlinux.org>

pkgname=artix-mlg
pkgver=0.2.5
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
sha512sums=('79c0179ac4c9db772d18d0e460fa3fa5620231fb586978c07b1dc9e5bbba5c43815370dd8cdd006d58dad245f728f43a130ddfe4402b233aec6591192f45dd28')
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
