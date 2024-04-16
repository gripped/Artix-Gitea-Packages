# Maintainer: artoo <artoo@artixlinux.org>

_tag=252.23-r1

pkgbase=elogind
pkgname=('elogind' 'libelogind')
pkgver=${_tag/-r/.}
pkgrel=1
pkgdesc="The systemd project's logind, extracted to a standalone package"
arch=('x86_64')
url="https://github.com/elogind/elogind"
license=('GPL-1.0-only' 'LGPL-2.1-only')
makedepends=('acl' 'libacl.so' 'audit' 'libaudit.so' 'dbus' 'pam' 'gperf' 'kexec-tools'
             'libcap' 'libcap.so' 'udev' 'util-linux' 'libmount.so'
             'docbook-xsl' 'intltool' 'meson' 'openrc' 'python-jinja' 'git')
source=(
    "git+https://github.com/elogind/elogind.git#tag=v$_tag"
   # "${pkgbase}-${pkgver}.tar.gz::https://github.com/elogind/elogind/archive/v${_tag}.tar.gz"
   # 'elogind-252-docs.patch'
)
sha256sums=('5c90c799323b8af961067372f59f8c6a9cc947de7e7683fa24767bc987799737')

# prepare() {
#     cd ${pkgbase}-${pkgver}
#     patch -Np 1 -i ../elogind-252-docs.patch
# }

build() {
    local meson_options=(
        -Dshared-lib-tag="${pkgver}-${pkgrel}"
        -Dmode=release

        -Drootlibdir=/usr/lib
        -Drootlibexecdir=/usr/lib/elogind
        -Ddbuspolicydir=/usr/share/dbus-1/system.d
        -Dudevrulesdir=/usr/lib/udev/rules.d
        -Ddocdir=/usr/share/doc/elogind
        -Ddefault-hierarchy=hybrid
        -Dcgroup-controller=openrc
        -Ddefault-kill-user-processes=false
        -Dman=true
        -Dsmack=true
        -Daudit=true
        -Dpolkit=true
        -Dinstall-sysconfdir=true
        -Dutmp=true
    )

    artix-meson "${pkgbase}" build "${meson_options[@]}"

    meson compile -C build
}

check(){
    meson test -C build --print-errorlogs
}

package_elogind() {
    pkgdesc="The systemd project's logind, extracted to a standalone package"
    depends=('glibc' 'gcc-libs' 'acl' 'libacl.so' 'audit' 'libaudit.so' 'dbus'
             'kexec-tools' 'libcap' 'libcap.so'
             'libelogind' 'pam' 'udev' 'util-linux' 'libmount.so')
    provides=('logind')
    optdepends=('polkit: allow administration as unprivileged user')
    backup=('etc/elogind/logind.conf'
            'etc/elogind/sleep.conf')

    meson install -C build --destdir "${pkgdir}"

    install -dm755 "${srcdir}"/_libelogind
    mv -v "${pkgdir}"/usr/lib/libelogind*.so* "${srcdir}"/_libelogind
    mv -v "${pkgdir}"/usr/lib/pkgconfig "${srcdir}"/_libelogind/
    mv -v "${pkgdir}"/usr/include "${srcdir}"/_libelogind/
    mv -v "${pkgdir}"/usr/share/man/man3 "${srcdir}"/_libelogind/
}

package_libelogind(){
    pkgdesc="elogind client libraries"
    depends=('glibc' 'gcc-libs' 'libcap' 'libcap.so' 'libudev')
    provides=('libelogind.so' 'liblogind')

    install -dm755 "${pkgdir}"/usr/{lib,share/man}
    mv -v "${srcdir}"/_libelogind/libelogind*.so* "${pkgdir}"/usr/lib
    mv -v "${srcdir}"/_libelogind/pkgconfig "${pkgdir}"/usr/lib/
    mv -v "${srcdir}"/_libelogind/include "${pkgdir}"/usr/
    mv -v "${srcdir}"/_libelogind/man3 "${pkgdir}"/usr/share/man
}
