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
  0002-desystemd.patch
  firefox-esr
  konform-browser
  waterfox
)
sha512sums=('df20c267831daf10c274520da25179c9e899bb4fb5aa54123ea96289e596fb03bd5fa77053ac55059c1d141e7b5a524d6b99a16e4e85e94483798d6f992c9cb6'
            '93fd25a6b32ceb604c4d4ce09928d9cfba2e367f9335ed3c13b49c329e7acf6450bdda9c6d827bdf797b377c20fe2001032fd6cdd4a67b7914c5b6877699e35b'
            '16603351bf8cab228ef05f91798b924fcd043a1103f56a2e1f39ac30323526498b444a04cf8bba72a3d61e01d7c9f428dac97e1bd30f2c650c5fd4b75ca21440'
            '2b7eb07cf708260c57ee4254d47bcbe3835ce37b85df2a62c9ebe5104db2ef420b476dd9338636e08e3da88918d08a0d68f3942188e74938809a969929b8d135'
            '82057bf9f6e4d7841334447211cade5050c2a34bfb332f0b9e950da868295ce05d436f0fdce34790f6998e9b20ae499d25e9e394f72cbad42cf672bce724a2c5'
            '080f8ad85600f155537b246cffee22045219c88d1f0c7abeefbd20cf3a50d3b167418fdd1fd30ad0e6c331406ee779b6ba8c3a55e58763a9f4e226a18a44df94')
b2sums=('d1e46278785865c2f848f06a26f63197226c0d2381dcbf969acbfa3c0eb8edc721c31b6960689e73c6ac9c897fc52a9af3ec14d2edbbbdc0ca9b8376a308eded'
        '97e71da5b9a803ea2e273a937d257a57b40362c3c54dd2d973fa1cec514a4d2ebea0d5b54e8c4df85a01aa9bcf4f3935a31f6a3e6fdc1e910e5dc8a368967bd0'
        '5782b96b6000ee12ab0798bc5746779dfc4d8a22ad1fe040fec46c19489b348a3fe27f3ed6ef3237ae23c115cd342578150378ce2c8119489743d0df9ea923a9'
        '6fb5958f9984a73b78c5d0cf8929d6b5a5572b1801b44fab019d25bb3363fe4632a8a178b905ce7f64f940cab36c47980f7a9ccd165a05a488ba80474dcbb701'
        'd3344f8d9aa66a113252d0fa98092598451e50865b1e7fc8721e6c72f29b7c6002d74d4d9c4a8e89e50f5c1d832090ec98eb1cf19db432fb368f8884955cee1d'
        '235344ec5648bbb73b3dcd574da89ac58a11c24a1c593383835b72cd07e8cf7074296f41199bebdb962a0f18c15f0dee1baf26cb0293f4f0508fec663d59723f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../0001-add-browsers.patch
  patch -p1 < ../0002-desystemd.patch
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir" install-bin install-man -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  extra_browsers=(firefox-esr konform-browser waterfox)
  for browser in ${extra_browsers[@]}; do
    install -vDm 644 "${srcdir}/${browser}" "${pkgdir}/usr/share/psd/browsers/${browsers}"
  done
}
