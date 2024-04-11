# Maintainer: artoo <artoo@artixlinux.org>

pkgbase=elogind
pkgname=('elogind' 'libelogind')
pkgver=255.4
pkgrel=1
pkgdesc="The systemd project's logind, extracted to a standalone package"
arch=('x86_64')
url="https://github.com/elogind/elogind"
depends=(
    'gcc-libs'
    'glibc'
    'libcap'
)
makedepends=(
    'acl'
    'audit'
    'dbus'
    'docbook-xsl'
    'git'
    'gperf'
    'intltool'
    'kexec-tools'
    'meson'
    'openrc'
    'pam'
    'python-jinja'
    'udev'
    'util-linux'
)
source=(
    "git+https://github.com/elogind/elogind.git#tag=v${pkgver}"
)
sha256sums=('34ef107a0aaf0a161eb097cb51d434079294e7425f514b92f7255a17897fc221')

build() {
    local meson_options=()

    meson_options+=(
        --libexecdir=/usr/lib/elogind
        --sbindir=/usr/bin

        -Dshared-lib-tag="${pkgver}-${pkgrel}"
        -Dmode=release

        -Ddefault-hierarchy=unified #hybrid
        -Dcgroup-controller=openrc

        -Ddefault-kill-user-processes=false
        -Dinstall-sysconfdir=true
        -Dsmack=true
        -Dutmp=true

        -Dman=enabled
        -Daudit=enabled
        -Dpolkit=enabled

        -Dselinux=disabled
        -Dxenctrl=disabled
        -Dfallback-hostname='artixlinux'

        -Dhalt-path=/usr/bin/halt
        -Dpoweroff-path=/usr/bin/poweroff
        -Dreboot-path=/usr/bin/reboot
        -Dkexec-path=/usr/bin/kexec
    )

    artix-meson "${pkgbase}" build "${meson_options[@]}"

    meson compile -C build
}

check(){
    meson test -C build --print-errorlogs
}

package_elogind() {
    pkgdesc="The systemd project's logind, extracted to a standalone package"
    depends+=(
        'acl' 'libacl.so'
        'audit' 'libaudit.so'
        'dbus'
        'kexec-tools'
        'libcap.so'
        'libelogind'
        'pam'
        'udev'
        'util-linux' 'libmount.so'
    )
    provides=(
        'logind'
    )
    optdepends=(
        'polkit: allow administration as unprivileged user'
    )
    backup=(
        'etc/elogind/logind.conf'
        'etc/elogind/sleep.conf'
    )
    license=('GPL-2.0-only' 'LGPL-2.1-only')


    meson install -C build --destdir "${pkgdir}"

    install -dm755 "${srcdir}"/_libelogind
    mv -v "${pkgdir}"/usr/lib/libelogind*.so* "${srcdir}"/_libelogind
    mv -v "${pkgdir}"/usr/lib/pkgconfig "${srcdir}"/_libelogind/
    mv -v "${pkgdir}"/usr/include "${srcdir}"/_libelogind/
    mv -v "${pkgdir}"/usr/share/man/man3 "${srcdir}"/_libelogind/
}

package_libelogind(){
    pkgdesc="elogind client libraries"
    depends+=(
        'libcap.so'
        'libudev'
    )
    provides=(
        'libelogind.so'
        'liblogind'
    )
    license=('LGPL-2.1-only')

    install -dm755 "${pkgdir}"/usr/{lib,share/man}
    mv -v "${srcdir}"/_libelogind/libelogind*.so* "${pkgdir}"/usr/lib
    mv -v "${srcdir}"/_libelogind/pkgconfig "${pkgdir}"/usr/lib/
    mv -v "${srcdir}"/_libelogind/include "${pkgdir}"/usr/
    mv -v "${srcdir}"/_libelogind/man3 "${pkgdir}"/usr/share/man
}
