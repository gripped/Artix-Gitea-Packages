# Maintainer: artist for Artix Linux

pkgname=emptty
pkgdesc="Dead simple CLI Display Manager on TTY"
pkgver=0.15.0
pkgrel=1
arch=('x86_64')
url="https://github.com/tvrzna/emptty"
license=('MIT')
depends=('pam' 'libx11')
makedepends=('go' 'git')
backup=('etc/emptty/conf' 'etc/pam.d/emptty')
source=("${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install-all
  make DESTDIR="$pkgdir/" install-config
  for doc in 'README.md' 'SAMPLES.md' 'screenshot.png'; do
    install -Dm 644 "$doc" -t "$pkgdir/usr/share/doc/$pkgname"
  done
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

sha256sums=('fae7c04afeeb9ef3dcbb9bca67e9a2fa940e99a91872ebc0775e10253972c7f3')

