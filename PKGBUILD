# Maintainer: Cory Sanin <corysanin@artixlinux.org>

pkgname=artix-metro
pkgver=3.1.14
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
sha512sums=('47da68678520b7844eb7d4f4bd850ee20a26bec86ee3e67b1abed5375e77de8a8364857c46256e6b1e162d5a19325510bf22dbb487074faa5c2032bcd69db492')
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
