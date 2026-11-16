# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Hyacinthe Cartiaux <hyacinthe@archlinux.org>

pkgname=(
  firefox-ublock-origin
  thunderbird-ublock-origin
  ublock-origin
)
pkgbase=ublock-origin
pkgver=1.76.4
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=(any)
url=https://github.com/gorhill/uBlock
license=(GPL-3.0-or-later)
makedepends=(
  git
  python
  strip-nondeterminism
  zip
)
source=("git+$url.git#commit=$pkgver?signed")
b2sums=('cbc1d1a515d8406269c8257021bd72b5f8a9c083626536896c61736d00819eafd9136a46d252e97edcd6fd96a04b9709664872a47d92138cba4be68a1b89c4fc')
validpgpkeys=(91BFC93FDEC1D00C365C061EF5630CAE62A14316) # gorhill

prepare() {
  local dest=dist/build/uAssets

  cd uBlock
  sed -i "s/ \$(assets)//" Makefile
  git clone --depth 1 --branch master https://github.com/uBlockOrigin/uAssets $dest/main
  git clone --depth 1 --branch gh-pages https://github.com/uBlockOrigin/uAssets $dest/prod
}

build() {
  cd uBlock
  ./tools/make-chromium.sh
  ./tools/make-firefox.sh all
  ./tools/make-thunderbird.sh all

  cd dist/build
  strip-nondeterminism -t zip uBlock0.*.xpi
}

package_ublock-origin() {
  pkgdesc+=' (unpacked webextension)'
  provides=(chromium-ublock-origin)
  replaces=(chromium-ublock-origin)

  cd uBlock/dist/build/uBlock0.chromium
  install -d "$pkgdir"/usr/lib/$pkgbase
  cp -r -- * "$pkgdir"/usr/lib/$pkgbase
}

package_firefox-ublock-origin() {
  groups=(firefox-addons)

  cd uBlock/dist/build
  install -Dm644 uBlock0.firefox.xpi \
    "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

package_thunderbird-ublock-origin() {
  groups=(thunderbird-addons)

  cd uBlock/dist/build
  install -Dm644 uBlock0.thunderbird.xpi \
    "$pkgdir"/usr/lib/thunderbird/extensions/uBlock0@raymondhill.net.xpi
}
