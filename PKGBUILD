# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

pkgname=v2ray
pkgver=5.47.0
pkgrel=1
pkgdesc="A platform for building proxies to bypass network restrictions"
arch=('x86_64')
url="https://github.com/v2fly/v2ray-core"
license=('MIT')
depends=('glibc' 'v2ray-domain-list-community' 'v2ray-geoip')
makedepends=('go' 'git')
backup=(etc/v2ray/config.json)
source=("git+https://github.com/v2fly/v2ray-core.git#tag=v$pkgver")
sha512sums=('dd5ade1792c135c14e4edae607cab139a3d7bd789070a7a6d40b9ad74921bd3320817000903ccd8e9cec26ef24dadb72d08573dbfcd393db01f2440c38ab243c')

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
  install -Dm644 release/config/*.json -t "$pkgdir"/etc/v2ray/
  install -Dm755 v2ray -t "$pkgdir"/usr/bin/
}
