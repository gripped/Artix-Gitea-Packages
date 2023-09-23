# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=tailscale-dinit
pkgver=20211103
pkgrel=4
pkgdesc="dinit service scripts for tailscale"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('tailscale' 'dinit')
conflicts=('init-tailscale')
provides=('init-tailscale')
backup=('etc/dinit.d/config/tailscaled.conf')
source=("tailscaled" "tailscaled.script" "tailscaled.conf")
sha256sums=('298c9f26e596e692a526cc64fbb119d04d0eefb8450a286dc0044d8090b2c7eb'
            '805fbfd3aac4bf669d9ee05b2018fab66074e77e55b5a175ff2e5d5dc318f60a'
            '51ba51042e7752ea2262a05939ebee3c9c008b955f655002a53c4aadfc714d2a')

package() {
    install -Dm644 tailscaled        "$pkgdir/etc/dinit.d/tailscaled"
    install -Dm644 tailscaled.conf   "$pkgdir/etc/dinit.d/config/tailscaled.conf"
    install -Dm755 tailscaled.script "$pkgdir/usr/lib/dinit/tailscaled"
}
