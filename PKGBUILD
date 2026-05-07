# Maintainer: artoo <artoo@artixlinux.org>

_tag=257.13

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
sha256sums=('6068f9af2892390b6f7f374144868a6fa6b7402add8ef29c1d5673785f16a312')

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
        'etc/elogind/logind.conf.d/10-elogind.conf'
        'etc/elogind/sleep.conf.d/10-elogind.conf'
    )
    license=('GPL-2.0-only' 'LGPL-2.1-only')


    meson install -C build --destdir "${pkgdir}"

    install -dm755 "${srcdir}"/_libelogind
    mv -v "${pkgdir}"/usr/lib/libelogind*.so* "${srcdir}"/_libelogind
    mv -v "${pkgdir}"/usr/lib/libnss_elogind*.so* "${srcdir}"/_libelogind
    mv -v "${pkgdir}"/usr/lib/pkgconfig "${srcdir}"/_libelogind/
    mv -v "${pkgdir}"/usr/include "${srcdir}"/_libelogind/
    mv -v "${pkgdir}"/usr/share/man/man3 "${srcdir}"/_libelogind/

#     install -Dm644 /dev/stdin "${pkgdir}"/etc/elogind/sleep.conf.d/50-artix.conf <<END
# [Sleep]
# SuspendMode=deep s2idle
# END
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
        'libnss_elogind.so'
        # 'nss-myhostname'
    )
    # conflicts=(
    #     'nss-myhostname'
    # )
    # replaces=(
    #     'nss-myhostname'
    # )
    license=('LGPL-2.1-only')

    install -dm755 "${pkgdir}"/usr/{lib,share/man}
    mv -v "${srcdir}"/_libelogind/libelogind*.so* "${pkgdir}"/usr/lib
    mv -v "${srcdir}"/_libelogind/libnss_elogind*.so* "${pkgdir}"/usr/lib
    mv -v "${srcdir}"/_libelogind/pkgconfig "${pkgdir}"/usr/lib/
    mv -v "${srcdir}"/_libelogind/include "${pkgdir}"/usr/
    mv -v "${srcdir}"/_libelogind/man3 "${pkgdir}"/usr/share/man
}
