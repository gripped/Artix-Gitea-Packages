# Maintainer: commandk <commandk@artixlinux.org>

pkgname=waylock
pkgver=1.6.0
pkgrel=1
pkgdesc="A simple screenlocker for wayland compositors"
arch=(x86_64)
url="https://codeberg.org/ifreund/waylock"
license=(ISC)
depends=(
  glibc
  libxkbcommon
  pam
  wayland
)
makedepends=(
  git
  scdoc
  wayland-protocols
  zig
)
_zig_deps=(
  # https://codeberg.org/ifreund/waylock/src/tag/v${pkgver}/build.zig.zon
  zig-wayland-v0.4.0.tar.gz::https://codeberg.org/ifreund/zig-wayland/archive/v0.4.0.tar.gz
  zig-xkbcommon-v0.3.0.tar.gz::https://codeberg.org/ifreund/zig-xkbcommon/archive/v0.3.0.tar.gz
)
source=(
  "git+$url?signed#tag=v$pkgver"

  "${_zig_deps[@]}"
)
noextract=("${_zig_deps[@]}")
sha512sums=('6a372ae283e0bb0c4624452fe093eaa882de07f7efe5bbc33a441478e63a0afd4ed8d0c3045d8cf10dcfd27cb3e861bf7546cf7b06204889b7365e61b0ffa240'
            '8536456d2f2886c7aa844e227272e8e4595ba3197575cba46b5f757b045976cf1c65a131532a191f2a8a82ca3d58642900d57fe7358518a237f29e84cb85e0f2'
            'fe0dc46a8556f19c2ce1badbeee7576065cb56495b94b6d468ee6ed8667f9fef5377e26864b0c8e81c3a2718cfcaf8a4f5e13aab23a615f3a58ec639372fb758')
b2sums=('fd00b1abcf33a67fc2e8a1ac2367853aacf1841ad4af8d586beb79a2c05f530584a112f85a1ae3bf1a34aaccad868d60ab76bc187e3b3a7edfd92da1c4ed829f'
        '1c33b878c3efdf20eef58ddd6f8a6cab99a24e7481f9a3b8f31b19b58d13372d8dea84dfb26b4097123ca25b1d38939e9b987d70eb3a23fe0fecf9f21fe6f8a2'
        '6870fc2465e2b1ef4faa6330183a1dade4a4bcf36130113444e5221ff9c764db488304f2f25a603f2511c2562d55bf1011a5f8fe41a068e7e5b707e1d06c0792')
validpgpkeys=('5FBDF84DD2278DB2B8AD8A5286DED400DDFD7A11') # Isaac Freund <mail@isaacfreund.com>

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  for dep in "${_zig_deps[@]}"; do
    zig fetch --global-cache-dir ./zig-cache "${dep%%::*}"
  done
}

build() {
  local zig_options=(
    -Dcpu=baseline
    -Dpie
    -Dtarget=native-linux.6.6-gnu.2.40 \
    --build-id=sha1 \
    --prefix /usr
    --search-prefix /usr
    --system ../zig-cache/p
    --verbose
  )

  cd $pkgname
  DESTDIR=build zig build "${zig_options[@]}"
}

package() {
  depends+=(
    libxkbcommon.so
    libpam.so
    libwayland-client.so
  )

  cd $pkgname

  mv -v build/* "$pkgdir"

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
