# Maintainer: artoo <artoo@artixlinux.org>

pkgbase=artools
pkgname=('artools-base' 'artools-pkg' 'artools-iso')
pkgver=0.36.0
pkgrel=2
arch=('any')
pkgdesc='Development tools for Artix'
license=('GPL-1.0-or-later')
url='https://gitea.artixlinux.org/artix/artools'
makedepends=('git')
groups=('artix-tools' 'artools')
# checkdepends=('shellcheck')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('853e8f8992a168fe7d19777eb0cf88937d3321a289c868c1c6aecf8a339d0f79')

_patches=(
    950e0604a443c1bec39059f3c3d49f2336a81b07
)

# pkgver() {
#     cd ${_pkgbase}
#     git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

prepare() {
    cd "${pkgbase}"
    local _p
    for _p in "${_patches[@]}"; do
        git log --oneline -1 "${_p}"
        git cherry-pick -n "${_p}"
    done
}

build() {
    make -C "${pkgbase}" PREFIX=/usr BUILDTOOLVER="${pkgver}-${pkgrel}-${arch}"
}

# check() {
#     make -C "${pkgbase}" check || true
# }

package_artools-base() {
    pkgdesc='Development tools for Artix (base tools)'
    depends=('awk' 'bash' 'coreutils' 'grep'
            'pacman' 'util-linux' 'sed')
    optdepends=('artools-pkg: Artix package tools'
                'artools-iso: Artix iso tools')
    conflicts=('arch-install-scripts')

    make -C "${pkgbase}" PREFIX=/usr DESTDIR="${pkgdir}" install_base
}

package_artools-pkg() {
    pkgdesc='Development tools for Artix (packaging tools)'
    depends=('artools-base' 'awk' 'parallel' 'bash' 'rsync' 'go-yq'
            'openssh' 'diffutils' 'findutils' 'grep' 'sed' 'util-linux'
            'binutils' 'git' 'subversion' 'mercurial' 'bzr')
    optdepends=('pacman-contrib: pacman contrib tools support'
                'artix-rebuild-order: artix rebuild order support'
                'artix-checkupdates: updates checking'
                'graphviz: mkdepgraph graphviz support')
    backup=('etc/artools/artools-pkg.conf')

    make -C "${pkgbase}" PREFIX=/usr DESTDIR="${pkgdir}" install_pkg
}

package_artools-iso() {
    pkgdesc='Development tools for Artix (ISO tools)'
    depends=('artools-base' 'iso-profiles' 'squashfs-tools'
            'grub' 'dosfstools' 'libisoburn' 'bash' 'dosfstools'
            'e2fsprogs' 'libarchive' 'mtools' 'grep' 'sed' 'go-yq')
    backup=('etc/artools/artools-iso.conf')

    make -C "${pkgbase}" PREFIX=/usr DESTDIR="${pkgdir}" install_iso
}
