pkgname=caja-gtkhash
pkgver=1.5
pkgrel=3
pkgdesc="A GTK+ utility for computing message digests or checksums (Gtkhash with Caja filemanager plugin)"
arch=('x86_64')
url="https://github.com/tristanheaven/gtkhash"
license=('GPL')
depends=(
    'caja'
    'dconf'
    'gtk3'
    'libb2'
    'libgcrypt'
    'nettle'
)

makedepends=(
    'appstream-glib'
    'intltool'
    'librsvg'
    'meson'
    'xdg-utils'
)
provides=(
  gtkhash
  gtkhash-caja
  ${pkgname}
)
conflicts=(
  gtkhash
  gtkhash-caja
  gtkhash-nautilus
  gtkhash-nemo
  gtkhash-thunar
)
replaces=(caja-gtkhash)
source=("${url}/releases/download/v$pkgver/gtkhash-$pkgver.tar.xz"
nettle4.patch)
sha256sums=('7102a192eca3e82ed67a8252a6850440e50c1dbea7c6364bda154ec80f8ff005'
            'a68f9baddf05727629a1406e166afced37d9f00bc1985cb413564436b90ecfe6')

prepare() {
  pwd
  ls -l
  mkdir -p plugins
  patch -p0 -i nettle4.patch
}

build() {
  arch-meson "gtkhash-$pkgver" build \
    -Dglib-checksums='true' \
    -Dlinux-crypto='true' \
    -Dnettle='true' \
    -Dbuild-caja='true' \
    -Dbuild-nautilus='false' \
    -Dbuild-nemo='false' \
    -Dbuild-thunar='false'
  meson compile -C build
}

check() {
  desktop-file-validate build/data/*.desktop
  appstream-util validate-relax --nonet build/data/appdata/*.appdata.xml
  appstream-util validate-relax --nonet build/data/appdata/*.metainfo.xml
}


package() {

  meson install -C build --destdir "$pkgdir"
}
