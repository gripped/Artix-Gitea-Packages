# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
pkgname=tailscale-dinit
pkgver=20251115
pkgrel=1
pkgdesc="dinit service scripts for tailscale"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('dinit-world')
depends=('tailscale' 'dinit')
conflicts=('init-tailscale')
provides=('init-tailscale')
source=("tailscaled")
install='tailscale-dinit.install'
sha256sums=('b5ec5fd1c18245cd038f5090ce472e7ec8f0f7852cb96224a0338633717dffd4')

package() {
    install -Dm644 tailscaled "$pkgdir/etc/dinit.d/tailscaled"
}
