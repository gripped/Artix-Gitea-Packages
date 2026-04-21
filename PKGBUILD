# Maintainer: Sébastien Luttringer
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgname=weston
pkgver=15.0.0
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('fontconfig' 'glibc' 'wayland' 'libxkbcommon' 'libinput' 'libunwind' 'pixman'
         'libdrm' 'pam' 'libelogind' 'cairo' 'libpng' 'libjpeg-turbo' 'libwebp'
         'mesa' 'libegl' 'libevdev' 'libgles' 'glib2' 'pango' 'lcms2' 'mtdev' 'libx11'
         'libxcb' 'dbus' 'libva' 'libxcursor' 'colord' 'seatd' 'lua'
         'gstreamer' 'gst-plugins-base-libs')
makedepends=('wayland-protocols' 'meson' 'ninja' 'freerdp' 'neatvnc' 'libpipewire'
             'xorg-xwayland' 'xcb-util-cursor' 'libdisplay-info' 'vulkan-headers')
optdepends=('xorg-xwayland: support x11 backend'
            'libpipewire: support pipewire backend'
            'freerdp: support rdp backend'
            'neatvnc: support vnc backend'
            'libdisplay-info: support drm backend'
            'lua: support lua shell')
options=(!lto)
validpgpkeys=('7032877A3EB1EAE3E4DC9DFBF63412E60947D6EF' # Marius Vlad <marius.vlad@collabora.com>
              '34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48' # emersion <contact@emersion.fr>
              'C7223EBE4EF66513B892598911A30156E0E67611' # Bryce Harrington
              'C0066D7DB8E9AC6844D728715E54498E697F11D7') # Derek Foreman
source=("https://gitlab.freedesktop.org/wayland/weston/-/releases/$pkgver/downloads/weston-$pkgver.tar.xz"{,.sig})
sha256sums=('58c6186d29a5d2f0be0dec4882af71cc190a11da803f6ed1bf0b2c74120da973'
            'SKIP')

prepare() {
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  artix-meson $pkgname-$pkgver build \
    --libexec=lib/weston -D b_lto=false -D systemd=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  # license
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
