# Maintainer: Cory Sanin <corysanin@artixlinux.org>

pkgname=artix-metro
pkgver=3.1.2
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
sha512sums=('2e124ccea8a3df96c1bbce753382292622d91e6156ecc0ec868307a43f05aaa9a8217f6df0577096e5eaf453f9b6d5ef049e0157d62b62c903b4463210165c56')
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
