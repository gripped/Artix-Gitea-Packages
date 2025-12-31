# Maintainer: artist for Artix Linux

pkgbase=moksha
pkgname=(moksha moksha-module-mixer)
pkgver=0.4.1
pkgrel=23.6
_commit="88cf21c8d4e24283c07d1720dc2ebf8ae16b4a0c"
pkgdesc="Moksha Desktop and Window Manager for Artix Linux, fork of Enlightenment DR17"
arch=('x86_64')
url="https://wiki.artixlinux.org/Site/MokshaDesktopForArtix"
license=('BSD')
makedepends=('git' 'efl>=1.27.0' 'glib2' 'libpng' 'harfbuzz' 'fribidi' 'fontconfig' 'luajit' 'bullet'
             'libxcb' 'automake' 'libx11' 'xcb-util-keysyms' 'alsa-lib' 'udisks2' 'libsndfile')
options=('lto')
source=("${pkgname}::git+https://github.com/JeffHoogland/${pkgname}.git#commit=${_commit}"
        "moksha-artix::git+https://gitea.artixlinux.org/artix/moksha-artix.git"
        "page_000.patch"
        "page_040.patch"
        "e_wizard.patch"
        "e_main_c.patch"
        "e_src.patch"
        "tasks_edc.patch"
        "eina-log.sh"
        "80-local.rules"
        "sysactions.patch"
        "Artix_dna_spiral_dark_bw-4K.png"
        "background.edc"
autopoint
        "artix-icon.png")

prepare() {
  cd "$srcdir/${pkgname}"
  patch -Np1 -i "${srcdir}/page_000.patch"
  patch -Np1 -i "${srcdir}/page_040.patch"
  patch -Np1 -i "${srcdir}/e_wizard.patch"
  patch -Np1 -i "${srcdir}/e_src.patch"
  patch -Np1 -i "${srcdir}/e_main_c.patch"
  patch -Np1 -i "${srcdir}/tasks_edc.patch"
  patch -Np1 -i "${srcdir}/sysactions.patch"
sed -i 's|AM_GNU_GETTEXT_VERSION(\[0.19\])|AM_GNU_GETTEXT_VERSION([0.19], [external])|' configure.ac
  sed -i 's/bodhi-help/moksha-help/g' src/bin/e_utils.c
  sed -i 's/About Operating System/Moksha Desktop/g' src/bin/e_int_menus.c
  sed -i 's/About Operating System/Moksha Desktop/g' po/*.po*
  sed -i 's/Bodhi/Artix/g' config/bodhi/profile.desktop
  cp "$srcdir/artix-icon.png" config/bodhi/icon.png
  cp "$srcdir/Artix_dna_spiral_dark_bw-4K.png" data/themes/img/
  cp "$srcdir/background.edc" data/themes/edc/
}

build() {
  CFLAGS+=" -Wno-incompatible-pointer-types"
  cd "$srcdir/${pkgname}"
export AUTOPOINT=$srcdir/autopoint
  ./autogen.sh
  ./configure --prefix=/usr --disable-bodhi
  make
}

check() {
  cd "$srcdir/${pkgname}"
  make -k check
}

package_moksha() {
  depends=('efl>=1.27.0' 'terminology' 'moksha-menu' 'moksha-arandr' 'moksha-help' 'desktop-file-utils'
           'x11win-server' 'xorg-xinit' 'xsel' 'xclip' 'xdg-utils' 'xdg-user-dirs' 'xdg-dbus-proxy'
           'xcb-util-keysyms' 'openssl-1.1' 'rrdtool')
  optdepends=('moksha-module-mixer: Moksha pulse audio mixer'
              'moksha-extra-modules: additional modules for Moksha'
              'moksha-themes: additional themes for Moksha'
              'moksha-icon-themes-basic: basic additional themes for Moksha'
              'moksha-icon-themes-extra: extra additional themes for Moksha'
              'acpid: power events on laptop lid close and backight'
              'connman: modular network connection manager'
              'lm_sensors: for Moksha temperature indicator'
              'volumeicon: volume control for the system tray')
  install="$pkgname.install"
  conflicts=("enlightenment")
  backup=(etc/enlightenment/sysactions.conf)
  cd "$srcdir/${pkgname}"
  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/etc" "$pkgdir"
  install -D -m755 "$srcdir/eina-log.sh" -t "$pkgdir/etc/profile.d"
  install -D -m644 "$srcdir/80-local.rules" -t "$pkgdir/etc/udev/rules.d"
  install -D -m664 "$srcdir/moksha-artix/defaults/e.cfg" "$pkgdir/usr/share/enlightenment/data/config/bodhi"
  install -D -m664 "$srcdir/moksha-artix/defaults/e.cfg" "$pkgdir/usr/share/enlightenment/data/config/defaults"
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING

  mkdir "$srcdir/mixer-module"
  mv "$pkgdir/usr/lib/enlightenment/modules/mixer/linux-gnu-x86_64/module.so" "$srcdir/mixer-module/"
  mv "$pkgdir/usr/lib/enlightenment/modules/mixer/e-module-mixer.edj" "$srcdir/mixer-module/"
  mv "$pkgdir/usr/lib/enlightenment/modules/mixer/module.desktop" "$srcdir/mixer-module/"
}

package_moksha-module-mixer() {
  depends=('moksha' 'pulseaudio')
  cd "$srcdir/${pkgbase}"
  install -D -m755 -t "$pkgdir/usr/lib/enlightenment/modules/mixer/linux-gnu-x86_64/" "$srcdir/mixer-module/module.so"
  install -D -m644 "$srcdir/mixer-module/e-module-mixer.edj" "$pkgdir/usr/lib/enlightenment/modules/mixer"
  install -m644 "$srcdir/mixer-module/module.desktop" "$pkgdir/usr/lib/enlightenment/modules/mixer"
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}

sha256sums=('f0474d0e296e6856ba002d55f74dd3f3658760974f716e38598257733e6df158'
            'SKIP'
            'f7ade68c19149e31cbc1cfa3bcdab8bb01796d5a67b047b3e0db42d2daab4fdb'
            'aded00b469ef83305cd914be30f5b36b4134658f00e87c094b9435a9750d9f98'
            'c60c2c7594aeb5e6773c2366b41449af5535f1694eebc9d6ad5e7a92876d9cd1'
            '510748ae2273ded9ae126333a7dbd6c115140f675e6589978c438e89ef29458f'
            '81bc98939acf03bbf77575b582a1db97c61c4509b1abcdc15a435a0d6ba4d431'
            '395c52c6b12db3747318c33158204a5c97526768571b334f490a5b0a9d81f36b'
            '0bd52f4d66bd5f964996f88b379e6b8f50fcf457151ff30083d2d1b13f27dc36'
            '67a67d03fbfb59edecafc6bd3311e258e79da12726dcb1a44f037d54f31a1797'
            '8cd61b2686995f45c79799651511c1da61c80a47ed6187fc47843a6d0d024c2c'
            '1b6f11541e730b1a8c28d32ce058f0c4129940f917a8952e9f80b27dec956c11'
            '6e44b16c0a4cddea98dafe9e922d9157bc1ec10c997f5c026b6d633eb1c06831'
            'a1e3685bd8f98063529397eed51ab9f9e749488d32809e9e29ed92e8109090a9'
            'd3451714f3f4751e168aee8c5030ac4f63a2f99c0d1e68dd0f3243b6530e4a95')
