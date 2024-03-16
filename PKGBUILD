# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_pkgbasename=util-linux
pkgname=lib32-${_pkgbasename}
_tag='7f7be3ee7248915b50190b5845eadb67b2e21a02' # git rev-parse v${_tag_name}
_tag_name=2.40-rc2
pkgver=${_tag_name/-/}
pkgrel=1
pkgdesc='Miscellaneous system utilities for Linux (32-bit)'
url='https://github.com/util-linux/util-linux'
arch=('x86_64')
makedepends=('git' 'meson' 'lib32-libxcrypt' 'lib32-ncurses')
depends=('lib32-glibc' 'util-linux-libs')
provides=('libuuid.so' 'libblkid.so' 'libfdisk.so' 'libmount.so' 'libsmartcols.so')
license=('GPL2')
options=('!emptydirs')
validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284')  # Karel Zak
source=("git+https://github.com/util-linux/util-linux#tag=${_tag}?signed")
sha256sums=('SKIP')

_backports=(
)

_reverts=(
)

prepare() {
  cd "${_pkgbasename}"

  local _c _l
  for _c in "${_backports[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git cherry-pick --mainline 1 --no-commit "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git revert --mainline 1 --no-commit "${_c}"
  done

  # do not mark dirty
  sed -i '/dirty=/c dirty=' tools/git-version-gen
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  local _meson_options=(
    --libexecdir /usr/lib32
    --libdir     /usr/lib32

    --auto-features disabled

    -Dbuild-libblkid=enabled
    -Dbuild-libuuid=enabled
    -Dbuild-libmount=enabled
    -Dbuild-libsmartcols=enabled
    -Dbuild-libfdisk=enabled

    -Dncurses=disabled
    -Dncursesw=enabled
  )

  artix-meson "${_pkgbasename}" build "${_meson_options[@]}"

  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build

  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
