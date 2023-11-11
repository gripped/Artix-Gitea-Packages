# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gnupg
pkgver=2.4.3
pkgrel=1
pkgdesc='Complete and free implementation of the OpenPGP standard'
arch=(x86_64)
url='https://www.gnupg.org/'
license=(
  BSD-2-Clause
  BSD-3-Clause
  CC0-1.0
  GPL-2.0-or-later
  GPL-3.0-or-later
  LGPL-2.1-or-later
  'LGPL-3.0-or-later OR GPL-2.0-or-later'
  MIT
  Unicode-TOU
)
depends=(
  bzip2 libbz2.so
  glibc
  gnutls
  libgcrypt
  libgpg-error
  libksba
  libassuan libassuan.so
  libldap
  libusb
  npth libnpth.so
  pinentry
  readline libreadline.so
  sh
  sqlite
  tpm2-tss
  zlib
)
makedepends=(pcsclite)
checkdepends=(openssh)
optdepends=(
  'pcsclite: for using scdaemon not with the gnupg internal card driver'
)
install=$pkgname.install
source=(
  https://gnupg.org/ftp/gcrypt/$pkgname/$pkgname-$pkgver.tar.bz2{,.sig}
  $pkgname-2.4-avoid_beta_warning.patch  # do not emit beta warnings (due to misbehaving build system)
  $pkgname-2.4-drop_import_clean.patch  # do not potentially remove components on certificates during import
  $pkgname-2.4-revert_default_rfc4880bis.patch  # v5 is incompatible with other implementations and v6
)
sha256sums=('a271ae6d732f6f4d80c258ad9ee88dd9c94c8fdc33c3e45328c4d7c126bd219d'
            'SKIP'
            '243c3a79295519b3931f9d846cf2af5caa064a78de812ee336dc786c1567b4d0'
            '6ade15b536c50a88efc2d9dc958433b0ccfaf2908025b7672753e6bfce51c3c6'
            'ef2267eecd9eb59bbbbdb97d55cbfe10236b4979a125c6683a840830bc202905')
b2sums=('b7f4f5e548ec6dfc89cf8792f507ee8642e8500692998cf8d2edc9f5d8002904d24a714b9caffabee6094707c4595e0f54197535135622a7a32aa772f5818f28'
        'SKIP'
        '168855b598714abb27e01e52e0ed1e1a01ab14ffb2ee09d759308375359cd28c0a9f96c6b9dee0a2cc5713aec8ea831858d59f56a0a126bca3e1401b078fc7ab'
        '0b9546c102724f1dbb90ad3c45307eed3491a5ea79940eba1184e6d466f399f279a23e73bac6b0bb0d662aa4599d0a4a0f331b0df3fe7fa6e7590c1074fc2ed1'
        '009c1a935021c987cd3c15581250090edfcd1a6dd30622db2701295f047384e03ba97590ca6993d410e81a6fd7c274468cd58a1904d51f432d572df39ee178d6')
validpgpkeys=(
  '5B80C5754298F0CB55D8ED6ABCEF7E294B092E28' # Andre Heinecke (Release Signing Key)
  '6DAA6E64A76D2840571B4902528897B826403ADA' # Werner Koch (dist signing 2020)
  'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD' # Niibe Yutaka (GnuPG Release Key)
  '02F38DFF731FF97CB039A1DA549E695E905BA208' # GnuPG.com (Release Signing Key 2021)
)

prepare() {
  cd $pkgname-$pkgver

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # improve reproducibility
  rm doc/gnupg.info*

  ./autogen.sh
}

build() {
  local configure_options=(
    --enable-maintainer-mode
    --libexecdir=/usr/lib/gnupg
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir=/etc
  )

  cd $pkgname-$pkgver
  ./configure "${configure_options[@]}"
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  ln -s gpg "$pkgdir"/usr/bin/gpg2
  ln -s gpgv "$pkgdir"/usr/bin/gpgv2

  install -Dm 644 COPYING.{CC0,other} -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
