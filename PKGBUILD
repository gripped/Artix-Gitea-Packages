# Maintainer: artoo <artoo@artixlinux.org>

_tag=257.14
_req=257

pkgbase=elogind
pkgname=('elogind' 'libelogind')
pkgver=${_tag/-r/.}
pkgrel=1
pkgdesc="The systemd project's logind, extracted to a standalone package"
arch=('x86_64')
url="https://github.com/elogind/elogind"
depends=(
    'libgcc'
    'libstdc++'
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
    'libutempter'
    'meson'
    'pam'
    'python-jinja'
    'udev'
    'util-linux'
)
source=(
    "git+https://github.com/elogind/elogind.git#tag=v${_tag}"
)
sha256sums=('79c4d514403bbbf824b33f11d697b2f37b8fcc47484075baedca2d0faa9cb3b9')

_backports=(
)

_reverts=(
)

prepare() {
    cd "${pkgbase}"

    local _c
    for _c in "${_backports[@]}"; do
        git log --oneline -1 "${_c}"
        git cherry-pick -n "${_c}"
    done
    for _c in "${_reverts[@]}"; do
        git log --oneline -1 "${_c}"
        git revert -n "${_c}"
    done
}

build() {
    local meson_options=()

    meson_options+=(
        --libexecdir=/usr/lib/elogind
        -Dversion-tag="${pkgver}-${pkgrel}-artix"
        -Dshared-lib-tag="${pkgver}-${pkgrel}"
        -Dmode=release

        -Ddefault-hierarchy='unified'
        -Dcgroup-controller='openrc'

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
        "libelogind=${pkgver}"
        'pam'
        "udev>=${_req}"
        'util-linux' 'libmount.so'
    )
    provides=(
        "logind=${pkgver}"
    )
    optdepends=(
        'polkit: allow administration as unprivileged user'
    )
    backup=(
        'etc/elogind/logind.conf'
        'etc/elogind/sleep.conf'
        'etc/elogind/logind.conf.d/10-elogind.conf'
        'etc/elogind/sleep.conf.d/10-elogind.conf'
    )
    license=('GPL-2.0-only' 'LGPL-2.1-only')


    meson install -C build --destdir "${pkgdir}"

    install -dm755 "${srcdir}"/_libelogind
    mv -v "${pkgdir}"/usr/lib/lib{,nss_}elogind*.so* "${srcdir}"/_libelogind
    mv -v "${pkgdir}"/usr/lib/pkgconfig "${srcdir}"/_libelogind/
    mv -v "${pkgdir}"/usr/include "${srcdir}"/_libelogind/
    mv -v "${pkgdir}"/usr/share/man/man3 "${srcdir}"/_libelogind/
}

package_libelogind(){
    pkgdesc="elogind client libraries"
    depends+=(
        'libcap.so'
        "libudev>=${_req}"
    )
    provides=(
        'libelogind.so'
        "liblogind=${pkgver}"
    )
    license=('LGPL-2.1-only')

    install -dm755 "${pkgdir}"/usr/{lib,share/man}
    mv -v "${srcdir}"/_libelogind/lib{,nss_}elogind*.so* "${pkgdir}"/usr/lib
    mv -v "${srcdir}"/_libelogind/pkgconfig "${pkgdir}"/usr/lib/
    mv -v "${srcdir}"/_libelogind/include "${pkgdir}"/usr/
    mv -v "${srcdir}"/_libelogind/man3 "${pkgdir}"/usr/share/man
}
