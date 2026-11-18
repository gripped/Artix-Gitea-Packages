# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Maintainer: Noctalia Team <team@noctalia.dev>

_pkgname=noctalia
pkgname=noctalia
pkgver=5.5.0
pkgrel=2
pkgdesc='A sleek, customizable desktop shell crafted for Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/noctalia-dev/noctalia'
license=('MIT')
depends=(
  'bash'
  'cairo'
  'curl'
  'fontconfig'
  'freetype2'
  'git'
  'glib2'
  'glibc'
  'harfbuzz'
  'hicolor-icon-theme'
  'jemalloc'
  'libgcc'
  'libglvnd'
  'libical'
  'libjxl'
  'libpipewire'
  'libqalculate'
  'librsvg'
  'libsecret'
  'libsndfile'
  'libsodium'
  'libstdc++'
  'libwebp'
  'libwireplumber'
  'libxkbcommon'
  'libxml2'
  'md4c'
  'pam'
  'polkit'
  'pango'
  'sdbus-cpp'
  'tomlplusplus'
  'wayland'
)
optdepends=(
  'ddcutil: monitor brightness control'
  'power-profiles-daemon: power profile management'
  'upower: battery and power device integration'
)

makedepends=(
  'meson'
  'ninja'
  'nlohmann-json'
  'pkgconf'
  'stb'
  'wayland-protocols'
)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('f3fe8a1f1d4306280413e04f934400b787dba212d296d97dfd638bcb55c78262')

build() {
  CXXFLAGS+=" -Wno-unused-result"
  artix-meson "${_pkgname}-${pkgver//_/-}" build-release \
    -Db_ndebug=true \
    -Dtests=disabled
  meson compile -C build-release
  for shell in bash fish zsh; do
    build-release/noctalia completions "$shell" > "${shell}-completion"
  done
}

package() {
  meson install -C build-release --destdir "${pkgdir}"

  install -Dm644 "${_pkgname}-${pkgver//_/-}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_pkgname}-${pkgver//_/-}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # shell completions
  install -vDm644 bash-completion \
    "$pkgdir/usr/share/bash-completion/completions/noctalia"
  install -vDm644 fish-completion \
    "$pkgdir/usr/share/fish/vendor_completions.d/noctalia.fish"
  install -vDm644 zsh-completion \
    "$pkgdir/usr/share/zsh/site-functions/_noctalia"

}
