# Maintainer: nikolar <nikolar@artixlinux.org>
# Contributor: capezotte

pkgname=tailscale-runit
pkgver=20240326
pkgrel=4
pkgdesc="Runit service script for tailscale"
arch=('any')
url="https://artixlinux.org"
license=('BSD-3-Clause')
depends=('tailscale' 'runit')
groups=('runit-world')
conflicts=('init-tailscale')
provides=('init-tailscale')
source=(tailscale{,.log}.run)
sha256sums=('ff4e39fe3268bc93898b732796de7f9b8c2f63ba7366b339d08c05f49a5a28e7'
            '18ca5cdd928b36cde46d5964b4fbed7c1b9f4c38de29c5a3a6ff4f4e0f5075b6')

package() {
    local x=${pkgname%-runit}
    [ ! -f "$x.conf" ] || install -Dm644 -- "$x.conf" "$pkgdir/etc/runit/sv/$x/conf"
    for i in '' log; do
        for j in run finish check; do
            [ ! -f "$x.${i:+$i.}$j" ] || install -Dm755 -- "$x.${i:+$i.}$j" "$pkgdir/etc/runit/sv/$x/${i:+$i/}$j"
        done
    done
}
