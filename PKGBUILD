# Maintainer: artist for Artix Linux

pkgname=fvwm3
pkgver=1.1.2
pkgrel=1
pkgdesc="A highly customizable virtual desktop window manager with small memory footprint."
arch=('x86_64')
url="https://www.fvwm.org"
license=('GPL' 'custom')
depends=('libevent' 'libx11' 'libxft' 'libxrender' 'libxt' 'python' 'libxrandr' 'fontconfig' 'librsvg' 'libxkbcommon' 'libxslt')
makedepends=('meson' 'cmake' 'go' 'xtrans' 'librsvg' 'libxcursor' 'libxpm' 'asciidoctor')
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
sha256sums=('fde449c21678e059d16278da3ac69f3786aed96cac90962163e72bf59e840421'
            'e18c21b37219328309ac97b0026778299fc5db8d4aec3a4610287d92cec260db')

build() {
  artix-meson ${pkgname}-${pkgver} build \
                                     -Dbidi=disabled \
                                     -Dmandoc=true \
                                     -Dgolang=enabled \
                                     --prefix=/usr \
                                     --libexecdir=/usr/lib
  meson compile -C build  
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/doc/fvwm3"
  install -D -m644 ../fvwm3.desktop "${pkgdir}/usr/share/xsessions/fvwm3.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

