# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_url=https://gitea.artixlinux.org/artix/alpm-hooks

_commit=70445d2177e0fca7d5a29563ecd8b177c59a2271

pkgname=base
pkgver=3
pkgrel=4
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
sha256sums=('SKIP')

package() {
    # pacman hooks
    make -C alpm-hooks DESTDIR="${pkgdir}" install_base

    # artix-service wrapper
    make -C alpm-hooks DESTDIR="${pkgdir}" install_wrapper

    # provide default symlink for PM file tracking
    ln -svf openrc-init "${pkgdir}"/usr/bin/init
}

# vim: ts=2 sw=2 et:
