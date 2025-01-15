# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=libsecret
pkgname=(
  libsecret
  libsecret-docs
)
pkgver=0.21.5
pkgrel=1
pkgdesc="Library for storing and retrieving passwords and other secrets"
url="https://gnome.pages.gitlab.gnome.org/libsecret/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  glib2
  glibc
  libgcrypt
  tpm2-tss
)
makedepends=(
  bash-completion
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  meson
  vala
)
checkdepends=(
  gjs
  python-dbus
  python-gobject
  swtpm
  tpm2-abrmd
)
source=("git+https://gitlab.gnome.org/GNOME/libsecret.git?signed#tag=$pkgver")
b2sums=('86f2330d6c80d37c4e5eb92a28a707bf0b646b2566c857295b11f1834c7b8e4b23c31e58b67ab372911c8afebc9331dfeebe3171d877cec65ebbb00f36fc4d33')
validpgpkeys=(
  A7C626E13F9AD776776BD9CA1D8A57CF2E8D36A3 # Niels De Graef <nielsdegraef@gmail.com>
)

prepare() {
  cd $pkgbase

  # Use our test dbus-run-session; needed for communication with Tabrmd
  git revert -n 35381ee638ed9c7e01cdacd24230ca39a6e6b96c

  # Secure memory tests fail in containers
  sed -i '/test-secmem/d' egg/meson.build
}

build() {
  local meson_options=(
    -D tpm2=true
  )

  artix-meson $pkgbase build "${meson_options[@]}"
  meson compile -C build
}

_check() (
  mkdir -p "${TPM_PATH:=$PWD/tpm}"
  export TPM_PATH

  swtpm_setup --create-config-files
  swtpm_setup --tpm2 --tpm-state "$TPM_PATH" --createek --allow-signing \
    --decryption --overwrite --display

  swtpm socket --tpm2 --flags startup-clear \
    --server type=unixio,path="$TPM_PATH/socket" \
    --ctrl type=unixio,path="$TPM_PATH/socket.ctrl" &
  _p1=$!

  tpm2-abrmd --tcti=swtpm:path="$TPM_PATH/socket" \
    --session --flush-all &
  _p2=$!

  trap "kill $_p1 $_p2; wait" EXIT

  export TCTI=tabrmd:bus_type=session

  meson test -C build --print-errorlogs
)

check() {
  dbus-run-session bash -c "$(declare -f _check); _check"
}

package_libsecret() {
  optdepends=('org.freedesktop.secrets: secret storage backend')
  provides=(libsecret-1.so)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_libsecret-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
