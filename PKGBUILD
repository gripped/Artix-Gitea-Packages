# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=earlyoom
pkgver=1.8.2
pkgrel=1
pkgdesc="Early OOM Daemon for Linux"
arch=('x86_64')
url="https://github.com/rfjakob/earlyoom"
license=('MIT')
depends=('glibc')
makedepends=('pandoc')
optdepends=('systembus-notify: desktop notifications')
backup=("etc/default/earlyoom")
source=("https://github.com/rfjakob/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('13869413dc0d973e454854077be7a2049d350f77a97f6911b654e88dc4b20346')

prepare() {
    cd "$pkgname-$pkgver"
    sed "/systemctl|chcon/d" -ri Makefile
    sed 's;^EARLYOOM_ARGS="(.*)";EARLYOOM_ARGS="\1 -n --avoid '\''(^|/)(init|systemd|Xorg|sshd)$'\''";' -ri earlyoom.default
}

build() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr VERSION=$pkgver earlyoom
}

package() {
    cd "$pkgname-$pkgver"
    # (Artix) Avoid installing service
    make install-default install-bin install-man  DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
