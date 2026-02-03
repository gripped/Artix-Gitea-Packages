# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=nsight-compute
pkgver=2025.4.1.2
pkgrel=1
pkgdesc="Interactive profiler for NVIDIA CUDA and OptiX"
arch=(x86_64 aarch64)
url="https://developer.nvidia.com/nsight-compute"
license=(LicenseRef-NVIDIA-SLA)
depends=(
  dbus
  fontconfig
  glib2
  glibc
  libdrm
  libglvnd
  libx11
  libxcb
  libxext
  libxi
  libxkbcommon
  libxkbcommon-x11
  libxkbfile
  libxshmfence
  nspr
  nss
  wayland
  xcb-util-cursor
  xcb-util-image
  xcb-util-keysyms
  xcb-util-renderutil
  # there are bundled libs: boost, gcc-libs, icu, libssh, libz, openssl, qt6, zstd
)
optdepends=(
  'cuda: for profiling on the local system'
)
options=(!debug !strip)
source_x86_64=(https://developer.download.nvidia.com/compute/cuda/redist/${pkgname/-/_}/linux-x86_64/${pkgname/-/_}-linux-x86_64-$pkgver-archive.tar.xz)
source_aarch64=(https://developer.download.nvidia.com/compute/cuda/redist/${pkgname/-/_}/linux-sbsa/${pkgname/-/_}-linux-sbsa-$pkgver-archive.tar.xz)
source=(nsight-compute.desktop)
b2sums_x86_64=('1613ba900df0e7e3adc2c05de48e57e19f5dcb062ceee4a2ab0e2ed19de16415d0d0ff1640fc5dbcbcd8457f7af99fbca9066b1ab60681e6d9b87e2540771e99')
b2sums_aarch64=('6f1d0ae54e544f665f0c58c083f7469b6f29fbc7bedcade8b039f9161b8b20bc88333701f01febb8556befadfd06c87af7c44a69cdce3435d90770093287a9e2')
b2sums=('3dc305bcdbf6927a3645ce4c2bb4e251d45f3fe026710f54c8cc5949c8037780df0b75b5f76e4052cdb5992bc5f88d6ef582966d7b9f78e0a594b4dfc87e7e67')

prepare()
{
  if [[ $CARCH = aarch64 ]]; then
    sed -i 's/glibc_2_11_3-x64/t210-a64/g' $pkgname.desktop
  fi
}

package() {
  cd ${pkgname/-/_}-linux-*-${pkgver}-archive

  install -vdm 755 "$pkgdir"/usr/lib/$pkgname/
  cp -arv extras host ncu ncu-ui sections target "$pkgdir"/usr/lib/$pkgname/

  # create symlinks in /usr/bin/
  install -vdm 755 "$pkgdir"/usr/bin
  ln -s -t "$pkgdir"/usr/bin/ ../lib/$pkgname/{ncu,ncu-ui}

  # install documentation
  install -vdm 755 "$pkgdir"/usr/share/doc/$pkgname/
  cp -arv docs/* "$pkgdir"/usr/share/doc/$pkgname/

  # install license
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # install desktop entry
  install -vDm 644 -t "$pkgdir"/usr/share/applications/ ../$pkgname.desktop
}
