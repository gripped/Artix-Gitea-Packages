# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Janax <janax99@yahoo.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=lib32-pam
pkgver=1.7.0
pkgrel=1
pkgdesc='Pluggable Authentication Modules'
arch=(x86_64)
url=http://linux-pam.org
license=(GPL2)
depends=(
  lib32-audit
  lib32-libnsl
  lib32-libtirpc
  lib32-libxcrypt
  lib32-elogind
  pam
)
makedepends=(
  fop
  git
  lib32-flex
  meson
  w3m
)
_tag=v$pkgver
source=(git+https://github.com/linux-pam/linux-pam.git?#tag=${_tag}
       use_elogind.patch)
validpgpkeys=(296D6F29A020808E8717A8842DB5BD89A340AEB7) # Dimitry V. Levin <ldv@altlinux.org>
b2sums=('88ecba59692fe86f6f6516007b87fb897018cc5f818c106a037f15df4dda7c31e50fbfcb137493d49cb754e41f2f69a60f24ffea3374ff5e38ce6263bfa7abac'
        '2a60a23eb74dc0f0b3ae5102188eeee1048e16d35c6512067068fa8c6741ca33b4de755ab5e9afb524e416b7b2344ec40ef32b84ff51d220bfcabaff9c6d4919')
options=(!emptydirs)

pkgver() {
  cd linux-pam

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd linux-pam
  patch -Np1 -i ../use_elogind.patch
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  artix-meson linux-pam \
    --libdir=lib32 \
    -Ddocs=disabled \
    -Deconf=disabled \
    -Dselinux=disabled \
    -Dpam_userdb=disabled \
    build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
#  make DESTDIR="${pkgdir}" SCONFIGDIR=/etc/security -C linux-pam install
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,lib,share}}
}

# vim: ts=2 sw=2 et:
