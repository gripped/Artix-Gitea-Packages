# Maintainer: artist for Artix Linux

_pkgname=xarchiver
pkgname=$_pkgname-gtk2
pkgver=0.5.4.26
pkgrel=1
pkgdesc="GTK2 frontend to various command line archivers"
arch=(x86_64)
url="https://github.com/ib/xarchiver"
license=(GPL)
depends=(gtk2)
makedepends=(docbook-xsl intltool xmlto)
conflicts=($_pkgname)
provides=($_pkgname)
optdepends=('arj: ARJ support'
            'binutils: deb support'
            'bzip2: bzip2 support'
            'cpio: RPM support'
            'gzip: gzip support'
            'lha: LHA support'
            'lrzip: lrzip support'
            'lz4: LZ4 support'
            'lzip: lzip support'
            'lzop: LZOP support'
            'p7zip: 7z support'
            'tar: tar support'
            'unarj: ARJ support'
            'unrar: RAR support'
            'unzip: ZIP support'
            'xdg-utils: recognize more file types to open'
            'xz: xz support'
            'zip: ZIP support'
            'zstd: zstd support')
source=(https://github.com/ib/xarchiver/archive/$pkgver/$_pkgname-$pkgver.tar.gz
        xarchiver.appdata.xml)
sha256sums=('58e4fb2c1fb8421573a31cf3b4dfec301076d61f48ac5720df632986c87e9573'
            '23bcb8d0d4d28327923bbe18b3615081bd389e624862c8b476e13f3e9a906cf0')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib/xfce4 --enable-gtk2
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

