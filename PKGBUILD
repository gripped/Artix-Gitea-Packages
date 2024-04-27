# Maintainer: artoo <artoo@artixlinux.org>

pkgbase=artools
pkgname=('artools-base' 'artools-pkg' 'artools-iso')
pkgver=0.34.0
pkgrel=1
arch=('any')
pkgdesc='Development tools for Artix'
license=('GPL-1.0-or-later')
url='https://gitea.artixlinux.org/artix/artools'
makedepends=('git')
groups=('artix-tools' 'artools')
# checkdepends=('shellcheck')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('7e271995fb752fbb92dfa9e5988f366ed59358df453d15ca5023b7e704b349f8')

_patches=(
    e81eac20212c8011b1f75315c3960adffa09caf6 # usage fix
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
