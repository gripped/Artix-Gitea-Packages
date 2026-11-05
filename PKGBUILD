# Maintainer: capezotte <capezotte@artixlinux.org>
# Maintainer: artoo <artoo@artixlinux.org>

pkgname=pandoc-bin
pkgver=3.13
pkgrel=1
pkgdesc="Pandoc - executable only, without 750MB Haskell depends/makedepends"
url="https://pandoc.org"
license=("GPL-2.0-or-later")
arch=('x86_64')
conflicts=("pandoc-cli")
provides=("pandoc=$pkgver" "pandoc-cli=$pkgver")
optdepends=('texlive-core: for pdf output')
source=("$pkgname-bin-$pkgver.tar.gz::https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-linux-amd64.tar.gz")
sha256sums=('38aa33b325a2bc96a4c39409631212db55702f564250bcdbead180b3bf646389')

package() {
  cd "${srcdir}/pandoc-${pkgver}"

  # To avoid having to download over a gigabyte of haskell makedepends (400-ish for ghc, plus 750 in libs), we
  # just yoink the binary from static compiled binary distributed by pandoc:
  mkdir -p "${pkgdir}/usr/share/pandoc"
  cp -R bin share "${pkgdir}/usr"

  # License file
  install -Dm644 -t "${pkgdir}/usr/share/licenses/pandoc-cli" COPYING.md

  # Bash completion
  ./bin/pandoc --completion=bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/pandoc"
}
