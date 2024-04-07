# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgbase=libcap-ng
pkgname=(
  libcap-ng
  python-capng
)
pkgver=0.8.4
pkgrel=2
pkgdesc='A library for Linux that makes using posix capabilities easy'
arch=(x86_64)
url='https://people.redhat.com/sgrubb/libcap-ng/'
license=(
  GPL-2.0-or-later
  LGPL-2.1-or-later
)
depends=(glibc)
makedepends=(
  python
  swig
)
source=(
  https://github.com/stevegrubb/libcap-ng/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
  $pkgname-0.8.4-remove_exception_handler.patch::https://github.com/stevegrubb/libcap-ng/commit/30453b6553948cd05c438f9f509013e3bb84f25b.patch
)
sha512sums=('3e640ba4bfa2d5b5d0eb463abca3b2c745b10e929571c0ec32eb068bdc41fd95e19f7131893a22ceebb4d1f1083d3d87d9a32f0808442d594ac5940791152acf'
            '74de0b06ca948d217fba18dece9072684267bc3f60d53f6c3c164af8f57c48d69d5d17df4a35fee98fdc5919146864168249a690153a95dcda97712efb3e1f7a')
b2sums=('f4ea9780b87cdd4f9fa85d4ad3960afe654bc8aa6f5aa298ec87b7d90c87dd981f81577e5113ed76d83aa39c959160bf4deee57be9b458a98f8715e6f7b8dd33'
        'd5a2f35354efb9adb9c45a2173a97358de2fa79fcd6ea5af8987f85a743fc3eb4a2f7f20741538c5487087db9b6f5143041ad7a85d6943b2175ec2c20dac7eb7')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

prepare() {
  # backport patch for removed swig functionality: https://github.com/stevegrubb/libcap-ng/issues/48
  patch -Np1 -d $pkgbase-$pkgver -i ../$pkgname-0.8.4-remove_exception_handler.patch

  cd $pkgbase-$pkgver
  # make stupid autotools happy -_-
  touch NEWS
  autoreconf -fiv
}

build() {
  local configure_options=(
    --enable-static=no
    --prefix=/usr
    --with-python3
    --without-python
  )

  cd $pkgbase-$pkgver
  ./configure "${configure_options[@]}"
  make
}

check() {
  make check -C $pkgbase-$pkgver
}

package_libcap-ng() {
  provides=(
    libcap-ng.so
    libdrop_ambient.so
  )

  make DESTDIR="$pkgdir" install -C $pkgbase-$pkgver

  (
    cd "$pkgdir"
    _pick python-capng usr/lib/python*
  )
}

package_python-capng() {
  pkgdesc+=' (Python bindings)'
  depends+=(
    libcap-ng libcap-ng.so
    python
  )
  provides=(
    python-libcap-ng
  )

  mv -v python-capng/* "$pkgdir"
}

# vim: ts=2 sw=2 et:
