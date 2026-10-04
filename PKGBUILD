# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-system-monitor
pkgver=51.0
pkgrel=2
pkgdesc="View current processes and monitor system state"
url="https://apps.gnome.org/SystemMonitor"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glib2
  glibc
  glibmm-2.68
  graphene
  gtk4
  gtkmm-4.0
  hicolor-icon-theme
  libadwaita
  libgcc
  libgtop
  librsvg
  libsigc++-3.0
  libstdc++
  pango
  polkit
)
makedepends=(
  appstream
  catch2
  git
  glib2-devel
  meson
  yelp-tools
)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-system-monitor.git#tag=${pkgver/[a-z]/.&}")
b2sums=('fc6c5bdd8282bdceb330b655935cfb2ad9cd80fe80a98dcf51ad8bf9fea9cc3a11749c43ad5ed271ae307d68fc05db7bcb6cad85b6f895b6bcb1e393f37dab9b')

prepare() {
  cd $pkgname

  # Crash without libselinux
  # https://gitlab.archlinux.org/archlinux/packaging/packages/gnome-system-monitor/-/work_items/6
  # https://gitlab.gnome.org/GNOME/gnome-system-monitor/-/work_items/381
  # https://gitlab.gnome.org/GNOME/gnome-system-monitor/-/merge_requests/232
  git cherry-pick -n 3a6dff2118c435fb3a7449dfc68979c3069a7e1c \
                     fbf55e94586f2113f38026ceb86447c701a21174
  # https://gitlab.gnome.org/GNOME/gnome-system-monitor/-/merge_requests/233
  git cherry-pick -n 224c8ebb4bab81ab7e2f1ec0a2ab5bc50cc31095 \
                     3c8456625310cb95fc564e6bab563e0dbac5c7e9
  # https://gitlab.gnome.org/GNOME/gnome-system-monitor/-/merge_requests/234
  git cherry-pick -n 4e257173043dc342ba7512d27f543c38043f09cd \
                     e8e0e5a04828269c75f7eb82b84b2190390f6729 \
                     cf30a3cd45b7fa42bdefa9d579933ecd8de3fe61
}

build() {
  artix-meson $pkgname build -Dsystemd=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
