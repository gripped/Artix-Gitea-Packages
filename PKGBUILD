# Maintainer: artist for Artix Linux

pkgname=fvwm3
pkgver=1.1.0
pkgrel=1.2
pkgdesc="A highly customizable virtual desktop window manager with small memory footprint."
arch=('x86_64')
url="https://www.fvwm.org"
license=('GPL' 'custom')
depends=('libevent' 'libx11' 'libxft' 'libxrender' 'libxt' 'python' 'libxrandr' 'fontconfig')
makedepends=('libxslt')
optdepends=('freetype2: Font rasterization library'
            'asciidoctor: An implementation of AsciiDoc in Ruby'
            'fribidi: A Free Implementation of the Unicode Bidirectional Algorithm'
            'ncurses: System V Release 4.0 curses emulation library'
            'libpng: A collection of routines used to create PNG format graphics files'
            'readline: GNU readline library'
            'librsvg: SVG rendering library'
            'libsm: X11 Session Management library'
            'libxcursor: X cursor management library'
            'libxext: X11 miscellaneous extensions library'
            'libxi: X11 Input extension library'
            'libxpm: X11 pixmap library'
            'sharutils: Makes so-called shell archives out of many files')
options=('!emptydirs' '!makeflags')
source=("https://github.com/fvwmorg/fvwm3/releases/download/${pkgver}/fvwm3-${pkgver}.tar.gz"
        "fvwm3.desktop")
sha256sums=('cb427d58d49e4f8db013d878fa9aa7a360e98706f1c6d08ea3ad8066ae8660d3'
            'e18c21b37219328309ac97b0026778299fc5db8d4aec3a4610287d92cec260db')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --enable-golang \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -d "${pkgdir}/usr/share/doc/fvwm3"
  install -D -m644 ../fvwm3.desktop "${pkgdir}/usr/share/xsessions/fvwm3.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

