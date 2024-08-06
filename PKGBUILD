# Contributor: Dave Reisner <d@falconindy.com>

pkgname=pkgfile
pkgver=22
pkgrel=1
pkgdesc='alpm .files metadata explorer'
arch=(x86_64)
url=https://github.com/falconindy/pkgfile
license=(MIT)
depends=(
  curl
  libarchive
  pacman
  pcre
)
makedepends=(
  clang
  git
  meson
  libelogind
 
)
install=pkgfile.install
source=("git+$url.git#tag=v$pkgver?signed"
	"0001-remove-libsystemd.patch")
b2sums=('2332b2b7f198f4e0021f24b0f2ad44e253dcf711d97d60e14f246993b42fd38079ba1117bebea2441572379847af0526fdf58ed20cb601f37eea3d4d79734ab1'
        'a4e8818b178c749aaf305cc2d6280f812cc185c4f3df98d644a4a3eb9cb904298d7d66c75d24619e87d6d6f60614754b3d20884c78bf0d94f1598fd9d8422f2f')
validpgpkeys=(487EACC08557AD082088DABA1EB2638FF56C0C53) # Dave Reisner <d@falconindy.com>

prepare() {
  cd $pkgname
  git apply $srcdir/0001-remove-libsystemd.patch
}

build() {
  cd $pkgname
  artix-meson -D systemd_units=false build
  ninja -v -C build
}

package() {
  cd $pkgname

  DESTDIR="$pkgdir" ninja -C build install
}
