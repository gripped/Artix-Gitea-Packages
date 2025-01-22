# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Alexander Epaneshnikov <aarnaarn2@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgbase=brltty
pkgname=(brltty brltty-udev-generic)
pkgver=6.7
pkgrel=4
pkgdesc="Braille display driver for Linux/Unix"
arch=(x86_64)
url="https://brltty.app"
license=(LGPL-2.1-or-later)
makedepends=(
  alsa-lib
  at-spi2-atk
  at-spi2-core
  atk
  bluez-libs
  cython
  dbus
  dracut
  espeak-ng
  expat
  festival
  gcc-libs
  glibc
  glib2
  gpm
  icu
  java-environment
  libcap
  liblouis
  libspeechd
  libxaw
  ncurses
  ocaml-ctypes
  ocaml-findlib
  pcre2
  polkit
  python-setuptools
  speech-dispatcher
  strip-nondeterminism
  libelogind
  tcl
)
options=(!emptydirs)
source=(
  https://github.com/brltty/brltty/archive/refs/tags/${pkgbase^^}-$pkgver.tar.gz
  0001-brlapi-use-elogind-instead-of-systemd.patch
  $pkgname-6.4-x11_autostart.patch
)
sha512sums=('693188317f01d1a1a63aed9fa17925b0cd21e76b4e69838893eee926aceab095034ccb0c25614ce5bbc7c54b5bd5a1af86f3a89f17cb9e1b9eb6cdd706ec8fc0'
            'f0f99df714ceb7b9b1c57cc9c3a1c47b360fc0ff23bb7b183d8e57015d00801bbb4c6ec4395f0b06fd386d7047c9b16e16161d700655fe17cf324aaaf6c3b2d8'
            '4871512affefbc178f4204a1b285fc2b5a05ea2d181163195d695b760e9729b3d2d00b5f052abd71379df609c3859d7cbd64128bdefd16e898bbc4368500a9a0')
b2sums=('b19b104ffd6f6482e253b11f47e26352716592ab6a90effb87d51083e55f45478e79ed5819863d000d38d4eb5f248b077fbd1366887b3db3a8290544a8414bfb'
        '8868137c75067087e8da6ce46ad2d75e30da9e6e2bc3a965d5003af9f3c06358413d706efea9810ba50db90ffc7d8a41ce5aa5a653e49365592e3e6fa77c3a88'
        '4ebc07a725ef8362233a83118e93901e78943e8dae08f9358b668ff13ab88a65eb9e87c49d106a8c3d87eb62007b230e199107eacb01f92dc683335076c01309')

prepare() {
  cd $pkgbase-${pkgbase^^}-$pkgver
  patch -Np1 -i ../0001-brlapi-use-elogind-instead-of-systemd.patch
  patch -Np1 -i ../$pkgbase-6.4-x11_autostart.patch
  ./autogen
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --libexecdir=/usr/lib
    --localstatedir=/var
    --mandir=/usr/share/man
    --with-scripts-directory=/usr/lib/brltty
    --with-tables-directory=/usr/share/brltty
    --with-writable-directory=/run/brltty
    --enable-gpm
    --disable-stripping
    --without-service-package
  )
  # fat-lto-objects is required for non-mangled static libs
  CFLAGS+=" -ffat-lto-objects"

  cd $pkgbase-${pkgbase^^}-$pkgver
  ./configure "${configure_options[@]}"
  make
  # make brlapi.jar deterministic
  find . -type f -iname "*.jar" -exec strip-nondeterminism {} \;
}

package_brltty() {
  depends=(
    alsa-lib libasound.so
    bluez-libs
    dbus libdbus-1.so
    expat libexpat.so
    glib2 libgio-2.0.so libglib-2.0.so libgobject-2.0.so
    glibc
    gpm libgpm.so
    icu libicuuc.so
    libcap
    liblouis
    libspeechd
    ncurses libncursesw.so
    pcre2
    polkit
    libelogind libelogind.so
  )
  optdepends=(
    'at-spi2-core: X11/GNOME Apps accessibility'
    'brltty-udev-generic: for initializing brltty with generic USB devices'
    'espeak-ng: espeak-ng driver'
    'java-runtime: Java support'
    'libxaw: X11 support'
    'libxt: X11 support'
    'libx11: for xbrlapi'
    'libxfixes: for xbrlapi'
    'libxtst: for xbrlapi'
    'ocaml: OCaml support'
    'python: Python support'
    'speech-dispatcher: speech-dispatcher driver'
    'tcl: tcl support'
  )
  provides=(libbrlapi.so)
  backup=(
    etc/brltty.conf
    etc/X11/xinit/xinitrc.d/90xbrlapi
  )
  install=brltty.install

  cd $pkgbase-${pkgbase^^}-$pkgver
  # installation does not work reliably with many cores, so set jobs to 1
  make -j1 INSTALL_ROOT="$pkgdir" install
  make -j1 INSTALL_ROOT="$pkgdir" install-udev
  make -j1 INSTALL_ROOT="$pkgdir" install-dracut
  make -j1 INSTALL_ROOT="$pkgdir" install-polkit
  install -vDm 644 Documents/$pkgbase.conf -t "$pkgdir/etc/"

  # manually install sysusers/tmpfiles files from srcdir
  mkdir -p "$pkgdir/usr/lib/sysusers.d/"
  mkdir -p "$pkgdir/usr/lib/tmpfiles.d/"
  install -vDm 644 Autostart/Systemd/sysusers "$pkgdir/usr/lib/sysusers.d/"
  install -vDm 644 Autostart/Systemd/tmpfiles "$pkgdir/usr/lib/tmpfiles.d/"

  # move generic udev rule, as it applies too broadly
  mv -v "$pkgdir/usr/lib/udev/rules.d/90-brltty-usb-generic.rules" ../
}

package_brltty-udev-generic() {
  pkgdesc="Generic udev rules for brltty"
  depends=(brltty)

  install -vDm 644 90-brltty-usb-generic.rules -t "$pkgdir/usr/lib/udev/rules.d/"
}
