# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-fontconfig
pkgver=2.18.0
pkgrel=3
epoch=2
pkgdesc="Library for configuring and customizing font access"
url=https://www.freedesktop.org/wiki/Software/fontconfig/
arch=(x86_64)
license=('HPND AND Unicode-DFS-2016')
depends=(
  fontconfig
  lib32-expat
  lib32-freetype2
  lib32-glibc
)
makedepends=(
  git
  gperf
  meson
)
install=fontconfig-32.install
source=(
  "git+https://gitlab.freedesktop.org/fontconfig/fontconfig.git#tag=$pkgver"
  fontconfig-32.hook
)
b2sums=('b345126ee3216aaa0feb79a4bb9d41c33b116862242e547eab9c217db2220205edbdd67893d1d8917c4a469da5a75cce0526d31b4c792b38815e4a70b4c6b750'
        '1cba71810c9bde6ecb6fac124e458fb7260be3ea72ade82b836e0e8e1eaa7c7df31e6e92e405fa420325cec0ce14d0f19630e777308032b0c26ec96a3d668d93')
validpgpkeys=(
  F77A64C4B5B45FF8763A278F65755979B34E1294 # Akira TAGOH <akira@tagoh.org>
  ECFFBC3A6B365E721E5BD79830757AA21971A672 # Akira TAGOH <akira@tagoh.org>
)

prepare() {
  cd fontconfig

  # Remove macos-specific config
  # https://gitlab.freedesktop.org/fontconfig/fontconfig/-/merge_requests/519
  git cherry-pick -n 05961325dc9a37d992e3ee9e9deed0877b8ac56f

  # Fix font matching
  # https://gitlab.archlinux.org/archlinux/packaging/packages/fontconfig/-/work_items/6
  # https://gitlab.freedesktop.org/fontconfig/fontconfig/-/merge_requests/520
  git cherry-pick -n ec3ac5609a95d9338744d2e39af3a29c6349d2d5

  # Fix Firefox crash
  # https://gitlab.archlinux.org/archlinux/packaging/packages/fontconfig/-/work_items/7
  # https://gitlab.freedesktop.org/fontconfig/fontconfig/-/merge_requests/521
  git cherry-pick -n 80191ec6a13e1d2172ee9e70e2d50d1e04b6fb0e

  # More font matching fixes
  git cherry-pick -n e17806afda817cf8ba2fe6e0d063617994dcdc0f
  git cherry-pick -n 66757ccdbd43260bba3195265311cf8ca268f0d4
}

build() {
  local meson_options=(
    --cross-file lib32
    -D doc=disabled
  )

  artix-meson fontconfig build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(
    libexpat.so
    libfreetype.so
  )
  provides+=(libfontconfig.so)

  meson install -C build --destdir "$pkgdir"

  rm -r "$pkgdir"/{etc,usr/{include,share},var}

  mv "$pkgdir"/usr/bin/fc-cache{,-32}
  find "$pkgdir"/usr/bin -type f -not -name '*-32' -delete

  install -Dm644 *.hook -t "$pkgdir/usr/share/libalpm/hooks"
  install -Dm644 fontconfig/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
