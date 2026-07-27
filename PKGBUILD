# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|\(/usr\)\?/sbin|/usr/bin|g')

pkgname=cronie-runit
pkgver=20260727
pkgrel=1
pkgdesc="runit service scripts for cronie"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
groups=('runit-system')
makedepends=('git')
depends=('cronie' 'runit')
provides=('init-cronie' 'init-cron')
conflicts=('fcron' 'init-cronie' 'init-cron')
_alpm_tag=3.0
source=("git+https://gitea.artixlinux.org/artix/alpm-hooks.git#tag=$_alpm_tag"
        "cronie.run")
sha256sums=('9ac686c2d7caaf9bd96122db26c5b2af82a308dcbee331f3ce0b807ef5b800ee'
            '882836bff4df1d856a40c4d288d88f8e00685f0683e545bc5193bf754be0e1d6')

_inst_sv(){
    for file in run finish check; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm755 "$srcdir/$1.$file" "$pkgdir/etc/runit/sv/$1/$file"
            sed "${_sed_args[@]}" -i "$pkgdir/etc/runit/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'cronie'
    cd "${srcdir}"/alpm-hooks
    make DESTDIR="${pkgdir}" install_runit_cronie
}
