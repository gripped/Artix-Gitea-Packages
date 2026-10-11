# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: capezotte <capezotte@artixlinux.org> based on wiki edits by Artist

pkgbase=pipewire-openrc
pkgname=(pipewire-openrc pipewire-pulse-openrc)
pkgver=20260426
pkgrel=2
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
sha256sums=('1d5df6519a97322c16153d650aa2ef864eea8397d388018234c25abc8cb07c1f'
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
