# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Techlive Zheng <techlivezheng at gmail dot com>
# Contributor: peace4all <markspost at rocketmail dot com>

pkgname=dnscrypt-proxy
pkgver=2.1.5
_commit=8744c6f10da322921d1c12e24105bcfe813e42a6  # refs/tags/2.1.5
pkgrel=2
pkgdesc="A flexible DNS proxy, with support for encrypted DNS protocols"
arch=(x86_64)
url="https://github.com/DNSCrypt/dnscrypt-proxy"
license=(ISC)
depends=(glibc)
makedepends=(git go)
optdepends=('python-urllib3: for generate-domains-blocklist')
backup=(
  etc/$pkgname/$pkgname.toml
  etc/$pkgname/allowed-ips.txt
  etc/$pkgname/allowed-names.txt
  etc/$pkgname/blocked-ips.txt
  etc/$pkgname/blocked-names.txt
  etc/$pkgname/cloaking-rules.txt
  etc/$pkgname/forwarding-rules.txt
)
# NOTE: disabled until gcc is fixed to produce reproducible bytecode for go
options=(!lto)
source=(
  git+$url#tag=$_commit?signed
  tmpfiles.d
  sysusers.d
  $pkgname-$pkgver-configuration.patch::https://github.com/dvzrv/dnscrypt-proxy/commit/66ffcf524b55b4f06cfaf4e37c8b8c6dcc10d0df.patch
)
sha512sums=('SKIP'
            '005f8077c2c99a3bd86d814a0c05c0f5142952445e32a615302dc1fc7d4bf66d9f7c661ebd8ef218e890b80bfe0d014dd2e7b47fcebba69f217cec631195f151'
            '888da497ac3a09cd975b9a8de8cad22aabdc40213086b9683715292f6032259929714fd120ac952f91e3af5ada6f4a843054c880a5724c5eb8e6d31664c43ec8'
            'fa45be971c1bb401527ba8f5043312f021fad0d417bd764ab6550637d5488a00d886d966df21be48d4503f1b5e326b875bac42ee18613827326c12af5ce19359')
validpgpkeys=('54A2B8892CC3D6A597B92B6C210627AABA709FE1') # Frank Denis (Jedi/Sector One) <pgp@pureftpd.org

prepare() {
  cd $pkgname
  patch -Np1 -i ../$pkgname-$pkgver-configuration.patch
}

build() {
  cd $pkgname/$pkgname
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  local _config

  cd $pkgname
  # executable
  install -vDm 755 $pkgname/$pkgname -t "$pkgdir/usr/bin/"
  # config files
  install -vDm 644 $pkgname/example-$pkgname.toml "$pkgdir/etc/$pkgname/$pkgname.toml"
  for _config in {{allowed,blocked}-{ips,names},{cloaking,forwarding}-rules,captive-portals}.txt; do
    install -vDm 644 $pkgname/example-$_config "$pkgdir/etc/$pkgname/$_config"
  done
  # utils
  install -vDm 644 utils/generate-domains-blocklist/*.{conf,txt} -t "$pkgdir/usr/share/$pkgname/utils/generate-domains-blocklist"
  install -vDm 755 utils/generate-domains-blocklist/generate-domains-blocklist.py "$pkgdir/usr/bin/generate-domains-blocklist"
  # license
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  # docs
  install -vDm 644 {ChangeLog,README.md} -t "$pkgdir/usr/share/doc/$pkgname"
  # sysusers.d
  install -vDm 644 "$srcdir/sysusers.d" "$pkgdir/usr/lib/sysusers.d/${pkgname}.conf"
  # tmpfiles.d
  install -vDm 644 "$srcdir/tmpfiles.d" "$pkgdir/usr/lib/tmpfiles.d/${pkgname}.conf"
}
# vim:set ts=2 sw=2 et:
