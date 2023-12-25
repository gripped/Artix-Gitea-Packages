# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Tom Killian <tom.archlinux.org>
# Contributor: Judd Vinet <jvinet.zeroflux.org>

pkgname=dhcpcd
pkgver=10.0.6
pkgrel=1
pkgdesc="DHCP/ IPv4LL/ IPv6RA/ DHCPv6 client"
url="https://roy.marples.name/projects/dhcpcd/"
arch=(x86_64)
license=(BSD-2-Clause)
depends=(
  glibc
  openssl
  sh
  libudev
)
optdepends=('openresolv: resolvconf support')
provides=(dhcp-client)
backup=(etc/$pkgname.conf)
# we need /var/lib/dhcpcd
options=(emptydirs)
source=(
  https://github.com/NetworkConfiguration/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz{,.asc}
  $pkgname.sysusers
  $pkgname.tmpfiles
)
sha256sums=('779d3ae514e8f24d7449503e1f0a20f5137c773bd04ca98c62386bf81e99f482'
            'SKIP'
            '06788ad9f5f7ccb5d2a2da6f0322ff5771f8de82cfbe8b9ad954f2c38265e21b'
            '1ca593a91d537766d073e71cfab87881e6f6a2ccb5236a45531d5520b3af7a31')
b2sums=('4afd08cf7377b2262d33bf3f7ac503e081572a7c1ffd53b285842a92d99d88fae44e7e6384134bbe1eb839001f822fa7fb43718c42f9e8e6d11a05ec66fa2fc6'
        'SKIP'
        '1f4ad7d27a33ea9d317b95817898bc853bda8ef6bf1b09d86b7a5b25a0dae89c246fdb919c62b677d25148c8b4cf8c02e99cf3fa583c3a63bd04d1817bf47872'
        'fab9f56a694b2bcaa26ebd4040984778ea4a3cccd57f17a0eb724a9fc4750157d97d9d0db747932c3b386938fe2bf1d6a4ba609cc5cc3a6b0e1ae39404ba21be')
validpgpkeys=('A785ED2755955D9E93EA59F6597F97EA9AD45549')  # Roy Marples (NetBSD) <roy@NetBSD.org>

prepare() {
  printf "# Don't attempt to obtain an IPv4LL address if we failed to get one via DHCP.  See RFC 3927.\nnoipv4ll\n" >> $pkgname-$pkgver/src/$pkgname.conf
}

build() {
  local configure_options=(
    --dbdir=/var/lib/$pkgname
    --libexecdir=/usr/lib/$pkgname
    --prefix=/usr
    --privsepuser=$pkgname
    --runstatedir=/run
    --sbindir=/usr/bin
    --sysconfdir=/etc
  )

  cd $pkgname-$pkgver
  ./configure "${configure_options[@]}"
  make
}

check() {
  make test -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 $pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # strip files that somehow won't get stripped automatically
  strip "$pkgdir/usr/bin/$pkgname"
  strip "$pkgdir/usr/lib/$pkgname/dev/udev.so"
}
