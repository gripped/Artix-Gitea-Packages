# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_v=1.6
_url=https://gitea.artixlinux.org/artix/alpm-hooks

pkgname=base
pkgver=3
pkgrel=1.5
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
optdepends=('linux: bare metal support')
source=("alpm-hooks-$_v.tar.gz::$_url/archive/$_v.tar.gz")
sha256sums=('f2ec8bc5d7ad7c9e1dec2477c64aba971e12b1f4b4bd24c3158cf43e20d1a97a')

package() {
    # pacman hooks
    make -C alpm-hooks DESTDIR="${pkgdir}" install_base

    # artix-svc wrapper
    make -C alpm-hooks DESTDIR="${pkgdir}" install_wrapper

    # provide default symlink for PM file tracking
    install -d "${pkgdir}"/usr/bin
    ln -svf openrc-init "${pkgdir}"/usr/bin/init
}

# vim: ts=2 sw=2 et:
