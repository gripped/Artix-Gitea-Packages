# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Simo L. <neotuli@yahoo.com>
# Contributor: eric <eric@archlinux.org>

_name=backends
pkgname=sane
pkgver=1.4.0
pkgrel=3
pkgdesc="Scanner Access Now Easy"
arch=(x86_64)
url="https://gitlab.com/sane-project/backends"
license=(
  GPL-2.0-or-later
  LicenseRef-GPL-2.0-or-later-with-linking-exception
)
depends=(
  bash
  cairo
  gcc-libs
  glibc
  libpng
  libieee1284
  net-snmp
  v4l-utils
)
makedepends=(
  autoconf-archive
  avahi
  curl
  glib2
  libgphoto2
  libjpeg-turbo
  libtiff
  libusb
  libxml2
  poppler-glib
  python
  udev
  texlive-latexextra
)
optdepends=(
  'sane-airscan: for scanners working in driverless mode'
)
provides=(libsane.so)
source=(
  $url/-/archive/$pkgver/$_name-$pkgver.tar.gz
  66-${pkgname}d.rules
  $pkgname.sysusers
  sane.xinetd
)
sha512sums=('69adc9e4a7c7252ff677c510c4112096c3c4b00525113795d5d2ecd0efe8716a556c6c403df685d0e360eae72546ad55ff9dd27b3fde5c5b1b9d13dbcd735465'
            'd0d1b6bd6fbb04d610e7186e26d04c2233a620cc7c731ca3acd7fb860dd033fbe99d8974ffa1dd59c8affcc4aa2664d76ab3dfd6f7b2a734b31d7e3832359c41'
            '12eb44f94464f79f7cff05d769685e724efd79a45ec646bf72941f482d4b63d17c4098df30558a533f7ba725ef397f46e34053fc96e40f46f89196d5721cf05b'
            '8f9f18d432087e5445aa533be375a811daf320512069c108d41a79121868937e1a7ffa21ee7d33adcf9fbb670bca460ff06423ce39602f35151eccc243d9d4ec')
b2sums=('1bb766d311ec8672f630f7ef10209de030bb7efee565e878f9bf64505f93fbccd668872babe49631cd11e9c5cdee8e1dfb53e69c2577739323fc5daaa08510e2'
        'c9c6ba224b9b27f4ecc6b1ded6621a8abb52b1ded2d9078e4cad31177290b788e286fad74545a5cb09e1f6726515adc22003988eb646dc986e87f1a8061a0e27'
        '14711932fa106dab7464b75f1c9fd96a5bfa34fd2727486c382ffcd8af5e6d7b327d8c1b29a2ff7d45c6f810b04394e6aa17afacad0e733d9f0162e40fe9ac32'
        '158952a09d5b29ae848a4c1377de6ff824b61c7d1932d29f3a0d313bafdaa0c5973614c5b744f53c7d2d4acff3dd4dc8b821068b95ae07a081539fd5cabd7477')

prepare() {
  # extract custom license exception
  sed '1,41p' $_name-$pkgver/backend/dll.c > LicenseRef-GPL-2.0-or-later-with-linking-exception.txt

  cd $_name-$pkgver
  # copy translation files so they become reproducible: https://gitlab.com/sane-project/backends/-/issues/647
  cp -v po/en{_GB,@quot}.po
  cp -v po/en{_GB,@boldquot}.po
  # create version files, so that autotools macros can use them:
  # https://gitlab.com/sane-project/backends/-/issues/440
  printf "%s\n" "$pkgver" > .tarball-version
  printf "%s\n" "$pkgver" > .version
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --disable-locking
    --disable-rpath
    --docdir="/usr/share/doc/$pkgname"
    --enable-pthread
    --localstatedir=/var
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --with-avahi
    --with-libcurl
    --with-pic
    --with-poppler-glib
    --without-systemd
    --with-usb
  )

  cd $_name-$pkgver
  ./configure "${configure_options[@]}"

  # circumvent overlinking in libraries
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' -i libtool
  make
}

package() {
  depends+=(
    avahi libavahi-client.so libavahi-common.so
    curl libcurl.so
    glib2 libgobject-2.0.so
    libgphoto2 libgphoto2.so libgphoto2_port.so
    libjpeg-turbo libjpeg.so
    libtiff libtiff.so
    libusb libusb-1.0.so
    libxml2 libxml2.so
    poppler-glib libpoppler-glib.so
  )

  cd $_name-$pkgver

  make DESTDIR="$pkgdir" install

  # install custom license
  install -vDm 644 ../LicenseRef-GPL-2.0-or-later-with-linking-exception.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  # generate udev udev+hwdb
  install -vdm 755 "$pkgdir/usr/lib/udev/rules.d/"
  tools/sane-desc -m udev+hwdb -s doc/descriptions/ > "$pkgdir/usr/lib/udev/rules.d/65-$pkgname.rules"
  tools/sane-desc -m udev+hwdb -s doc/descriptions-external/ >> "$pkgdir/usr/lib/udev/rules.d/65-$pkgname.rules"
  # generate udev hwdb
  install -vdm 755 "$pkgdir/usr/lib/udev/hwdb.d/"
  tools/sane-desc -m hwdb -s doc/descriptions/ > "$pkgdir/usr/lib/udev/hwdb.d/20-$pkgname.hwdb"
  # NOTE: an empty new line is required between the two .desc collections
  printf "\n" >> "$pkgdir/usr/lib/udev/hwdb.d/20-$pkgname.hwdb"
  tools/sane-desc -m hwdb -s doc/descriptions-external/ >> "$pkgdir/usr/lib/udev/hwdb.d/20-$pkgname.hwdb"

  # udev integration
  install -vDm 644 ../66-${pkgname}d.rules "$pkgdir/usr/lib/udev/rules.d/"
  # sysusers.d
  install -vDm 644 ../$pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # install xinetd file
  install -D -m644 "${srcdir}/sane.xinetd" "${pkgdir}/etc/xinetd.d/sane"

  # remove old ChangeLogs
  rm -rvf "$pkgdir/usr/share/doc/$pkgname/ChangeLogs/"

  # add files below /etc/sane.d to backup array
  cd "$pkgdir"
  # trick extract_function_variable() in makepkg into not detecting the
  # backup array modification and adding remaining configuration files
  [[ /usr/bin/true ]] && backup=( ${backup[@]} $(find "etc/${pkgname}.d/" -type f | sort) )
}
