# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Gaetan Bisson
# Contributor: damir

pkgname=x11vnc
pkgver=0.9.17
pkgrel=1.1
epoch=1
_commit='e2b726a8c0464051afda01648072af6835aaa5f7'
pkgdesc='VNC server for real X displays'
url='https://github.com/LibVNC/x11vnc'
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('libvncserver' 'openssl' 'libxcrypt' 'libxtst' 'libxext' 'libxinerama'
         'libxrandr' 'libxfixes' 'libxdamage' 'libxcomposite' 'libx11' 'avahi'
         'libxi' 'xorg-xdpyinfo' 'glibc' 'sh')
optdepends=('tk: for GUI support'
            'net-tools: for -auth guess'
            'xf86-video-dummy: for Xdummy script')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3ab47c042bc1c33f00c7e9273ab674665b85ab10592a8e0425589fe7f3eb1a69')

prepare() {
	autoreconf -fi "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix='/usr' --mandir='/usr/share/man' --with-x
	make
}

package() {
	make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
	install $pkgname-$pkgver/misc/{rx11vnc,Xdummy} -t "${pkgdir}/usr/bin"
}

