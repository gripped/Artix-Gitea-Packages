# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-session
pkgver=1.0.0
pkgrel=1.3
epoch=1
pkgdesc='Session manager for the COSMIC desktop environment'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-session
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  bash
  cosmic-applets
  cosmic-app-library
  cosmic-bg
  cosmic-comp
  cosmic-files
  cosmic-greeter
  cosmic-icon-theme
  cosmic-idle
  cosmic-launcher
  cosmic-notifications
  cosmic-osd
  cosmic-panel
  cosmic-randr
  cosmic-screenshot
  cosmic-settings-daemon
  cosmic-settings
  cosmic-workspaces
  gcc-libs
  glibc
  noto-fonts
  switcheroo-control
  ttf-opensans
  vulkan-driver
  xdg-desktop-portal-cosmic
  xorg-xwayland
)
makedepends=(
  cargo
  git
  just
  lld
)
optdepends=(
  'cosmic-files: COSMIC file manager'
  'cosmic-player: COSMIC media player'
  'cosmic-store: COSMIC store'
  'cosmic-terminal: COSMIC terminal'
  'cosmic-text-editor: COSMIC text editor'
  'cosmic-wallpapers: COSMIC wallpapers'
  'dconf: Apply COSMIC settings to GTK applications'
  'gnome-keyring: Start gnome keyring components if the daemon is active'
  'system-config-printer: printer settings'
)
source=(
  git+https://github.com/pop-os/cosmic-session.git#tag=epoch-${pkgver}
  cosmic-session-lto.patch
  no_journald-systemctl.patch
)
b2sums=('2464a7a5db8ee04883257f81c78a9cdcf6a6110c157a6a201cf062f7e29b6107116a37b19e0df7d3d385f20b6a845762e2b9ac42b1e08d3a12c2f6f056aaf117'
        '8b1a6ba7e159831e24d4e2abe1ee82c3b9a1f7c34af982a0ec20f5941c816922213cbc6bda3a7c2419ace2adf5cdfea131fab76045454b6ad800e18df0368307'
        '7c9db3b6d2456e5c303da6f72a8169207ce35ca9fcb9beffb548cd55b3fe0cb9019b719c85540159075444cdd7bffce117a19cad57f3b8d766ae27cc47615f79')

prepare() {
  cd cosmic-session
  patch -Np1 -i ../cosmic-session-lto.patch
  patch -Np1 -i ../no_journald-systemctl.patch
  cargo fetch --locked
  sed -i 's/libexec/lib/g' Justfile src/main.rs
}

build() {
  cd cosmic-session
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  cargo build --release --frozen --features autostart
}

package() {
  cd cosmic-session
  just rootdir="${pkgdir}" install
  install -Dm644 data/dconf/profile/cosmic -t "$pkgdir/usr/share/dconf/profile/"
}

# vim: ts=2 sw=2 et:
