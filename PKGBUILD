# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Taijian <taijian@posteo.de>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Damian01w <damian01w@gmail.com>
# Contributor: Padfoot <padfoot@exemail.com.au>

pkgname=plymouth
pkgver=24.004.60
pkgrel=3
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
        'plymouth.initcpio_install'
        'plymouth-shutdown.initcpio_install'
        'mkinitcpio-generate-shutdown-ramfs-plymouth.conf')
sha256sums=('f3f7841358c98f5e7b06a9eedbdd5e6882fd9f38bbd14a767fb083e3b55b1c34'
            'de852646e615e06d4125eb2e646d0528d1e349bd9e9877c08c5d32c43d288b6f'
            'e7563fc8e25c3cbc869d3ecc2acee28e225855723c90c569310e308aab86a8a7'
            '2e63bd2460ce4ca56b9a407802c35ce69072cda40679b42889d692adf2fc656c'
            '04af86a0ec83fc92d7339e1a7fcc0d55b86b95797a1a5f1a3b8d850996a3926c')

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
  rsvg-convert '/usr/share/pixmaps/archlinux-logo-text-dark.svg' -o archlinux-logo-text-dark.png
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -r "$pkgdir/run"

  # Install mkinitcpio hook
  install -Dm644 plymouth.initcpio_hook "$pkgdir/usr/lib/initcpio/hooks/$pkgname"
  install -Dm644 plymouth.initcpio_install "$pkgdir/usr/lib/initcpio/install/$pkgname"

  # Install mkinitcpio shutdown hook and systemd drop-in snippet
  install -Dm644 plymouth-shutdown.initcpio_install "$pkgdir/usr/lib/initcpio/install/$pkgname-shutdown"
  
  # Install logo for the spinner theme
  install -Dm644 artixlinux-logo-text-dark.png "$pkgdir/usr/share/$pkgname/themes/spinner/watermark.png"
}
