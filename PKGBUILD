# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_url=https://gitea.artixlinux.org/artix/alpm-hooks

_commit=1825aad3b91ee9459f7cdbb380b45b018daa96ab

pkgname=base
pkgver=3
pkgrel=6.5
pkgdesc='Minimal package set to define a basic Artix Linux installation'
url='https://www.artixlinux.org'
arch=('any')
license=('GPL')
depends=(
  # very very base
  'filesystem' 'gcc-libs' 'glibc' 'bash'

  # POSIX tools
  'coreutils' 'file' 'findutils' 'gawk' 'grep' 'procps-ng' 'sed' 'tar'

  # standard linux toolset
  'gettext' 'pciutils' 'psmisc' 'shadow' 'util-linux' 'bzip2' 'gzip' 'xz'

  # distro defined requirements
  'licenses' 'pacman' 'artix-keyring' 'init-logind' 'esysusers' 'etmpfiles'

  # networking, ping, etc
  'iputils' 'iproute2'
)
makedepends=('git')
optdepends=('linux: bare metal support')
source=(
    "git+$_url.git#commit=$_commit"
)
sha256sums=('408446864bb6dc80d7c1c16dfefb9024e49dc15b59daae8cee5e90f34dd81c39')

package() {
    # pacman hooks
    make -C alpm-hooks DESTDIR="${pkgdir}" install_base

    # artix-service wrapper
    make -C alpm-hooks DESTDIR="${pkgdir}" install_wrapper

    # provide default symlink for PM file tracking
    ln -svf openrc-init "${pkgdir}"/usr/bin/init
}

# vim: ts=2 sw=2 et:
