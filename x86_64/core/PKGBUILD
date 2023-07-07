# Maintainer: artoo <artoo@artixlinux.org>

pkgbase=elogind
pkgname=('elogind' 'libelogind')
pkgver=252.9
pkgrel=2
pkgdesc="The systemd project's logind, extracted to a standalone package"
arch=('x86_64')
url="https://github.com/elogind/elogind"
license=('GPL' 'LGPL2.1')
makedepends=('acl' 'libacl.so' 'audit' 'libaudit.so' 'dbus' 'pam' 'gperf' 'kexec-tools'
             'libcap' 'libcap.so' 'udev' 'util-linux' 'libmount.so'
             'docbook-xsl' 'intltool' 'meson' 'openrc' 'python-jinja' )
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/elogind/elogind/archive/v${pkgver}.tar.gz"
        'elogind-252-docs.patch')
sha256sums=('7af8caa8225a406e77fb99c9f33dba5e1f0a94f0e1277c9d91dcfc016f116d85'
            'c4153ec89c4deee33e019c168a71b7f1052ff5b24dc747a847cf295a4b54749f')

prepare() {
    cd ${pkgbase}-${pkgver}
    patch -Np 1 -i ../elogind-252-docs.patch
}

build() {
    local meson_options=(
        -Dshared-lib-tag="${pkgver}-${pkgrel}"
        -Dmode=release

        -Dsbat-distro='artix'
        -Dsbat-distro-summary='Artix Linux'
        -Dsbat-distro-pkgname="${pkgname}"
        -Dsbat-distro-version="${pkgver}"

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

    artix-meson "${pkgbase}-${pkgver}" build "${meson_options[@]}"

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

#     ln -sfv libelogind.so "${pkgdir}"/usr/lib/libsystemd.so
#     ln -sfv libsystemd.so "${pkgdir}"/usr/lib/libsystemd.so.0
#
#     ln -sfv libelogind.pc "${pkgdir}"/usr/lib/pkgconfig/libsystemd.pc
}
