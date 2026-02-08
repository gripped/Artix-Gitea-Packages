# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>

pkgname=(geoip-database geoip-database-extra)
pkgver=20260204
pkgrel=1
arch=(any)
url='https://mailfud.org/geoip-legacy/'
license=('LicenseRef-GeoLite2-End-User-License-Agreement')
makedepends=('util-linux')
checkdepends=('geoip')
_source_base="https://mailfud.org/geoip-legacy"
source=(GeoIP-$pkgver.dat.gz::$_source_base/GeoIP.dat.gz
        GeoIPv6-$pkgver.dat.gz::$_source_base/GeoIPv6.dat.gz
        GeoIPCity-$pkgver.dat.gz::$_source_base/GeoIPCity.dat.gz
        GeoIPCityv6-$pkgver.dat.gz::$_source_base/GeoIPCityv6.dat.gz
        GeoIPASNum-$pkgver.dat.gz::$_source_base/GeoIPASNum.dat.gz
        GeoIPASNumv6-$pkgver.dat.gz::$_source_base/GeoIPASNumv6.dat.gz
        GeoLite2-End-User-License-Agreement.pdf)
sha256sums=('0f1740a4e12c0389233654108185acfe4751370f582902b133449ed717741c1d'
            'ce2135480abd1ac0e1d3703cd1d20c35cafdb657cf6ab9e0915cf1bcdc2815cc'
            '8baefe1cb633ac5f38933aea2ad92234f4827e046d5bae21a978886de681cc12'
            'dbacda4920410081da03caad6035c8b09d49c4b8891ed37f1e8d57f31c15a309'
            'e3fd0215641f1b7762264fd80fd824ebe98ce7e3a04de20464832a4ab56d56dd'
            '85f11f7c00da8c4c7ed3c0d5c7d970ca56f8db3eff999032ea919c293cf53f64'
            'b9c7fbfcdd5b682b5635592281d72006df89d73f163308b7ef35a59f293b036e')

prepare() {
  cd "$srcdir"
  rename -v -- "-$pkgver" '' *.dat
}

check() {
  cd "$srcdir"

  if [[ $(geoiplookup -f GeoIP.dat archlinux.org) != *'US, United States' ]]; then
    echo >&2 'Unable to resolve IPv4 address to country.'
    return 1
  fi

  if [[ $(geoiplookup6 -f GeoIPv6.dat archlinux.org) != *'US, United States' ]]; then
    echo >&2 'Unable to resolve IPv6 address to country.'
    return 1
  fi

  if [[ $(geoiplookup -f GeoIPCity.dat archlinux.org) != *'US, '* ]]; then
    echo >&2 'Unable to resolve IPv4 address to city.'
    return 1
  fi

  if [[ $(geoiplookup6 -f GeoIPCityv6.dat archlinux.org) != *'US, '* ]]; then
    echo >&2 'Unable to resolve IPv6 address to city.'
    return 1
  fi

  if [[ $(geoiplookup -f GeoIPASNum.dat archlinux.org) != *'AS11019 HAProxy Technologies'* ]]; then
    echo >&2 'Unable to resolve IPv4 address to ASN.'
    return 1
  fi

  if [[ $(geoiplookup6 -f GeoIPASNumv6.dat archlinux.org) != *'AS11019 HAProxy Technologies'* ]]; then
    echo >&2 'Unable to resolve IPv6 address to ASN.'
    return 1
  fi
}

package_geoip-database() {
  pkgdesc="GeoIP legacy country database (based on GeoLite2 data created by MaxMind)"
  install=$pkgname.install

  cd "$srcdir"
  install -Dm644 -t "$pkgdir/usr/share/GeoIP" GeoIP{,v6}.dat
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" GeoLite2-End-User-License-Agreement.pdf
}

package_geoip-database-extra() {
  pkgdesc="GeoIP legacy city/ASN databases (based on GeoLite2 data created by MaxMind)"
  install=$pkgname.install

  cd "$srcdir"
  install -Dm644 -t "$pkgdir/usr/share/GeoIP" GeoIPCity{,v6}.dat GeoIPASNum{,v6}.dat
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" GeoLite2-End-User-License-Agreement.pdf
}
