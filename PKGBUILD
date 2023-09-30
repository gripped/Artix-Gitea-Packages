# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>
pkgbase=pipewire-dinit
pkgname=('pipewire-dinit' 'pipewire-pulse-dinit')
pkgver=20230930
pkgrel=1
pkgdesc="dinit user service script for pipewire"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('turnstile-experimental')
depends=('dbus-dinit-user' 'dinit')
source=("pipewire.user" "pipewire-pulse.user")
sha256sums=('11ea275654d11710263e9a3bbcf4350db1aea0b34b55dcb120df81eb80a55625'
            '3be7789075417cd6306626de04fd30d6211ca14a736656e78a4a8a3721f9b094')

package_pipewire-dinit() {
    install -Dm644 pipewire.user "$pkgdir/etc/dinit.d/user/pipewire"
}

package_pipewire-pulse-dinit() {
    pkgdesc+="-pulse"
    depends=("pipewire-dinit")
    install -Dm644 pipewire-pulse.user "$pkgdir/etc/dinit.d/user/pipewire-pulse"
}
