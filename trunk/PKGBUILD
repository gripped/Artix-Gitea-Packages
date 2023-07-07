# Maintainer: artoo <artoo@artixlinux.org>

_pkgname=elogind
pkgname=lib32-elogind
pkgver=252.9
pkgrel=2
pkgdesc="The systemd project's logind, extracted to a standalone package (32-bit)"
arch=('x86_64')
url="https://github.com/elogind/elogind"
license=('GPL' 'LGPL2.1')
depends=('lib32-gcc-libs' 'lib32-acl' 'lib32-libcap' 'lib32-libgcrypt' 'lib32-libxcrypt'
         'lib32-eudev' 'elogind' 'lib32-util-linux' 'lib32-glibc' 'lib32-pam')
makedepends=('git' 'gperf' 'intltool' 'lib32-bzip2'
             'lib32-curl' 'lib32-dbus' 'lib32-glib2'
             'lib32-gnutls' 'lib32-libelf' 'lib32-libidn2' 'lib32-pcre2'
             'libxslt' 'meson' 'lib32-udev' 'python-jinja')
options=('!libtool')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/elogind/elogind/archive/v${pkgver}.tar.gz"
        'elogind-252-docs.patch')
sha256sums=('7af8caa8225a406e77fb99c9f33dba5e1f0a94f0e1277c9d91dcfc016f116d85'
            'c4153ec89c4deee33e019c168a71b7f1052ff5b24dc747a847cf295a4b54749f')

prepare() {
    cd ${_pkgname}-${pkgver}
    patch -Np 1 -i ../elogind-252-docs.patch
}

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    local meson_options=(
        --libexecdir /usr/lib32
        --libdir /usr/lib32
        -Daudit=false
        -Ddbuspolicydir=/usr/share/dbus-1/system.d
        -Ddocdir=/usr/share/doc/elogind
        -Ddefault-hierarchy=hybrid
        -Ddefault-kill-user-processes=false
    )

    arch-meson "${_pkgname}-${pkgver}" build "${meson_options[@]}"

    ninja -C build
}

check(){
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="$pkgdir" ninja -C build install

#     ln -sfv libelogind.pc "${pkgdir}"/usr/lib32/pkgconfig/libsystemd.pc

    rm -rf "${pkgdir}"/{etc,var}
    rm -rf "${pkgdir}"/usr/{bin,include,lib,share}
}
