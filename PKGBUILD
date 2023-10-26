# Maintainer: artoo <artoo@artixlinux.org>

pkgbase=artools
pkgname=('artools-base' 'artools-pkg' 'artools-iso')
pkgver=0.31.6
pkgrel=2
arch=('any')
pkgdesc='Development tools for Artix'
license=('GPL')
url='https://gitea.artixlinux.org/artix/artools'
makedepends=('git')
groups=('artix-tools')
# checkdepends=('shellcheck')
source=("git+${url}.git#tag=${pkgver}"
        exclude-srcinfo.patch::https://gitea.artixlinux.org/artix/artools/commit/dc606af137235880512ce9f68b5ae800d7af5e3a.patch
        )
sha256sums=('SKIP'
            '730f2c32e1b8603e5838cc1466e6f4f7af0374bdc87045225c84b1e2e860cbaa')

_patches=(
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
    patch -Np 1 -i ../exclude-srcinfo.patch
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
    backup=('etc/artools/artools-base.conf')

    make -C "${pkgbase}" PREFIX=/usr DESTDIR="${pkgdir}" install_base
}

package_artools-pkg() {
    pkgdesc='Development tools for Artix (packaging tools)'
    depends=('artools-base' 'awk' 'parallel' 'bash' 'rsync' 'go-yq'
            'openssh' 'diffutils' 'findutils' 'grep' 'sed' 'util-linux'
            'binutils' 'git')
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
            'e2fsprogs' 'libarchive' 'mtools' 'grep' 'sed')
    backup=('etc/artools/artools-iso.conf')

    make -C "${pkgbase}" PREFIX=/usr DESTDIR="${pkgdir}" install_iso
}
