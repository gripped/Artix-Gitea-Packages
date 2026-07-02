# Maintainer: JonnyRobbie

pkgbase=xsane
pkgname=('xsane' 'xsane-gimp')
pkgver=0.999
pkgrel=6.4
arch=(x86_64)
url="https://gitlab.com/sane-project/frontend/$pkgbase"
license=('GPLv2')
makedepends=('autoconf' 'automake' 'gtk3' 'lcms2' 'sane' 'zlib' 'libjpeg-turbo' 'gimp' 'git')
source=(git+$url.git#commit=88b80bb0685ae27d8328aea32d06c173d8f89a59)
sha512sums=('79d957f82ba85730ea164d9de9b938a643c5a26ddb7e71ebb151c03e0caa9cfda98c2158dfbdc7a69bdad327638a53b5f13fa1f9d6481c12367e509686b27490')

prepare() {
  cd "$pkgname"
  autoreconf -fiv
}

build() {
  cd "$pkgname"

  # make with gimp support
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --enable-gimp
  make
  mv src/xsane src/xsane-gimp

  # make without gimp support
  make clean
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --mandir=/usr/share/man \
    --disable-gimp
  make
}

package_xsane() {
  pkgdesc="A GTK-based X11 frontend for SANE and plugin for Gimp. Git version."
  depends=('gtk3' 'lcms2' 'sane' 'zlib' 'libjpeg-turbo')
  optdepends=('xsane-gimp: for gimp plugin support')
  conflicts=('xsane')
  provides=('xsane')

  cd "$pkgbase"
  make DESTDIR=$pkgdir install
}

package_xsane-gimp() {
  pkgdesc="XSane Gimp plugin."
  depends=('xsane' 'gimp')
  conflicts=('xsane-gimp')
  provides=('xsane-gimp')

  cd "$pkgbase"
  install -D -m755 src/xsane-gimp "$pkgdir/usr/bin/xsane-gimp"

  ## Link the plugin binary to gimp plug-in directories
  mkdir -p "$pkgdir/usr/lib/gimp/2.0/plug-ins/xsane"
  ln -sf /usr/bin/xsane-gimp "$pkgdir"/usr/lib/gimp/2.0/plug-ins/xsane/xsane
  mkdir -p "$pkgdir/usr/lib/gimp/3.0/plug-ins/xsane"
  ln -sf /usr/bin/xsane-gimp "$pkgdir"/usr/lib/gimp/3.0/plug-ins/xsane/xsane
}
