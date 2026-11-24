# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=marked
pkgver=18.0.8
pkgrel=1
pkgdesc="A markdown parser built for speed"
arch=('any')
url='https://marked.js.org'
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
source=("git+https://github.com/markedjs/marked.git#tag=v$pkgver")
sha512sums=('13473b820190f7d1483db792c42d3a43370ccb9f3bce0f8776207a6f2f8bd2eba5998d857eced935ce99ce22a1a7e2916adf143f193e92bcb6500152b0eda42e')

prepare() {
  cd marked
  # npm 12 blocks the GitHub archive required by @markedjs/testutils by default.
  # https://github.com/markedjs/marked/pull/4174
  npm ci --allow-remote=all
}

build() {
  cd marked
  npm run build
}

check() {
  cd marked
  npm test
}

package() {
  cd marked
  # attw -P deletes its tarball during check(), so pack after testing.
  npm pack
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/marked/$pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/marked/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
