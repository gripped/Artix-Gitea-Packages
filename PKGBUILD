# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=ntpd-rs
pkgver=1.8.0
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
sha512sums=('17b6775631f0b828bcbd1b475b0aed6415b9ed002489c83a4116aae0aee9c7c90bfb61be18b1578ec3ca8a3d08cdec6c3631ea5adf5e4ed107367c6df559988e'
            'e5dae786b999383980dc1d9aaee125ee18c52651abf163a3c38a2fdaa97b9de8940052af5a4e8ce1826444fc3f246740b1a95aa35f96c8484ccb683b0f638783'
            'a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')
b2sums=('a0fe9e7e67a7d0202c7f50967836fe4599de7abe19d7fe0f5aa89913497a4be537c7452dffdbe6956be11207600ed933c66996f8f5a4cdb47650161ceed26780'
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
