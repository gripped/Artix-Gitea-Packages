# Maintainer: nous@artixlinux.org
# Contributor: Stefan Husmann <Stefan-Husmann@t-online.de>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tobias Dausend <throgh@hyperbola.info>

pkgname=vte-legacy
pkgver=0.28.2
pkgrel=2
pkgdesc="Virtual Terminal Emulator widget for use with GTK2"
arch=('i686' 'x86_64')
license=('LGPL-2')
url='https://www.gnome.org'
options=('!emptydirs')
groups=('gtk2')
provides=('vte')
conflicts=('vte')
depends=('gtk2' 'vte-common' 'glib2-devel')
makedepends=('pygtk' 'intltool' 'gobject-introspection' 'gettext')
source=(https://ftp.gnome.org/pub/GNOME/sources/vte/0.28/vte-$pkgver.tar.xz
        make_alt_work.patch
        scroll_region.patch
        bracketed_paste_mode_fix.patch
        gobject_cast.patch)
sha512sums=('d6a50481aaa8946cca3779e0b328fef551be534d70366a75385d1f8ead3fcddec57bed85c7d4bc2d9f34546532129e63083aafa33cbb0efcbc7dc9d66e7c45f6'
            'b3a99a4d0c2d8c7612f564bf6f935e4257c4279f9705bce194f09f5448fee488fbfe0e7b15d59d26884dcc4ad440a0111f603c3d8fc6212ef3ab66ef051c0044'
            'af158fa03d2ac54f7f547635ea3ba201e1e4c75048d2ff944d67792b06c8510a0c28ba417afb3c9730e504086605cd231415a7129dff14c1cb25423c984931b0'
            '94f140876be9cfe7b62dcd609ebb0e289445641ef3ec5009275aad34e5716ab64d019a304cc7bdd3228d397e2e57a3cb9c5e9b34e8cfadcbf996b87785d844ab'
            '0b301fcae56fb3cbed1dbedef394a87caaec6e764870c2e175d91847d5367b605acdba8672c1aadab8451fe74c89af87784c18ac75e8e624a7de067c938415f2')

prepare() {
  cd vte-$pkgver
  patch -Np1 -i $srcdir/make_alt_work.patch
  patch -Np1 -i $srcdir/scroll_region.patch
  patch -Np1 -i $srcdir/bracketed_paste_mode_fix.patch
  patch -Np1 -i $srcdir/gobject_cast.patch
  rm -r doc/reference/html
}
build() {
  cd vte-$pkgver

  #warning: type-punning to incomplete type might break strict-aliasing rules
  export CFLAGS="$CFLAGS -fno-strict-aliasing -Wno-incompatible-pointer-types"

  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/vte \
      --localstatedir=/var --disable-static \
      --enable-introspection --with-gtk=2.0 --disable-gnome-pty-helper
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package(){
  cd vte-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/$pkgname"
}
