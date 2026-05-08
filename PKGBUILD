# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=ntpd-rs
pkgver=1.7.2
pkgrel=1.1
pkgdesc="Full-featured implementation of NTP with NTS support"
arch=(x86_64)
url="https://docs.ntpd-rs.pendulum-project.org"
_url="https://github.com/pendulum-project/ntpd-rs"
license=('Apache-2.0 OR MIT')
depends=(
  glibc
  libgcc
)
makedepends=(
  rust
)
backup=(etc/$pkgname/ntp.toml)
source=(
  $pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz
  50-$pkgname.list
  LICENSE
)
sha512sums=('ecc82081f9af5b3ce73aaafb3a12189d66519b1e02e48949d939112681e62ef6ccbfff176f4da277a35423c812109d682cc9aa1d15121e528c613de0c5c73f3e'
            'e5dae786b999383980dc1d9aaee125ee18c52651abf163a3c38a2fdaa97b9de8940052af5a4e8ce1826444fc3f246740b1a95aa35f96c8484ccb683b0f638783'
            'a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')
b2sums=('584da621d013db2023391dc48820704913ff4d17df9abf0890b250da0d27d677d4595359bb1d081bb3c939966d173e2a19ca1f4db01fb1c4a0481cb7274d941c'
        '8013fe6de65a093366d79e09b9d5ed9975cf707cfa282b9abe8e5f3be5885ec668c598cba2d2b204388b291fbe2ef249f091bd5a480d1c3d951b1ffe34cae831'
        'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgname-$pkgver
  CFLAGS+=" -ffat-lto-objects" cargo build --all-features --frozen --release --target-dir=target
}


package() {
  cd $pkgname-$pkgver
  install -vDm 755 target/release/ntp-{ctl,daemon,metrics-exporter} -t "$pkgdir/usr/bin/"
  install -vDm 644 docs/examples/conf/ntp.toml.default "$pkgdir/etc/$pkgname/ntp.toml"
  install -vDm 644 docs/precompiled/man/*.5 -t "$pkgdir/usr/share/man/man5/"
  install -vDm 644 docs/precompiled/man/*.8 -t "$pkgdir/usr/share/man/man8/"
  install -vDm 644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/0BSD.txt"
}
