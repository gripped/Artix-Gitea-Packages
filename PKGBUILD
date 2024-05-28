# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>
pkgbase=pipewire-dinit
pkgname=('pipewire-dinit' 'pipewire-pulse-dinit')
pkgver=20240528
pkgrel=1
pkgdesc="dinit user service script for pipewire"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('turnstile-experimental')
depends=('dbus-dinit-user' 'dinit-base')
source=("pipewire.user" "pipewire-pulse.user")
sha256sums=('6351f1d3dd9530d1174b3649811d170483475d444f871898cce3a73639e8a187'
            '4ddda5457cff7d8ab5afcc4165499359ae8a85259065c1d4a7928a252e052466')

package_pipewire-dinit() {
    install -Dm644 pipewire.user "$pkgdir/etc/dinit.d/user/pipewire"
}

package_pipewire-pulse-dinit() {
    pkgdesc+="-pulse"
    depends=("pipewire-dinit")
    install -Dm644 pipewire-pulse.user "$pkgdir/etc/dinit.d/user/pipewire-pulse"
}
