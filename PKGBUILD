# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Techlive Zheng <techlivezheng at gmail dot com>
# Contributor: peace4all <markspost at rocketmail dot com>

pkgname=dnscrypt-proxy
pkgver=2.1.18
pkgrel=1
pkgdesc="A flexible DNS proxy, with support for encrypted DNS protocols"
arch=(x86_64)
url="https://github.com/DNSCrypt/dnscrypt-proxy"
license=(ISC)
depends=(glibc)
makedepends=(
  git
  go
)
optdepends=('python-urllib3: for generate-domains-blocklist')
backup=(
  etc/$pkgname/$pkgname.toml
  etc/$pkgname/allowed-ips.txt
  etc/$pkgname/allowed-names.txt
  etc/$pkgname/blocked-ips.txt
  etc/$pkgname/blocked-names.txt
  etc/$pkgname/captive-portals.txt
  etc/$pkgname/cloaking-rules.txt
  etc/$pkgname/forwarding-rules.txt
)
# NOTE: LTO breaks reproducibility :(
options=(!lto)
source=(
  git+$url#tag=$pkgver?signed
  # https://github.com/dvzrv/dnscrypt-proxy/releases/tag/2.1.18.arch1
  0001-Make-configuration-file-hierarchy-compliant.patch
  tmpfiles.d
  sysusers.d)
sha512sums=('3879c99366b8670cb6b7726442036ea6b226625674e9b599e6c0848cfe761b26aadaace0f55543a94615e0d0cd2d22d27ef0b9909adc555937e2f41def2ce038'
            '518fb95e3a04dedf78fc6714a1ea94cc73c44a2c871792073cf86f97893c4250eabea20187be9186baf8af9c5d5b9dcd7e4eeb5ad6993e050ebb9121f67dd544'
            '005f8077c2c99a3bd86d814a0c05c0f5142952445e32a615302dc1fc7d4bf66d9f7c661ebd8ef218e890b80bfe0d014dd2e7b47fcebba69f217cec631195f151'
            '888da497ac3a09cd975b9a8de8cad22aabdc40213086b9683715292f6032259929714fd120ac952f91e3af5ada6f4a843054c880a5724c5eb8e6d31664c43ec8')
b2sums=('bfebbd72f4e3070862670e8ac0af0d00098c5cdf1e4f39bf09aede3e1b67aa6f22e6495fb99624223a8bdcd18d4103db3db5e5ce2e42876a94699a70a011dc91'
        '59b1b77d04bd0a4cbaf7518e64ecb032222f353f0aac2f02c6ea53a5f79387366665168d28f4ca3bff883b3fdb213f7ff24289ba0116d445b615c308e27345e9'
        '2c83832dd8ce63608e4a948deb0a55f2857a7e3f53b3fb8ea67a4c807f7dc7245305bf63fdb35009089df90a070cd95cb6a8f31f79e243d8c97a442554aeb428'
        '6340a1f5011145642ce2352e8be4bfa50cdf74889e608471519934d814ca64b03461bc21e347feafe98256d7b8b281c1034dd0b8890e1155bdc3dd044ae18e80')
validpgpkeys=('54A2B8892CC3D6A597B92B6C210627AABA709FE1') # Frank Denis (Jedi/Sector One) <pgp@pureftpd.org

prepare() {
  cd $pkgname
  # Make configuration FHS compliant:
  patch -Np1 -i ../0001-Make-configuration-file-hierarchy-compliant.patch

  export GOPATH="$srcdir"
  go mod download -modcacherw
}

build() {
  cd $pkgname/$pkgname
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

  go build -ldflags "-compressdwarf=false -linkmode external" .
}

check() {
  cd $pkgname
  go test ./...
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
