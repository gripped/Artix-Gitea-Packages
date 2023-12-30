# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Bug <bug2000@gmail.com>

pkgname=xpra
pkgver=5.0.4
pkgrel=1
pkgdesc="multi-platform screen and application forwarding system screen for X11"
arch=('x86_64')
url='https://www.xpra.org'
license=('GPL2')
depends=('gtk3' 'python' 'libxtst' 'python-cairo' 'python-gobject' 'python-pillow' 'python-lz4'
         'ffmpeg' 'libvpx' 'xf86-video-dummy' 'libxkbfile' 'libxres'
         'python-netifaces' 'python-rencode' 'python-opengl'
         'python-lz4')
optdepends=('x264: Codec' 'python-dbus: dbus features'
            'python-pycups: Printing support'
            'python-cryptography: Cryptography'
            'python-numpy: GPU accelerated capture and compression for NVIDIA cards'
            'gst-python: Sound Forwarding'
            'opencv: Webcam Forwarding')
makedepends=('pkgconf' 'pygobject-devel' 'python-setuptools' 'cython' 'uglify-js' 'pandoc')
backup=('etc/xpra/xpra.conf' 'etc/xpra/xorg.conf'
        'etc/xpra/conf.d/05_features.conf'
        'etc/xpra/conf.d/10_network.conf'
        'etc/xpra/conf.d/12_ssl.conf'
        'etc/xpra/conf.d/15_file_transfers.conf'
        'etc/xpra/conf.d/16_printing.conf'
        'etc/xpra/conf.d/20_sound.conf'
        'etc/xpra/conf.d/30_picture.conf'
        'etc/xpra/conf.d/35_webcam.conf'
        'etc/xpra/conf.d/40_client.conf'
        'etc/xpra/conf.d/42_client_keyboard.conf'
        'etc/xpra/conf.d/50_server_network.conf'
        'etc/xpra/conf.d/55_server_x11.conf'
        'etc/xpra/conf.d/60_server.conf'
        'etc/xpra/conf.d/65_proxy.conf'
        'etc/pam.d/xpra')
source=($pkgname-$pkgver.tar.gz::https://github.com/Xpra-org/xpra/archive/refs/tags/v$pkgver.tar.gz)

md5sums=('4d8a7abd2efbb6d597f5bf4e295e4bae')
sha1sums=('8a2dde501d33ec63df711aca029aab8d5a255ec9')
sha256sums=('36e4f5139226ed5499d7b79e300aac46071172a06ae7d2e55c4f26c10bda5109')
validpgpkeys=('C11C0A4DF702EDF6C04F458C18ADB31CF18AD6BB') # Antoine Martin <antoine@nagafix.co.uk>

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  sed -i 's|/build/xpra/pkg/xpra/etc/xpra/xorg.conf|/etc/xpra/xorg.conf|' "${pkgdir}"/etc/xpra/conf.d/55_server_x11.conf
  mkdir -p "${pkgdir}"/usr/share/dbus-1
  #Move D-BUS Policy
  mv "${pkgdir}"/{etc,usr/share}/dbus-1/system.d
  #Fix for FS#69804
  chmod +x "${pkgdir}"/usr/bin/*
}
