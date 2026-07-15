# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=(
  firefox-ublock-origin
  thunderbird-ublock-origin
  ublock-origin
)
pkgbase=ublock-origin
pkgver=1.72.2
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
b2sums=('ecca6da20e5cbbe1086fbb352c809db3ddb5c7e0fa267efe49d0193e16bab02f17faadf96a772aa5a611cec69f35316190a71dd07ed0228d6974ea1005ec41ea')
validpgpkeys=(91BFC93FDEC1D00C365C061EF5630CAE62A14316) # gorhill

prepare() {
  local dest=dist/build/uAssets
  rm -rf $dest

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
  /usr/bin/vendor_perl/strip-nondeterminism -t zip uBlock0.*.xpi
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
