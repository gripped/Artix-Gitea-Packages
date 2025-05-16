# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwallet
pkgver=6.14.0
pkgrel=2
pkgdesc='Secure and unified container for user passwords'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs
         glib2
         glibc
         gpgme
         kcolorscheme
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         ki18n
         knotifications
         kwidgetsaddons
         kwindowsystem
         libgcrypt
         libsecret
         qca-qt6
         qt6-base)
makedepends=(doxygen
             extra-cmake-modules
             kdoctools
             kservice
             qt6-doc
             qt6-tools)
optdepends=('kwalletmanager: Configuration GUI')
provides=(org.freedesktop.secrets)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig}
       https://invent.kde.org/frameworks/kwallet/-/commit/c9a9252d34a63bb02a3756bf5e58441a42ad5928.patch)
sha256sums=('a7477e4e5e7ccb43491c5a0eccadf6a33e962088d5af32c4b6b4aacb920f59e3'
            'SKIP'
            '3179bcc316519e0c31c00cad44e7b0a5a7ec1420318cf70f6f5397badbde334e')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D # Jonathan Esk-Riddell <jr@jriddell.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1 # Nicolas Fella <nicolas.fella@kde.org>
              )
prepare() {
  cd $pkgname-$pkgver
  # Fix for kwallet start up
  # https://gitlab.archlinux.org/archlinux/packaging/packages/kwallet/-/issues/1
  # https://bugs.kde.org/show_bug.cgi?id=504014
  patch -Np1 < "$srcdir"/c9a9252d34a63bb02a3756bf5e58441a42ad5928.patch
}
build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

# Fix conflicts for now
  rm "$pkgdir"/usr/share/dbus-1/services/org.kde.kwalletd5.service
}
