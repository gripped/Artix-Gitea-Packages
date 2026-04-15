# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-systemmonitor
pkgver=6.6.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1.2
pkgdesc='An interface for monitoring system sensors, process information and other system resources'
arch=(x86_64)
url='https://apps.kde.org/plasma-systemmonitor/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
depends=(gcc-libs
         glibc
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
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules)
groups=(plasma)
replaces=(ksysguard)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig}
        plasma-systemmonitor.patch::https://raw.githubusercontent.com/chimera-linux/cports/604026ab38185f2c6008752cb59153f831c4952b/main/plasma-systemmonitor/patches/replace-unsupported-applications-view-with-processes.patch)
sha256sums=('5be0c214a4d48c85608169c0603c4d5687553c98bc1b45c7353be93f66cd8b12'
            'SKIP'
            '89399fc8b29361c460a4efa8d63503f8384827a40653ad330c4aac4e6dfc2e67')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../plasma-systemmonitor.patch
}

build() {
  cmake -B build  -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
