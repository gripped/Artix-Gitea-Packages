# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: capezotte <capezotte@artixlinux.org> based on wiki edits by Artist

pkgbase=pipewire-openrc
pkgname=(pipewire-openrc pipewire-pulse-openrc)
pkgver=20260426
pkgrel=1
pkgdesc="openrc user service script for pipewire"
arch=('any')
url="https://artixlinux.org"
groups=('openrc-world')
license=('GPL-2.0-or-later')
makedepends=(
    'avahi-openrc'
    'dbus-openrc'
    'pipewire'
    'pipewire-pulse'
)
source=(
    pipewire{,-pulse}.user.initd
)
sha256sums=('aec5c27ac7b47314b9a368e34c73c35341a77d900b1cede09070bfb593afb746'
            'e7af2160c453ff797db3aa3aace61e0f27dc88d90239b6be318762588cf483cd')

package_pipewire-openrc() {
    depends+=(
        'dbus-openrc'
        'pipewire'
    )

    install -Dm755 pipewire.user.initd "$pkgdir"/etc/user/init.d/pipewire
}

package_pipewire-pulse-openrc() {
    depends+=(
        'pipewire-openrc'
        'pipewire-pulse'
        'avahi-openrc'
    )

    install -Dm755 pipewire-pulse.user.initd "$pkgdir"/etc/user/init.d/pipewire-pulse
}
