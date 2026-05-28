# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: graysky <graysky AT archlinux DOT us>

pkgname=profile-sync-daemon
pkgver=7.03
pkgrel=1
epoch=1
pkgdesc="Symlinks and syncs browser profile dirs to RAM"
arch=(any)
url="https://github.com/graysky2/profile-sync-daemon"
license=(MIT)
depends=(
  bash
  findutils
  fuse-overlayfs
  procps-ng
  rsync
)
optdepends=('zsh-completions: for completion when using zsh')
install=$pkgname.install
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
  0001-add-browsers.patch
  konform-browser
  waterfox
)
sha512sums=('df20c267831daf10c274520da25179c9e899bb4fb5aa54123ea96289e596fb03bd5fa77053ac55059c1d141e7b5a524d6b99a16e4e85e94483798d6f992c9cb6'
            'ad0a443a88bf0f55ff299eaeb39cfd9d37f4092c52b8b0ca31bc2b385a7ab6c0328a478fddebba4fe1025e5fa52fbd9e6bdc887a6425b4ed16ac90e97c652a73'
            '82057bf9f6e4d7841334447211cade5050c2a34bfb332f0b9e950da868295ce05d436f0fdce34790f6998e9b20ae499d25e9e394f72cbad42cf672bce724a2c5'
            '080f8ad85600f155537b246cffee22045219c88d1f0c7abeefbd20cf3a50d3b167418fdd1fd30ad0e6c331406ee779b6ba8c3a55e58763a9f4e226a18a44df94')
b2sums=('d1e46278785865c2f848f06a26f63197226c0d2381dcbf969acbfa3c0eb8edc721c31b6960689e73c6ac9c897fc52a9af3ec14d2edbbbdc0ca9b8376a308eded'
        '7dc5903022345269ef33b31feefe274026f3f958a7ecd78a8ee8a9bf1ea6dfcfa0f8fbde16fd793a76b01d442c3045c5a075e41c226080bb8767328746790791'
        'd3344f8d9aa66a113252d0fa98092598451e50865b1e7fc8721e6c72f29b7c6002d74d4d9c4a8e89e50f5c1d832090ec98eb1cf19db432fb368f8884955cee1d'
        '235344ec5648bbb73b3dcd574da89ac58a11c24a1c593383835b72cd07e8cf7074296f41199bebdb962a0f18c15f0dee1baf26cb0293f4f0508fec663d59723f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../0001-add-browsers.patch
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir" install-bin install-man -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  extra_browsers=(konform-browser waterfox)
  for browser in ${extra_browsers[@]}; do
    install -vDm 644 "${srcdir}/${browser}" "${pkgdir}/usr/share/psd/browsers/${browsers}"
  done
}
