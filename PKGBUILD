# Maintainer: artoo <artoo@artixlinux.org>
# Contributor: williamh <williamh@gentoo.org>

_fname=gentoo-functions
_furl="https://github.com/gentoo/${_fname}/archive"
_fver=0.19

pkgname=netifrc
pkgver=0.7.6
pkgrel=1
pkgdesc="Gentoo Network Interface Management Scripts"
arch=('x86_64')
url="https://github.com/gentoo/netifrc"
license=('BSD2')
depends=('glibc' 'udev' 'sh')
backup=('etc/conf.d/net')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${_fname}-${_fver}.tar.gz::${_furl}/${_fver}.tar.gz"
        'artix.patch')
sha256sums=('6040cc0664c93f61b3461e36f221b86f9a8f57a0bd7cf737b0ad6f75e54385d3'
            'f65161c84874959780e332f33d6a8ac878a40dc88da4542448092be6ed9b2ffe'
            '137c9fb75874b9a584bb280dcaf251079367fa8528a186ea975a0f27b1682107')

_nargs=(
    SYSCONFDIR=/etc
    PREFIX=/usr
    SBINDIR=/usr/bin
    LIBEXECDIR=/usr/lib/"${pkgname}"
)

_fargs=(
    ROOTPREFIX=/usr
    ROOTSBINDIR=/usr/bin
    ROOTLIBEXECDIR=/usr/lib/artix
)

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np 1 -i ../artix.patch
}

build(){
    # make netifrc
    cd "${pkgname}-${pkgver}"
    make "${_nargs[@]}"
    cd ${srcdir}/${_fname}-${_fver}
    make "${_fargs[@]}"
}

package() {
    cd "${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" "${_nargs[@]}" install

    install -Dm 644 doc/net.example "${pkgdir}"/etc/conf.d/net

    install -d "${pkgdir}"/etc/runlevels/boot
    ln -svf /etc/init.d/net.lo "${pkgdir}"/etc/runlevels/boot/net.lo

    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

    cd "${srcdir}/${_fname}-${_fver}"
    make DESTDIR="${pkgdir}" "${_fargs[@]}" install

    # rm systemd wrapper
    rm -fv "${pkgdir}"/usr/lib/netifrc/sh/systemd-wrapper.sh
}
