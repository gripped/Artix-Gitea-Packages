# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Wouter Wijsman <wwijsman@live.nl>
# Contributor: Duck Hunt <vaporeon@tfwno.gf>

pkgname=libretro-ppsspp
pkgver=20260622.173742.gae13b9b3e1e8
pkgrel=1
pkgdesc='Sony PlayStation Portable core'
arch=(x86_64)
url=https://github.com/hrydgard/ppsspp
license=(GPL-2.0-only)
groups=(libretro)
depends=(
  glibc
  libgcc
  libgl
  libretro-core-info
  libstdc++
  ppsspp-assets
)
makedepends=(
  git
  libglvnd
)
source=(
  libretro-ppsspp::git+https://github.com/hrydgard/ppsspp.git#commit=${pkgver##*.g}
  git+https://github.com/Kethen/aemu_postoffice.git
  git+https://github.com/Kingcom/armips.git
  git+https://github.com/google/cpu_features.git
  git+https://github.com/hrydgard/ppsspp-ffmpeg.git
  armips-filesystem::git+https://github.com/Kingcom/filesystem.git
  ppsspp-glslang::git+https://github.com/hrydgard/glslang.git
  git+https://github.com/hrydgard/ppsspp-lang.git
  git+https://github.com/rtissera/libchdr.git
  git+https://github.com/libretro/libretro-common.git
  git+https://github.com/hrydgard/ppsspp-lua.git
  git+https://github.com/miniupnp/miniupnp.git
  git+https://github.com/KhronosGroup/OpenXR-SDK.git
  git+https://github.com/Tencent/rapidjson.git
  git+https://github.com/RetroAchievements/rcheevos.git
  git+https://github.com/KhronosGroup/SPIRV-Cross.git
  git+https://github.com/facebook/zstd.git
  libretro-ppsspp-assets-path.patch
)
b2sums=('e26e47b7020fd7b23bc3166b75f8175cea3d822abc956b7af45842b4c11315b774d990a1f72fd6e2aef55cf4f09f222473107a9b43769f7ae03041732cfa9059'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'b46c8f4a147f1b8fddb8664982c4568e9cac74afad65cb16adbccaba26b93baf0f59dd51693a422bd64782c4a95cf8e2ff55e848701b2fb1e1e785ca611d1dc6')

prepare() {
  cd libretro-ppsspp
  patch -Np1 -i ../libretro-ppsspp-assets-path.patch
  for submodule in ffmpeg assets/lang ext/glslang ext/lua; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../ppsspp-${submodule#*/}
    git -c protocol.file.allow=always submodule update ${submodule}
  done
  for submodule in ext/{aemu_postoffice,armips,cpu_features,libchdr,miniupnp,OpenXR-SDK,rapidjson,rcheevos,SPIRV-Cross,zstd} libretro/libretro-common; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../${submodule#*/}
    git -c protocol.file.allow=always submodule update ${submodule}
  done
  cd ext/armips
  for submodule in ext/filesystem; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../../../armips-${submodule#*/}
    git -c protocol.file.allow=always submodule update ${submodule}
  done
}

build() {
  make -C libretro-ppsspp/libretro
}

package() {
  install -Dm 644 libretro-ppsspp/libretro/ppsspp_libretro.so -t "${pkgdir}"/usr/lib/libretro/
  install -Dm 644 libretro-ppsspp/LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/libretro-ppsspp/
}
