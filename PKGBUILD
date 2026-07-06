# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=libva
pkgver=2.24.0
pkgrel=2
pkgdesc='Video Acceleration (VA) API for Linux'
arch=(x86_64)
url=https://intel.github.io/libva/
license=(MIT)
depends=(
  glibc
  libdrm
  libgl
  libx11
  libxcb
  libxext
  libxfixes
  wayland
)
makedepends=(
  git
  libglvnd
  mesa
  meson
)
optdepends=(
  'intel-media-driver: backend for Intel GPUs (>= Broadwell)'
  'libva-intel-driver: backend for Intel GPUs (<= Haswell)'
  'libva-mesa-driver: backend for AMD and NVIDIA GPUs'
)
provides=(
  libva-drm.so
  libva-glx.so
  libva-wayland.so
  libva-x11.so
  libva.so
)
backup=(etc/libva.conf)
source=(git+https://github.com/intel/libva.git#tag=${pkgver})
b2sums=('17613d834f6be6bf1c1d5502bed8ab64c6665b7870b5aa74176fcc1f23cad5f255c2326e4f3be49025c4d79a4fa5a53a8800d108e89ddfb856b0bee3620dddb1')

build() {
  CFLAGS+=" -DENABLE_VA_MESSAGING" # Option missing
  artix-meson libva build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm 644 libva/COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm 644 /dev/stdin "${pkgdir}"/etc/libva.conf <<END
LIBVA_MESSAGING_LEVEL=1
END
}
