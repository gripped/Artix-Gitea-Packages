# Maintainer: artist for Sonic-DE

pkgname=sonic-desktop-interface
pkgver=6.6.2.3
pkgrel=3
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
#source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
makedepends+=(git)
source=("git+https://github.com/artist4xlibre/sonic-desktop-interface.git#commit=e1a6b130bbac2dbea607fe7c978a3051158aff86")

prepare() {
  mv $pkgname $pkgname-$pkgver
}

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

sha256sums=('d04753966a4c938629e4a7b20e766ab2add2d573103dc7f20739f156cfc11282')

