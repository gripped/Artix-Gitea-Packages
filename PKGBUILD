# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-systemmonitor
pkgver=6.8.0
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='An interface for monitoring system sensors, process information and other system resources'
arch=(x86_64)
url='https://apps.kde.org/plasma-systemmonitor/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(glibc
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         kdeclarative
         kglobalaccel
         ki18n
         kiconthemes
         kio
         kirigami
         kirigami-addons
         kitemmodels
         knewstuff
         kquickcharts
         kservice
         ksystemstats
         kwindowsystem
         libksysguard
         libstdc++
         python
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules)
groups=(plasma)
replaces=(ksysguard)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig}
"$pkgname-6.8.0-processesview.patch::https://raw.githubusercontent.com/chimera-linux/cports/604026ab38185f2c6008752cb59153f831c4952b/main/plasma-systemmonitor/patches/replace-unsupported-applications-view-with-processes.patch")
sha256sums=('3e4d4e91367bce651d3e60cea2d9dbd25adc4653945b32bfcdac094ff031d2c7'
            'SKIP'
            '89399fc8b29361c460a4efa8d63503f8384827a40653ad330c4aac4e6dfc2e67')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 < "$srcdir/$pkgname-6.8.0-processesview.patch"
}

build() {
  cmake -B build  -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
