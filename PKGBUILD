# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Taijian <taijian@posteo.de>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Damian01w <damian01w@gmail.com>
# Contributor: Padfoot <padfoot@exemail.com.au>

pkgname=plymouth
pkgver=24.004.60
pkgrel=11
pkgdesc='Graphical boot splash screen'
arch=(x86_64)
url='https://www.freedesktop.org/wiki/Software/Plymouth/'
license=(GPL-2.0-or-later)
depends=(
  bash
  cairo
  cantarell-fonts
  filesystem
  fontconfig
  freetype2
  glib2
  glibc
  libdrm
  libevdev
  libpng
  libx11
  libxkbcommon
  pango
  xkeyboard-config
)
makedepends=(
  docbook-xsl
  git
  gtk3
  meson
)
optdepends=('gtk3: x11 renderer')
backup=(
  etc/logrotate.d/bootlog
  etc/plymouth/plymouthd.conf
)
install='plymouth.install'
source=(
  "git+https://gitlab.freedesktop.org/plymouth/$pkgname.git#tag=$pkgver"
  plymouth.initcpio_hook
  plymouth.initcpio_install
  plymouth-shutdown.initcpio_install
  mkinitcpio-generate-shutdown-ramfs-plymouth.conf
)
b2sums=('a3d55f4f7be81bdf2ddd5c2b74a3fdb4e368c31fc41e12ab100ce2a7986cb418151b3df0d0316011710dd0e1ae99631166eecf80bc1dd5cc9054a4685266afed'
        'afb2449b542aa3e971eab6b953c907347fdf4e499b4140a5e6736a7c99557c0d8d2fed28dbee56d84c8c619335c59bd382457d85e51145884ad0616e9095f232'
        '078482ac7758e20c5c8cef2bd1f18809102f0a4df044d918dd18e272101686013f80502980c9a3d868316a4b01e45cda0fcc7929ac4d1d092da6fea57da53bdf'
        '063448411de837ed38ece935719f07fd17b18830680c9fa95b7bd39a097778186c40373590504c9b44144125986304311f528c73592c29d19043b8395e6f99c2'
        '7bb910b7402ad4372f1918be763421308534044c46d42e77af0aadcb7cbe13a99633805b36fa841f8ea1006ddb204ecea3031b96b05ec4e8d16150b2c7864629')

prepare() {
  cd $pkgname

  # Various fixes from upstream
  git cherry-pick -n -m 1 24.004.60..287ae4de4547c944cd1dad696aa999b1699540bd

  # Use mkinitcpio to update initrd
  sed -i 's/^dracut -f$/mkinitcpio -P/' scripts/plymouth-update-initrd

  # Change default theme
  sed -i 's/^Theme=spinner$/Theme=bgrt/' src/plymouthd.defaults
}

build() {
  artix-meson $pkgname build \
    -D logo=/usr/share/pixmaps/artixlinux-logo.png -Dsystemd-integration=false
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

  install -Dm644 plymouth-shutdown.initcpio_install "$pkgdir/usr/lib/initcpio/install/$pkgname-shutdown"
  
  # Install logo for the spinner theme
  install -Dm644 artixlinux-logo-text-dark.png "$pkgdir/usr/share/$pkgname/themes/spinner/watermark.png"
}
