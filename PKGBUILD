# Maintainer: Cory Sanin <corysanin@artixlinux.org>

pkgname=artix-metro
pkgver=3.1.7
pkgrel=1
pkgdesc="Artix package pushing automation tool"
arch=('any')
url="https://gitea.artixlinux.org/corysanin/artix-metro"
license=('MIT')
depends=(
    'nodejs'
    'artools-pkg'
    'artix-checkupdates'
)
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha512sums=('47a41ce5349a51ec4eabe774646dca126c246f857a95b6684a9585c2485a36a424095befca649492947fc8f8a06ed4bc0cbf7a29de6ecc9ab61fd2573f84455e')
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

    # install completions
    install -Dm644 "$pkgdir"/usr/lib/node_modules/artix-metro/completion/bash \
        "$pkgdir"/usr/share/bash-completion/completions/artix-metro
    install -Dm644 "$pkgdir"/usr/lib/node_modules/artix-metro/completion/zsh \
        "$pkgdir"/usr/share/zsh/site-functions/_artix-metro

}
