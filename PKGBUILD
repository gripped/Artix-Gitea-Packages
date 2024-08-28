# Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

pkgname=btrfs-progs
pkgver=6.10.1
pkgrel=2
pkgdesc='Btrfs filesystem utilities'
arch=('x86_64')
makedepends=('git' 'asciidoc' 'xmlto' 'udev' 'python' 'python-setuptools' 'e2fsprogs' 
             'python-sphinx' 'python-sphinx_rtd_theme')
depends=('glibc' 'util-linux-libs' 'lzo' 'zlib' 'zstd' 'libgcrypt' 'libudev')
optdepends=('python: libbtrfsutil python bindings'
            'e2fsprogs: btrfs-convert')
url='https://btrfs.readthedocs.io'
replaces=('btrfs-progs-unstable')
conflicts=('btrfs-progs-unstable')
provides=('btrfs-progs-unstable')
license=('GPL-2.0-only')
validpgpkeys=('F2B41200C54EFB30380C1756C565D5F9D76D583B')
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git?signed#tag=v${pkgver}"
        'initcpio-install-btrfs'
        'initcpio-hook-btrfs'
      )
b2sums=('2704650efc795e8e01670306959781cf10d9837da227ffb15ffcd81d09751c8070e01edd834287c65fcb25dd0889a5060c36fc033affd32160b37c27270e137c'
        '75659665a24f92bba1175a2fcae942d9851495c9cff88570b88a98dced4eb98fcc9879de044bfc7d560dbe1c71a20d7ae51ca4b7c2649f90d646b414e0864b6e'
        '0d3c25d0cb6fdb8e8777723b5e199835fac25573bc8f7fcb248ccfeea7268752b7100dd2c8284529812f0b1d3943eceb5785f119959f89bffedcf30472a915db')

prepare() {
  cd $pkgname
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

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr --with-crypto=libgcrypt
  make
}

check() {
  cd $pkgname
 ./btrfs filesystem show
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install install_python

  # install bash completion (FS#44618)
  install -Dm644 btrfs-completion "$pkgdir/usr/share/bash-completion/completions/btrfs"

  # install mkinitcpio hooks
  cd "$srcdir"
  install -Dm644 initcpio-install-btrfs "$pkgdir/usr/lib/initcpio/install/btrfs"
  install -Dm644 initcpio-hook-btrfs "$pkgdir/usr/lib/initcpio/hooks/btrfs"

  # install scrub service/timer
}

