# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=pkgfile
pkgver=26
pkgrel=1
pkgdesc='A tool to search for files in official repository packages'
arch=('x86_64')
url='https://github.com/falconindy/pkgfile/'
license=('MIT')
depends=(
    'curl'
    'glibc'
    'libarchive'
    'libelogind'
    'libgcc'
    'libstdc++'
    'pacman'
    'pcre'
   )
makedepends=(
    'git'
    'meson')
checkdepends=(
    'gtest'
    'python'
)
install=pkgfile.install
source=("git+https://github.com/falconindy/pkgfile.git#tag=v${pkgver}?signed")
sha256sums=('e09965c7a6abef75d7fb4e572eedae31aa87b171dbc7f47f7c162d796f17f879')
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53') # Dave Reisner <d@falconindy.com>

prepare() {
    cd "$pkgname"
    # todo: patch this!
    sed -e 's|libsystemd|libelogind|g' -i meson.build
}

build() {
    artix-meson "$pkgname" -D systemd_units=false build
    meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}
