# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Taijian <taijian@posteo.de>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Damian01w <damian01w@gmail.com>
# Contributor: Padfoot <padfoot@exemail.com.au>

pkgname=plymouth
pkgver=23.360.11
pkgrel=1
pkgdesc='Graphical boot splash screen'
arch=('x86_64')
url='https://www.freedesktop.org/wiki/Software/Plymouth/'
license=('GPL2')
depends=('bash' 'cairo' 'cantarell-fonts' 'filesystem' 'fontconfig' 'freetype2' 'glib2' 'glibc'
         'libdrm' 'libevdev' 'libpng' 'libx11' 'libxkbcommon' 'pango'
         'xkeyboard-config')
makedepends=('gtk3' 'docbook-xsl' 'meson')
optdepends=('gtk3: x11 renderer')
backup=('etc/plymouth/plymouthd.conf')
install='plymouth.install'
source=("https://www.freedesktop.org/software/$pkgname/releases/$pkgname-$pkgver.tar.xz"
        'plymouth.initcpio_hook'
        'plymouth.initcpio_install')
sha256sums=('3d5b6a0ade2b0952c127960a330cb9cfadaffda78fb7621703ffd2f6a14c3390'
            'de852646e615e06d4125eb2e646d0528d1e349bd9e9877c08c5d32c43d288b6f'
            '92d2a1f5392c601e400b4ebcb310837b4ba2fdc1914c7e4b4f23a509d7c82234')

prepare() {
  cd $pkgname-$pkgver
  # Use mkinitcpio to update initrd
  sed -i 's/^dracut -f$/mkinitcpio -P/' scripts/plymouth-update-initrd

  # Change default theme
  sed -i 's/^Theme=spinner$/Theme=bgrt/' src/plymouthd.defaults
}

build() {
  artix-meson build $pkgname-$pkgver \
    -D logo=/usr/share/pixmaps/artixlinux-logo.png -D systemd-integration=false
  meson compile -C build

  # Convert logo for the spinner theme
  rsvg-convert '/usr/share/pixmaps/artixlinux-logo-text-dark.svg' -o artixlinux-logo-text-dark.png
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -r "$pkgdir/run"

  # Install mkinitcpio hook
  install -Dm644 plymouth.initcpio_hook "$pkgdir/usr/lib/initcpio/hooks/$pkgname"
  install -Dm644 plymouth.initcpio_install "$pkgdir/usr/lib/initcpio/install/$pkgname"
  
  # Install logo for the spinner theme
  install -Dm644 artixlinux-logo-text-dark.png "$pkgdir/usr/share/$pkgname/themes/spinner/watermark.png"
}
