# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
# Contributor: capezotte <capezotte@artixlinux.org>
# Contributor: Artoo <artoo@artixlinux.org>

pkgbase=pipewire-dinit
pkgname=('pipewire-dinit' 'pipewire-pulse-dinit')
pkgver=20260426
pkgrel=1
pkgdesc="dinit user service script for pipewire"
arch=('any')
url="https://artixlinux.org"
license=('BSD-2-Clause')
groups=('dinit-world')
depends=(
    'dbus-dinit-user'
)
source=(
    "pipewire.user"
    "pipewire-pulse.user"
    LICENSE
)
sha256sums=('d6f81c436263abf2465eb727f5340a6f07eb52c02f48c1e261a489d5bad03da4'
            '4ddda5457cff7d8ab5afcc4165499359ae8a85259065c1d4a7928a252e052466'
            'a5a440e8b046dc1351b650eabb6e1947a4a2ad502780e1cf105916ed8aca48ff')

package_pipewire-dinit() {
    depends+=(
        "pipewire"
    )

    install -Dm644 pipewire.user "$pkgdir/etc/dinit.d/user/pipewire"

    install -Dm0644 -t "$pkgdir"/usr/share/licenses/"$pkgname"/ LICENSE
}

package_pipewire-pulse-dinit() {
    pkgdesc+="-pulse"
    depends=(
        'pipewire-pulse'
        "pipewire-dinit"
    )

    install -Dm644 pipewire-pulse.user "$pkgdir/etc/dinit.d/user/pipewire-pulse"

    install -Dm0644 -t "$pkgdir"/usr/share/licenses/"$pkgname"/ LICENSE
}
