# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <contrasutra@myrealbox.com>

pkgname=elinks
pkgver=0.17.0
pkgrel=1
pkgdesc='Advanced feature-rich text-mode web browser'
arch=('x86_64')
url='https://github.com/rkd77/elinks'
license=('GPL')
depends=(
  'glibc'
  'brotli'
  'bzip2'
  'gpm'
  'openssl'
  'lua'
  'libdom'
  'libcss'
  'libidn2'
  'xz'
  'libwapcaplet'
  'expat'
  'zlib'
  'curl'
  'tre'
)
makedepends=(
  'git'
  'meson'
  'dblatex'
  'xmlto'
  'libiconv'
  'gc'
  'cmake'
)
source=("$pkgname::git+$url#tag=v$pkgver"
    libdom-fix.patch::https://github.com/rkd77/elinks/commit/2fdb04a6ab5523b94c4bd5c0062b0701686e127f.patch)
b2sums=('SKIP'
        'd69e57aa1cc8483118e340decfcfb0f5ce9e98ae7d9628e27bf4a7cea034232381ac3649d35c351c5b51820184a0850ac498ad51ceb85276eb2b7ae19ea44230')

prepare() {
    patch -d "$pkgname" -Np 1 -i ../libdom-fix.patch
}

build() {
  artix-meson \
    "$pkgname" \
    build \
    -D cgi=true \
    -D true-color=true \
    -D html-highlight=true \
    -D bzlib=true \
    -D brotli=true \
    -D lzma=true \
    -D luapkg=lua54 \
    -D tre=true \
    -D gemini=true \
    -D reproducible=true \
    -D source-date-epoch="$SOURCE_DATE_EPOCH"

  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
