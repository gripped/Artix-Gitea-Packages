# Maintainer: artoo <artoo@artixlinux.org>

pkgname=pandoc-bin
pkgver=3.1.11.1
pkgrel=1
pkgdesc="Pandoc - executable only, without 750MB Haskell depends/makedepends"
url="http://pandoc.org"
license=("GPL-2.0-or-later")
arch=('x86_64')
provides=("pandoc")
conflicts=("pandoc")
replaces=('pandoc-static' 'pandoc-lite' "pandoc")
# The binary release doesn't have the datafiles, so we need to yoink those out of the source tarball, too.
source=("$pkgname-source-$pkgver.tar.gz::https://github.com/jgm/pandoc/archive/${pkgver}.tar.gz")
source_x86_64=("$pkgname-bin-$pkgver.tar.gz::https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-linux-amd64.tar.gz")

sha512sums=('af7b53a1f6d994f063f9bd97327046887f13ee91cab61786194d0d9bc0eb2454bc0a86ecf25b129ca7dc1b7e2eecd4b92c1165e7e45fdedf05db08709b6415e9')
sha512sums_x86_64=('60d2bab0d4bf134911011625da1bcb52024f63102b16a4735aa80463fa36b6e6b4e9023c3b4ed8a4587f35041d5a5929a4ac168b0b4c206cbcade66462f145ee')

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
