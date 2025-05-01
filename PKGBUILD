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
makedepends=('git')
source=("git+https://github.com/LibVNC/x11vnc.git#commit=${_commit}?signed")
sha256sums=('8fb290d3c56970441651f541f1dff3993c6b17147b84483a38f607ef02875eb8')

prepare() {
	autoreconf -fi x11vnc
}

build() {
	cd "$pkgname"
	./configure --prefix='/usr' --mandir='/usr/share/man' --with-x
	make
}

package() {
	make -C x11vnc DESTDIR="$pkgdir" install
	install x11vnc/misc/{rx11vnc,Xdummy} -t "${pkgdir}/usr/bin"
}

