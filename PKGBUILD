# Maintainer: artist for Artix Linux

pkgname=moksha
pkgver=0.4.1
pkgrel=13.1
_commit="470f1d3e840416678d6e61c13603b50f118c2b5e"
pkgdesc="Moksha Desktop and Window Manager for Artix Linux, fork of Enlightenment DR17"
arch=('x86_64')
url="https://wiki.artixlinux.org/Site/MokshaDesktopForArtix"
license=('BSD')
depends=('efl>=1.27.0' 'moksha-menu' 'moksha-arandr' 'moksha-help' 'desktop-file-utils' 'xclip'
         'xdg-utils' 'xdg-user-dirs' 'xdg-dbus-proxy' 'xcb-util-keysyms' 'openssl-1.1'
         'lm_sensors' 'rrdtool' 'libpulse')
makedepends=('git' 'glib2' 'libpng' 'harfbuzz' 'fribidi' 'fontconfig' 'luajit' 'bullet'
             'libxcb' 'automake' 'libx11' 'alsa-lib' 'udisks2' 'libsndfile')
optdepends=('moksha-extra-modules: additional modules for Moksha'
            'moksha-themes: additional themes for Moksha'
            'moksha-icon-themes: additional themes for Moksha'
            'terminology: EFL based terminal emulator'
            'acpid: power events on laptop lid close and backight'
            'bc: calculator in everything module'
            'pasystray: pulse audio system tray'
            'pavucontrol: for pulse audio mixer'
            'qastools: for alsa audio mixer qasmixer'
            'network-manager-applet: for network manager and systray applet'
            'wpa-cute: a graphical wpa_supplicant front end, fork of wpa_supplicant_gui')
install="$pkgname.install"
conflicts=("enlightenment")
backup=(etc/enlightenment/sysactions.conf)
options=('lto')
source=("${pkgname}::git+https://github.com/JeffHoogland/${pkgname}.git#commit=${_commit}"
        "eina-log.sh"
        "80-local.rules"
        "sysactions.patch"
        "Artix_dna_spiral_dark_bw-4K.png"
        "background.edc"
        "artix-icon.png"
        "e.cfg-mixer_disabled")

prepare() {
  cd "$srcdir/${pkgname}"
  patch -Np1 -i "${srcdir}/sysactions.patch"
  sed -i 's/bodhi-help/moksha-help/g' src/bin/e_utils.c
  sed -i 's/About Operating System/Moksha Desktop/g' src/bin/e_int_menus.c
  sed -i 's/MokshaArcGreen/default/g' config/bodhi/e.src
  sed -i 's/About Operating System/Moksha Desktop/g' po/*.po*
  sed -i 's/Bodhi/Artix/g' config/bodhi/profile.desktop
  cp "$srcdir/artix-icon.png" config/bodhi/icon.png
  cp "$srcdir/Artix_dna_spiral_dark_bw-4K.png" data/themes/img/
  cp "$srcdir/background.edc" data/themes/edc/
}

build() {
  cd "$srcdir/${pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr --disable-bodhi
  make
}

check() {
  cd "$srcdir/${pkgname}"
  make -k check
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/etc" "$pkgdir"
  install -D -m755 "$srcdir/eina-log.sh" -t "$pkgdir/etc/profile.d"
  install -D -m644 "$srcdir/80-local.rules" -t "$pkgdir/etc/udev/rules.d"
  cp "$srcdir/e.cfg-mixer_disabled" "$pkgdir/usr/share/enlightenment/data/config/bodhi/e.cfg"
  cp "$srcdir/e.cfg-mixer_disabled" "$pkgdir/usr/share/enlightenment/data/config/default/e.cfg"
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}

sha256sums=('0f2e70dcebbd18d89290befa7c80d53d8475b315b0098100e1a79f400ac8cae4'
            '0bd52f4d66bd5f964996f88b379e6b8f50fcf457151ff30083d2d1b13f27dc36'
            '67a67d03fbfb59edecafc6bd3311e258e79da12726dcb1a44f037d54f31a1797'
            '8cd61b2686995f45c79799651511c1da61c80a47ed6187fc47843a6d0d024c2c'
            '1b6f11541e730b1a8c28d32ce058f0c4129940f917a8952e9f80b27dec956c11'
            '6e44b16c0a4cddea98dafe9e922d9157bc1ec10c997f5c026b6d633eb1c06831'
            'd3451714f3f4751e168aee8c5030ac4f63a2f99c0d1e68dd0f3243b6530e4a95'
            '1b1a574cdb919a4460892cd9c1ed8650878df7d29486965aafcabd7df4eb3904')

