# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=lightdm-slick-greeter
pkgver=2.0.0
pkgrel=1
pkgdesc='A slick-looking LightDM greeter'
arch=('x86_64')
url="https://github.com/linuxmint/slick-greeter"
license=('GPL3')
depends=('cairo' 'freetype2' 'gtk3' 'libcanberra' 'libxext' 'lightdm' 'pixman'
         'python' 'xorg-server' 'xapp')
optdepends=('numlockx: enable numerical keypad on supported keyboard')
makedepends=('intltool' 'vala' 'gnome-common')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('b935a4cd255d8309620b3d9f7563b3a96a69cf9653ba4db840cd414765d19ed7854432e0923f99c5911b4a8d013bb1323528700d4ee53d41b223b9037ad7ccce')
b2sums=('8a187e0f096429ccdcbca7ba0c553f088eec09ebea689a66e57e9199aa475af72627587cc5e1754eb18c8a0667f687261817b6145f9943ed925cce6fee4a1a1d')

prepare() {
	cd slick-greeter-${pkgver}
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd slick-greeter-${pkgver}
	./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin \
             --libexecdir=/usr/lib/lightdm
	make
}

package() {
	cd slick-greeter-${pkgver}
	make DESTDIR="${pkgdir}" install
	# adjust launcher name
	mv $pkgdir/usr/share/xgreeters/slick-greeter.desktop \
    $pkgdir/usr/share/xgreeters/lightdm-slick-greeter.desktop
}
