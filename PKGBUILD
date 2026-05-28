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
  systemd
)
optdepends=('zsh-completions: for completion when using zsh')
install=$pkgname.install
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
  konform-browser
  0001-add-browser.patch
)
sha512sums=('df20c267831daf10c274520da25179c9e899bb4fb5aa54123ea96289e596fb03bd5fa77053ac55059c1d141e7b5a524d6b99a16e4e85e94483798d6f992c9cb6'
            '82057bf9f6e4d7841334447211cade5050c2a34bfb332f0b9e950da868295ce05d436f0fdce34790f6998e9b20ae499d25e9e394f72cbad42cf672bce724a2c5'
            '5a062417bf3dd44e776c1c11bbf48b51860e25f1c29f54db26b56c8e84c340583682d0cafe5d9b176b6ec263b1901aa867a7715725c7941743c1a5fe3c2991a1')
b2sums=('d1e46278785865c2f848f06a26f63197226c0d2381dcbf969acbfa3c0eb8edc721c31b6960689e73c6ac9c897fc52a9af3ec14d2edbbbdc0ca9b8376a308eded'
        'd3344f8d9aa66a113252d0fa98092598451e50865b1e7fc8721e6c72f29b7c6002d74d4d9c4a8e89e50f5c1d832090ec98eb1cf19db432fb368f8884955cee1d'
        '8648e14294f23cd363b8eb8dbbfc271602a148f5ea891ce8dd418e86edfd7978b4d8aecf156d97be0593debcb3277de9da83e8122b942ccec2e7f8a7b5eae416')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../0001-add-browser.patch
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 "${srcdir}/konform-browser" "${pkgdir}/usr/share/psd/browsers/konform-browser"
}
