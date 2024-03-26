# Maintainer: nikolar <nikolar@artixlinux.org>

_sed_args=(-e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g' -e 's|/opt/bin|/usr/bin|g' -e 's|/var/service|/run/runit/service|g' -e 's|/usr/libexec|/usr/lib|g')

pkgname=tailscale-runit
pkgver=20240326
pkgrel=3
pkgdesc="Runit service script for tailscale"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
depends=('tailscale' 'runit')
groups=('runit-world')
conflicts=('init-tailscale')
provides=('init-tailscale')
source=("tailscale.run")
sha256sums=('ff4e39fe3268bc93898b732796de7f9b8c2f63ba7366b339d08c05f49a5a28e7')

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
    _inst_sv 'tailscale'
}
