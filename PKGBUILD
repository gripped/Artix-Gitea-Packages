# Maintainer: artist for Artix Linux

pkgbase=kitty
pkgname=(kitty kitty-terminfo kitty-shell-integration)
pkgver=0.42.2
pkgrel=1
pkgdesc="Modern, hackable, featureful, OpenGL based terminal emulator"
arch=(x86_64)
url="https://sw.kovidgoyal.net/kitty/"
license=(GPL3)
depends=('python>=3.8' 'harfbuzz>=2.2.0' zlib libpng freetype2 fontconfig openssl libx11 libxi
         libgl libcanberra dbus lcms2 libxkbcommon-x11 xxhash librsync hicolor-icon-theme
         pixman cairo tk)
makedepends=(git python-setuptools libxinerama libxrandr libxkbcommon mesa
             wayland-protocols python-sphinx python-sphinx-copybutton libxcursor
             python-sphinx-inline-tabs python-sphinxext-opengraph python-sphinx-furo go
             ttf-roboto ttf-nerd-fonts-symbols-mono simde)
source=(https://github.com/kovidgoyal/kitty/releases/download/v${pkgver}/kitty-${pkgver}.tar.xz{,.sig})
validpgpkeys=('3CE1780F78DD88DF45194FD706BC317B515ACE7C') # Kovid Goyal

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i "s|if (e) PyErr_SetObject(PyExc_OSError, e);||" kitty/systemd.c

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  python3 setup.py linux-package --update-check-interval=0 --systemd-library="/usr/lib/libelogind.so.0.30.0"
}

package_kitty() {
  depends+=('kitty-terminfo' 'kitty-shell-integration')
  optdepends=('imagemagick: viewing images with icat')

  cd "$srcdir/$pkgname-$pkgver"

  cp -r linux-package "${pkgdir}"/usr

  linux-package/bin/kitten __complete__ setup bash | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/kitty
  linux-package/bin/kitten __complete__ setup fish | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/kitty.fish
  linux-package/bin/kitten __complete__ setup zsh  | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_kitty

  install -Dm644 "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/kitty.png "${pkgdir}"/usr/share/pixmaps/kitty.png

  rm -r "$pkgdir"/usr/share/terminfo
  rm -r "$pkgdir"/usr/lib/kitty/shell-integration

  install -Dm644 docs/_build/html/_downloads/*/kitty.conf "${pkgdir}"/usr/share/doc/${pkgname}/kitty.conf
}

package_kitty-terminfo() {
  pkgdesc='Terminfo for kitty, an OpenGL-based terminal emulator'
  depends=('ncurses')

  mkdir -p "$pkgdir/usr/share/terminfo"
  tic -x -o "$pkgdir/usr/share/terminfo" $pkgbase-$pkgver/terminfo/kitty.terminfo
}

package_kitty-shell-integration() {
  pkgdesc='Shell integration scripts for kitty, an OpenGL-based terminal emulator'

  mkdir -p "$pkgdir/usr/lib/kitty/"
  cp -r "$srcdir/$pkgbase-$pkgver/shell-integration" "$pkgdir/usr/lib/kitty/"
}

sha256sums=('719796b6f67f81d212e80a5dcd51ba84cff54e009f32a728108f6854f00306a1'
            'SKIP')
