# Maintainer: artoo <artoo@artixlinux.org>

_pkgname=elogind
_tag=255.22

pkgname=lib32-elogind
pkgver=${_tag/-r/.}
pkgrel=1
pkgdesc="The systemd project's logind, extracted to a standalone package (32-bit)"
arch=('x86_64')
url="https://github.com/elogind/elogind"
license=('GPL' 'LGPL2.1')
provides=(
    'libelogind.so'
)
depends=(
    'lib32-gcc-libs'
    'lib32-acl'
    'lib32-libcap'
    'lib32-libgcrypt'
    'lib32-libxcrypt'
    'lib32-udev'
    'elogind'
    'lib32-util-linux'
    'lib32-glibc'
    'lib32-pam'
)
makedepends=(
    'git'
    'gperf'
    'intltool'
    'lib32-bzip2'
    'lib32-curl'
    'lib32-dbus'
    'lib32-glib2'
    'lib32-gnutls'
    'lib32-libelf'
    'lib32-libidn2'
    'lib32-pcre2'
    'libxslt'
    'meson'
    'python-jinja'
)
checkdepends=(
    'python-lxml'
)
source=(
    "git+https://github.com/elogind/elogind.git#tag=V${_tag}"
)
sha256sums=('24589d7af71ad5a2f3c60f6f0e4d4cc92873faaccbca810bb2c29fcdf3fdc882')


build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    local meson_options=(
        --libexecdir /usr/lib32/elogind
        --libdir /usr/lib32
        -Dmode=release
        -Dversion-tag="${pkgver}-${pkgrel}-artix"
        -Dshared-lib-tag="${pkgver}-${pkgrel}"
        -Daudit=disabled
        -Dselinux=disabled
        -Dxenctrl=disabled
        -Dpolkit=disabled
        -Dpam=false
        -Ddbuspolicydir=/usr/share/dbus-1/system.d
        -Ddocdir=/usr/share/doc/elogind
        -Ddefault-hierarchy=hybrid
        -Ddefault-kill-user-processes=false
    )

    arch-meson "${_pkgname}" build "${meson_options[@]}"

    ninja -C build
}

check(){
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="$pkgdir" ninja -C build install

    rm -rf "${pkgdir}"/{etc,var}
    rm -rf "${pkgdir}"/usr/{bin,include,lib,lib32/elogind,share}
}
