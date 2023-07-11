# Maintainer: artoo <artoo@artixlinux.org>

pkgname=pandoc-bin
pkgver=3.1.5
pkgrel=1
pkgdesc="Pandoc - executable only, without 750MB Haskell depends/makedepends"
url="http://pandoc.org"
license=("GPL2")
arch=('x86_64')
provides=("pandoc")
conflicts=("pandoc")
replaces=('pandoc-static' 'pandoc-lite' "pandoc")
# The binary release doesn't have the datafiles, so we need to yoink those out of the source tarball, too.
source=("$pkgname-source-$pkgver.tar.gz::https://github.com/jgm/pandoc/archive/${pkgver}.tar.gz")
source_x86_64=("$pkgname-bin-$pkgver.tar.gz::https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-linux-amd64.tar.gz")

sha512sums=('e1f615d65f74fa42223c3233478c13bdd04a4d9e28510084f4e966081508beb97b6b3e83e2eda8acfecae0660dffeb209e413f7258a08d7d7bfc367cba350105')
sha512sums_x86_64=('97454c530e7fa95bc4cda90ff803422850d620c7f6452be855b9198fc71832ef2531f2350044b110b36804f745ca90c44ffb4f2013bee78fdc935f810b55ed41')

package() {
  cd "${srcdir}/pandoc-${pkgver}"

  # To avoid having to download over a gigabyte of haskell makedepends (400-ish for ghc, plus 750 in libs), we
  # just yoink the binary from static compiled binary distributed by pandoc:
  mkdir -p "${pkgdir}/usr/share/pandoc"
  cp -R bin share "${pkgdir}/usr"

  # We're still missing all the datafiles and so on. We get those from the source tarball...
  cp -R data "${pkgdir}/usr/share/pandoc/"
  cp COPYRIGHT MANUAL.txt "${pkgdir}/usr/share/pandoc/"
}
