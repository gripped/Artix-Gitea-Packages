# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

pkgname=v2ray
pkgver=5.45.0
pkgrel=1
pkgdesc="A platform for building proxies to bypass network restrictions"
arch=('x86_64')
url="https://github.com/v2fly/v2ray-core"
license=('MIT')
depends=('glibc' 'v2ray-domain-list-community' 'v2ray-geoip')
makedepends=('go' 'git')
backup=(etc/v2ray/config.json)
source=("git+https://github.com/v2fly/v2ray-core.git#tag=v$pkgver")
sha512sums=('470fccfe96e073f38f6d64f77bdb146238a79a19e2ae91df74923ed9c53816c2fe171d5e26f2f5cfca9e11c9ecf35b60e125e7e6306d9d2b6fd94b03e1fba463')

prepare() {
  cd v2ray-core
  sed -i 's|/usr/local/bin|/usr/bin|;s|/usr/local/etc|/etc|' release/config/systemd/system/*.service
}

build() {
  cd v2ray-core
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  go build -o v2ray ./main
}

check() {
  cd v2ray-core
  # TestGeoIPMatcher6US: https://github.com/v2fly/v2ray-core/issues/3473
  # QUIC tests: https://github.com/quic-go/quic-go/issues/5572
  go test -p 1 -tags json -v -timeout 30m -skip 'TestGeoIPMatcher6US|TestQuic.*|TestVMessQuic|TestQUIC.*' ./...
}

package() {
  cd v2ray-core
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/v2ray/
  install -Dm644 release/config/systemd/system/v2ray.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 release/config/systemd/system/v2ray@.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 release/config/*.json -t "$pkgdir"/etc/v2ray/
  install -Dm755 v2ray -t "$pkgdir"/usr/bin/
}
