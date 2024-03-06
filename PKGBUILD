# Maintainer:Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-pa
pkgver=6.0.1
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Plasma applet for audio volume management using PulseAudio'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glib2
         glibc
         kcmutils
         kconfig
         kcoreaddons
         kdeclarative
         kglobalaccel
         ki18n
         kirigami
         kitemmodels
         kstatusnotifieritem
         ksvg
         libcanberra
         libplasma
         libpulse
         plasma-workspace
         pulse-native-provider
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules
             kdoctools)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('2728ecd9f1c5106fe8bc07f0b03bda316036adc5d03a3ac001511f7543c337c7'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
