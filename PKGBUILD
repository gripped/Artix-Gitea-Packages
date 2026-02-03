# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Adria Arrufat <adria.arrufat AT protonmail+aur DOT com>
# Contributor: Sami B. <spidermario@free.fr>
# Contributor: Yunhui Fu <yhfdev@gmail.com>

pkgname=cudnn
pkgver=9.18.1.3
_cudaver=13
pkgrel=1
pkgdesc="NVIDIA CUDA Deep Neural Network library"
arch=(x86_64 aarch64)
url="https://developer.nvidia.com/cuDNN"
license=(LicenseRef-NVIDIA-cuDNN)
depends=(
  "cuda>=${_cudaver}"
  glibc
  gcc-libs
  zlib libz.so
)
options=(!strip)
# To figure out these URLs, check out the Dockerfiles at
# https://gitlab.com/nvidia/container-images/cuda/-/tree/master/dist for the appropriate cuda version
# or make an NVIDIA Developer account.
# Alternatively, check https://github.com/pytorch/builder/blob/master/common/install_cuda.sh
# or https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/
# or https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/
source_x86_64=("https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-${pkgver}_cuda${_cudaver}-archive.tar.xz")
source_aarch64=("https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-${pkgver}_cuda${_cudaver}-archive.tar.xz")
b2sums_x86_64=('b7af48737fb929dde2e4a301035bdac3b447e1a2c3eaf2d9f40759aad40019055f4dd244fb73dac3700436e6180f8378e08876639688376b9f70893bd7d18f59')
b2sums_aarch64=('dd3b3e8fa995f2e4ef05520959295789c17ac9128f8d4ee7ed345c48a3363dad876f6dbd0aea581b85c179ae642b986711e584ff0484d0990bb331a175b7bdc6')

package() {
  cd cudnn-linux-*-${pkgver}_cuda${_cudaver}-archive

  mkdir "$pkgdir"/usr
  cp -rv lib include "$pkgdir"/usr

  # remove static libs
  rm "$pkgdir"/usr/lib/*.a

  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim: ts=2 sw=2 et
