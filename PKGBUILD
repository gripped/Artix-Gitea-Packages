# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=xscreensaver
pkgver=6.13
pkgrel=2.1
pkgdesc='Screen saver and locker for the X Window System'
url='https://www.jwz.org/xscreensaver/'
arch=(x86_64)
license=(LicenseRef-XScreenSaver)
depends=(
  at-spi2-core
  gdk-pixbuf2
  glib2
  glibc
  glu
  gtk3
  libcrypt.so
  libglvnd
  libjpeg-turbo
  libjpeg.so
  libpam.so
 
  libx11
  libxcrypt
  libxext
  libxft
  libxi
  libxinerama
  libxml2
  libxmu
  libxrandr
  libxt
  libxxf86vm
  pam
  perl-libwww
  wayland
  xdg-utils
  xorg-appres
)
makedepends=(
  bc
  gdm
  intltool
  libxpm
 
 
)
optdepends=(
  'fortune-mod: for fortune file support (can be replaced with eg misfortune)'
  'gdm: for login manager support'
  'perl-lwp-protocol-https: for https support on networked demos'
  'words: for Web Collage demo'
)
backup=(
  etc/pam.d/xscreensaver
)
source=(https://www.jwz.org/xscreensaver/${pkgname}-${pkgver}.tar.gz
        xscreensaver)
sha512sums=('1ab42c0d0bf31b6d25e543d44c2ff41f48ef229ffce3a02f82495c1ef9c9452eddec4abe1cd7705220c6491562361f8cd0cca8bce9875ff80a765816574bf8ac'
            '82a54694a79804149e7cfb517d1d00be986b187123e1f5acceb6164636b228c6c5afe5645a1b71dab541644e910bd448075ae081eb7c742c7b3104ef1c4a126f')
b2sums=('a165a9bf9fa2f1d3db6e660ccb03fe5474bf2338e4d1d606d76b5552ae08d4d9ca97ff5a4b4a0778c741f391a9d654b0422c4b0e9b4a0a5a0c7b535c346d3e69'
        'bac86856af26eeeef4de2f3d6d3794bfa9d1bd10560c8839b6e064e60bf479602e29d79133fccb091982d638de1881142499e865d8e53d69462b801f63ea54e8')

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --without-setuid-hacks \
    --with-pam \
    --with-login-manager \
    --with-gtk \
    --with-gl \
    --without-gle \
    --with-pixbuf \
    --with-jpeg \
    --enable-pam-check-account-type
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}/etc/pam.d"
  make DESTDIR="${pkgdir}" install
  install -Dm 644 debian/copyright -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 "${srcdir}/xscreensaver" "${pkgdir}/etc/pam.d/xscreensaver"
  echo "NotShowIn=KDE;GNOME;" >> "${pkgdir}/usr/share/applications/xscreensaver-settings.desktop"
}

# vim: ts=2 sw=2 et:
