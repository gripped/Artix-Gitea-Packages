# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/var/service|/run/runit/service|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=at-runit
pkgver=20260727
pkgrel=1
pkgdesc="Runit service script for at"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
makedepends=('git')
depends=('at' 'runit')
groups=('runit-galaxy')
provides=('init-at')
conflicts=('init-at')
_alpm_tag=3.0
source=("git+https://gitea.artixlinux.org/artix/alpm-hooks.git#tag=$_alpm_tag"
        "at.run")
sha256sums=('9ac686c2d7caaf9bd96122db26c5b2af82a308dcbee331f3ce0b807ef5b800ee'
            '6db3f1cedfe7d89d08514be052c45a4276b172263a368d3a25c11f97bc6777bb')

_inst_logsv() {
    for file in run finish check; do
        if test -f "$srcdir/log$1.$file"; then
            install -Dm755 "$srcdir/log$1.$file" "$pkgdir/etc/runit/sv/$1/log/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/log/$file"
        fi
    done
}

_inst_sv() {
    if test -f "$srcdir/$1.conf"; then
        install -Dm644 "$srcdir/$1.conf" "$pkgdir/etc/runit/sv/$1/conf"
    fi

    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'at'
    cd "${srcdir}"/alpm-hooks
    make DESTDIR="${pkgdir}" install_runit_at
}
