# Maintainer: artist for Sonic-DE

pkgname=sonic-desktop-interface
pkgver=6.6.2.4
pkgrel=1
pkgdesc='Sonic Desktop Interface'
arch=(x86_64)
url="https://github.com/Sonic-DE/$pkgname"
license=(LGPL-2.0-or-later)
depends=(attica
         baloo
         dbus
         emoji-font # for clock and language KCMs
         gcc-libs
         glibc
         kauth
         kbookmarks
         kcmutils
         kcodecs
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kdeclarative
         kglobalaccel
         kguiaddons
         ki18n
         kiconthemes
         kio
         kirigami
         kirigami-addons
         kitemmodels
         kitemviews
         kjobwidgets
         kmenuedit
         knewstuff
         knotifications
         knotifyconfig
         kpackage
         kpipewire
         krunner
         kservice
         ksvg
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         libcanberra
         libksysguard
         libwacom
         libx11
         libxcb
         libxcursor
         libxi
         libxkbcommon
         libxkbfile
         libplasma
         plasma-activities
         plasma-activities-stats
         sonic-win
         sonic-workspace
         plasma5support
         polkit-kde-agent
         powerdevil
         qt6-5compat
         qt6-base
         qt6-declarative
         sdl2
         solid
         sonnet
         systemsettings
         xcb-util-keysyms
         xdg-user-dirs)
optdepends=('bluedevil: Bluetooth applet'
            'glib2: kimpanel IBUS support'
            'ibus: kimpanel IBUS support'
            'kaccounts-integration: OpenDesktop integration plugin'
            'kscreen: screen management'
            'libaccounts-qt: OpenDesktop integration plugin'
            'packagekit-qt6: to install new krunner plugins'
            'plasma-nm: Network manager applet'
            'plasma-pa: Audio volume applet'
            'scim: kimpanel SCIM support')
makedepends=(extra-cmake-modules
             intltool
             kaccounts-integration
             kdoctools
             libibus
             packagekit-qt6
             scim
             xf86-input-libinput
             xorg-server-devel)
groups=(sonicde)
conflicts=(plasma-desktop)
provides=(plasma-desktop)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

sha256sums=('32b2db426e3785d2b290ede93c0f47fbea5413879c23e5b52dc9c490ab47517d')

