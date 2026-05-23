# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=fontconfig
pkgver=2.18.0
pkgrel=2
epoch=2
pkgdesc="Library for configuring and customizing font access"
url=https://www.freedesktop.org/wiki/Software/fontconfig/
arch=(x86_64)
license=('HPND AND Unicode-DFS-2016')
depends=(
  bash
  expat
  freetype2
  glibc
)
makedepends=(
  docbook-sgml
  docbook-utils
  git
  gperf
  meson
  perl-sgmls
)
provides=(fontconfig-docs)
conflicts=(fontconfig-docs)
replaces=('fontconfig-docs<2:2.13.93-1')
backup=(etc/fonts/fonts.conf)
install=fontconfig.install
source=(
  "git+https://gitlab.freedesktop.org/fontconfig/fontconfig.git?signed#tag=$pkgver"
  0001-Fix-a-null-pointer-dereference-when-computing-a-patt.patch
  40-fontconfig-config.hook
  40-fontconfig-config.script
  fontconfig.hook
)
b2sums=('b345126ee3216aaa0feb79a4bb9d41c33b116862242e547eab9c217db2220205edbdd67893d1d8917c4a469da5a75cce0526d31b4c792b38815e4a70b4c6b750'
        '345b57e76bcec4990287399157ec47ab3233191f946d86bcbd8a825dc3fc5583868576644c02c31e7912d26664ab05056ac0eb0f4ad5be6edb8f2b42a2edaa68'
        'b06b3f2b8c0c38139a9247c26a641e6dc01d50b530478dd14133175a603f60b0af901af16c9fcf1ce73d23786ea14bfdbacd39f1dcfd88f6382965ad22be1411'
        '7fb63e76ab126bc0a7decfd74c53429ad1ce6d13de2f14037259616d8d4150b8fa4601c7f02b75918ccd5995d424816dc9d01a5fe7e39dc3dd1fcc83dfdb0fe8'
        'dfbf47c069c88da7687511356cef5bb94b7190e558a6f08390d6976fa7065ba7137ccb0a5ca1defdef655091afe74eb8a3d33fb9f3e0633409aa79f753ad276d')
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
  git apply -3 ../0001-Fix-a-null-pointer-dereference-when-computing-a-patt.patch
}

build() {
  local meson_options=(
    -D bitmap-conf=noinstall
    -D default-sub-pixel-rendering=noinstall
    -D doc-html=enabled
    -D doc-pdf=disabled
    -D doc-txt=disabled
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

  # Handle conf.d using the hook to avoid overwriting the symlinks on upgrade
  mkdir -p "$pkgdir/usr/share/fontconfig/conf.default"
  for _f in "$pkgdir"/etc/fonts/conf.d/*.conf; do
    ln -sr "$pkgdir"/usr/share/fontconfig/conf.{avail,default}/"${_f##*/}"
    rm "$_f"
  done

  install -Dm644 *.hook -t "$pkgdir/usr/share/libalpm/hooks"
  install -D 40-fontconfig-config.script \
    "$pkgdir/usr/share/libalpm/scripts/40-fontconfig-config"
  install -Dm644 fontconfig/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
