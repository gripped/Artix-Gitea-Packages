# Maintainer: artoo <artoo@artixlinux.org>
# Contributor: williamh <williamh@gentoo.org>

_fname=gentoo-functions
_furl="https://github.com/gentoo/${_fname}/archive"
_fver=1.7.6

pkgname=netifrc
pkgver=0.7.14
pkgrel=1
pkgdesc="Gentoo Network Interface Management Scripts"
arch=('x86_64')
url="https://github.com/gentoo/netifrc"
license=('BSD-2-Clause')
depends=('glibc' 'udev' 'sh')
makedepends=('meson')
backup=('etc/conf.d/net')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${_fname}-${_fver}.tar.gz::${_furl}/${_fname}-${_fver}.tar.gz")
sha256sums=('c44769960dfc65887ba0d7243991266203593ea1c2ec29959be40cb1fbe2fc50'
            '98b06fd74b2dc6a1f896ebc802e8f61dd3cbd16fac2fd1d3847abc886a0ef490')

_args=(
    SYSCONFDIR=/etc
    PREFIX=/usr
    SBINDIR=/usr/bin
    LIBEXECDIR=/usr/lib/"${pkgname}"
)

prepare() {
    # todo: use a patch
    sed -e "s|genfun_prefix=|genfun_prefix=/usr|" \
        -e "s|lib/gentoo|lib/artix|g" -i "${_fname}-${_fname}-${_fver}"/functions.sh
    sed -e "s|lib/gentoo|lib/artix|g" -i "${_fname}-${_fname}-${_fver}"/meson.build
    sed -e "s|/usr/libexec/|/usr/lib/|g" -i "${pkgname}-${pkgver}"/net/iwd.sh
}

build(){
    # make netifrc
    make -C "${pkgname}-${pkgver}" "${_args[@]}"

    artix-meson "${_fname}-${_fname}-${_fver}" build
    meson compile -C build
}

package() {

    make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" "${_args[@]}" install

    install -Dm 644 "${pkgname}-${pkgver}"/doc/net.example "${pkgdir}"/etc/conf.d/net

    install -d "${pkgdir}"/etc/runlevels/boot
    ln -svf /etc/init.d/net.lo "${pkgdir}"/etc/runlevels/boot/net.lo

    install -Dm644 "${pkgname}-${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

    meson install -C build --destdir "${pkgdir}"

    # rm systemd & portage wrapper
    rm -fv "${pkgdir}"/usr/lib/netifrc/sh/systemd-wrapper.sh
}
