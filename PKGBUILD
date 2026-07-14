# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Techlive Zheng <techlivezheng at gmail dot com>
# Contributor: peace4all <markspost at rocketmail dot com>

pkgname=dnscrypt-proxy
pkgver=2.1.17
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
  # https://github.com/dvzrv/dnscrypt-proxy/releases/tag/2.1.17.arch1
  0001-Make-configuration-file-hierarchy-compliant.patch
  tmpfiles.d
  sysusers.d)
sha512sums=('2c436608df381994879fb5b57fab771ca0ca30d6b69ee5356516c2fd589319abf4b9b22e8b99cef64a8b5d785a0d7fa5274aa809634885632dd9bda821592211'
            '2b2cad47f38c301f903e1d02ba024bcc41146c7d3a4921dd68cf301eae81516467c43d757a9fb284bc40676201d4f8c1fe2294fe591efd6343f96d3a2d74383b'
            '005f8077c2c99a3bd86d814a0c05c0f5142952445e32a615302dc1fc7d4bf66d9f7c661ebd8ef218e890b80bfe0d014dd2e7b47fcebba69f217cec631195f151'
            '888da497ac3a09cd975b9a8de8cad22aabdc40213086b9683715292f6032259929714fd120ac952f91e3af5ada6f4a843054c880a5724c5eb8e6d31664c43ec8')
b2sums=('a3dbbfba732c0adbb527d6865fab60fa298e0817bef4eb6077833a8ff817898778c6882c0d0bb920836825c30ec48612a86e6ace202e3b314741ae53420c61e5'
        '00c4d7145b9127703d22be7bb1c05581a44dfff2e09854e138887a6fddb10f7911eb0d8c57322542a90082079e004fb49e940bd9da89d2afea07e111334d18b7'
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
