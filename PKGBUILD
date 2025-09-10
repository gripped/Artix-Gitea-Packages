# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=p11-kit
pkgname=(
  p11-kit
  libp11-kit
  p11-kit-docs
)
pkgver=0.25.6
pkgrel=1
pkgdesc="Loads and enumerates PKCS#11 modules"
url="https://p11-glue.freedesktop.org"
arch=(x86_64)
license=(BSD-3-Clause)
depends=(
  coreutils
  glibc
  libtasn1
)
makedepends=(
  bash-completion
  git
  gtk-doc
  libffi
  meson
)
checkdepends=(
  gnutls
)
source=(
  "git+https://github.com/p11-glue/p11-kit?signed#tag=$pkgver"
  git+https://github.com/p11-glue/pkcs11-json
)
b2sums=('ef27c6dd2cd60881b185e1d05a46a9799cda8ebb86407ae9264d7173b2b686c757de91e3463babfeda5307adcb452d7e67e22b5c1a8df1613a5e176d0a2ee913'
        'SKIP')
validpgpkeys=(
  C0F67099B808FB063E2C81117BFB1108D92765AF  # Stef Walter <stef@thewalter.net>
  462225C3B46F34879FC8496CD605848ED7E69871  # Daiki Ueno <ueno@unixuser.org>
  5D46CB0F763405A7053556F47A75A648B3F9220C  # Zoltan Fridrich <zfridric@redhat.com>
)

prepare() {
  cd p11-kit

  # Install systemd unit files again
  git cherry-pick -n 93ba10fd8c7764dd253105c9ae927dcaae406843

  git submodule init
  git submodule set-url subprojects/pkcs11-json "$srcdir/pkcs11-json"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  local meson_options=(
    -D gtk_doc=true
    -D man=true
    -D trust_paths=/etc/ca-certificates/trust-source:/usr/share/ca-certificates/trust-source
    -D systemd=disabled
  )

  artix-meson p11-kit build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_p11-kit() {
  depends+=(
    "libp11-kit=$pkgver-$pkgrel"
    libp11-kit.so
  )

  meson install -C build --destdir "$pkgdir"
  ln -srf "$pkgdir/usr/bin/update-ca-trust" "$pkgdir/usr/lib/p11-kit/trust-extract-compat"

  _pick lib "$pkgdir"/usr/include
  _pick lib "$pkgdir"/usr/lib/{p11-kit-proxy.so,libp11-kit.*}
  _pick lib "$pkgdir"/usr/lib/{pkcs11,pkgconfig}
  _pick lib "$pkgdir"/usr/share/p11-kit

  _pick doc "$pkgdir"/usr/share/gtk-doc

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 p11-kit/COPYING
}

package_libp11-kit() {
  pkgdesc+=" (library)"
  depends=(
    glibc
    libffi
    libtasn1
  )
  provides=(libp11-kit.so)

  mv lib/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 p11-kit/COPYING
}

package_p11-kit-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 p11-kit/COPYING
}

# vim:set sw=2 sts=-1 et:
