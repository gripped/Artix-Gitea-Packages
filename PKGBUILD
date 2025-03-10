# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: Chris Cromer <cromer@artixlinux.org>
# Contributor: williamh <williamh@gentoo.org>

_url=https://gitea.artixlinux.org/artix
_extra=1.2
_alpm=2.2

pkgname=openrc
pkgver=0.60.1
pkgrel=8
pkgdesc="OpenRC is a dependency-based init system that works with the system-provided init program"
arch=('x86_64')
url="https://github.com/OpenRC/openrc"
license=('BSD-2-Clause')
makedepends=('git' 'meson')
depends=(
    'audit' 'libaudit.so'
    'bash'
    'glibc'
    'inetutils'
    'libcap' 'libcap.so'
    'netifrc'
    'pam' 'libpam.so'
    'psmisc'
    'perl'
)
optdepends=(
    'networkmanager-openrc: networkmanager init script'
    'elogind-openrc: elogind init script'
)
provides=(
    'init-rc'
    'svc-manager'
    'librc.so'
    'libeinfo.so'
)
conflicts=('init-rc' 'svc-manager')
replaces=(openrc-{deptree2dot,{bash,zsh}-completions})
backup=(
    'etc/rc.conf'
    'etc/conf.d/consolefont'
    'etc/conf.d/keymaps'
    'etc/conf.d/hostname'
    'etc/conf.d/modules'
    'etc/conf.d/hwclock'
    'etc/conf.d/etmpfiles-dev'
    'etc/conf.d/etmpfiles-setup'
    'etc/conf.d/udev'
    'etc/conf.d/udev-trigger'
    'etc/conf.d/udev-settle'
    'etc/conf.d/agetty.tty'{1,2,3,4,5,6}
)
source=(
    "git+${url}.git#tag=${pkgver}"
    'openrc.logrotate'
    'sysctl.conf'
    'openrc-user.pam'
    "openrc-rc-conf-artix.patch" #::${_url}/openrc/commit/6f9e4c6b4bebebad2f00d1c19bf1f93c707d9a09.patch"
    "openrc-artix-meson.patch" #::${_url}/openrc/commit/05b1fd974c71041265a862ca3a2ba4fc79e797cc.patch"
    "git+${_url}/openrc-extra.git#tag=${_extra}"
    "git+${_url}/alpm-hooks.git#tag=${_alpm}"
)
sha256sums=('02f561526ad1a85e164c72a0c1648e49f2d758c315616af795dc49f3f975f265'
            '0b44210db9770588bd491cd6c0ac9412d99124c6be4c9d3f7d31ec8746072f5c'
            '874e50bd217fef3a2e3d0a18eb316b9b3ddb109b93f3cbf45407170c5bec1d6d'
            '5b6a7ceb46f057581dcdce76794c045b711ff2a8f063ced0dba682697da9ef06'
            '1f6f7a11e6937a1c9d23959e4bf4a6b04937f955a21e4e0e5be9e9e480835bcd'
            'd910a8084ca8fab5d4e28c888d3f424c0ec51ac947c2e385722a8806b781da61'
            '88c2ddad5ac5d347962ce9805a0ed7a4f1737aaafa3d6a8c0a7a55009ce5fef1'
            'f29110a8222b2d67a31918869ae8261bdf35d3404cd1effbb3f9fcfa97cdbb25')

prepare() {
    cd "${pkgname}"
    # apply patch from the source array (should be a pacman feature)
    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 < "../$src"
    done
}

check(){
    meson test -C build --print-errorlogs
}

build(){
    local _meson_options=()
    _meson_options+=(
        -Dbranding="\"Artix Linux\""
        -Dos=Linux
        --sbindir=/usr/bin
        --bindir=/usr/bin
        -Dshell=/bin/bash
        -Dpam=true
        -Dsysvinit=true
        -Dpkgconfig=true
        -Dbash-completions=true
        -Dzsh-completions=true
        -Dnewnet=false
        -Daudit=enabled
        -Dselinux=disabled
        -Dlibrcdir=openrc
    )

    artix-meson "${pkgname}" build "${_meson_options[@]}"

    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"

    # user pam
    install -m755 "$srcdir"/openrc-user.pam "$pkgdir"/etc/pam.d/openrc-user

    install -Dm644 "${srcdir}/${pkgname}".logrotate "${pkgdir}"/etc/logrotate.d/"${pkgname}"

    install -d "${pkgdir}"/usr/lib/{openrc/cache,binfmt.d,sysctl.d}

    # sysctl defaults
    install -m755 "${srcdir}"/sysctl.conf "${pkgdir}"/usr/lib/sysctl.d/50-default.conf

    # license
    install -Dm644 "${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

    # openrc extra; agetty,kmod,udev,tmpfiles,sysusers
    make -C "${pkgname}"-extra DESTDIR="${pkgdir}" install

    # pacman hooks
    make -C alpm-hooks DESTDIR="${pkgdir}" install_openrc

    # remove suport dir
    rm -r "${pkgdir}"/usr/share/openrc

    # remove init symlink
    rm -v "${pkgdir}"/usr/bin/init

    install -m755 "${pkgname}"/support/deptree2dot/deptree2dot "${pkgdir}"/usr/bin/deptree2dot
}
