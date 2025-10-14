# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Tom Killian <tom.archlinux.org>
# Contributor: Judd Vinet <jvinet.zeroflux.org>

pkgname=dhcpcd
pkgver=10.2.4
pkgrel=2
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
sha256sums=('6721e606609226dbf4d864a78802a9e96beec0ee034a1bd84138b3e037bba7d9'
            'SKIP'
            '32cecb466f491d73aec546f72f37048ee3042b00c35df3d2dde43296e7505c9e'
            '1ca593a91d537766d073e71cfab87881e6f6a2ccb5236a45531d5520b3af7a31')
b2sums=('cdc5c345c58f24852ecf7e6655446f9385c860d9095cca8fa40eaae27a1d05dfad667e1e39af6ace2bd73acaa799210d6345462c90a88f89839912416263fdef'
        'SKIP'
        'f9b6e9f9a9f6ca781c3993d9dbccbb2a5a7f9c471c4b736b4b21511ce28a0e44c23e60ef6b74cbe7141942cde55115feb9e78df5ab389af7e064685521e40916'
        'fab9f56a694b2bcaa26ebd4040984778ea4a3cccd57f17a0eb724a9fc4750157d97d9d0db747932c3b386938fe2bf1d6a4ba609cc5cc3a6b0e1ae39404ba21be')
validpgpkeys=('A785ED2755955D9E93EA59F6597F97EA9AD45549')  # Roy Marples (NetBSD) <roy@NetBSD.org>

prepare() {
  printf "# Do not attempt to obtain an IPv4LL address if we failed to get one via DHCP. See RFC 3927.\nnoipv4ll\n" >> $pkgname-$pkgver/src/$pkgname.conf
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
