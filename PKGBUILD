# Maintainer: commandk <handle@artixlinuxorg>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=(
  firefox-tridactyl
  firefox-developer-edition-tridactyl
  firefox-esr-tridactyl
  konform-browser-tridactyl
)

pkgbase=firefox-tridactyl
pkgver=1.25.0
pkgrel=1
pkgdesc="Replace Firefox's control mechanism with one modelled on Vim"
arch=(any)
url=https://github.com/tridactyl/tridactyl
license=(Apache-2.0)
groups=(firefox-addons)
makedepends=(
  git
  node-gyp
  python
  strip-nondeterminism
  yarn
)
source=("git+$url.git#commit=$pkgver?signed")
b2sums=('1b9164b5ef0d4a0ef955882f6b4078f2542d67293b3319484692b1f14bab43ea5da27cf7fc3c848a8f5eb7865916385109437d269cc561059c1a3833a895cb3f')
validpgpkeys=(15D03C86837936A0A638AA2D2BB8C36BB504BFF3) # Oliver Blanthorn <freedom4cows@gmail.com>

prepare() {
  cd tridactyl
  yarn install --frozen-lockfile --non-interactive --ignore-scripts
}

build() {
  cd tridactyl
  scripts/sign nosignstable
  strip-nondeterminism -t zip web-ext-artifacts/tridactyl-$pkgver.xpi
}

_package() {
  cd tridactyl
  install -Dm644 web-ext-artifacts/tridactyl-$pkgver.xpi \
    "$pkgdir"/usr/lib/$1/browser/extensions/tridactyl.vim@cmcaine.co.uk.xpi
}

package_firefox-tridactyl() {
  export pkgdesc="Replace Firefox control mechanism with one modelled on Vim"
  export groups=(firefox-addons)
  _package firefox
}

package_firefox-developer-edition-tridactyl() {
  export pkgdesc="Replace Firefox Developer Edition control mechanism with one modelled on Vim"
  export groups=(firefox-developer-edition-addons)
  _package firefox-developer-edition
}

package_firefox-esr-tridactyl() {
  export pkgdesc="Replace Firefox ESR control mechanism with one modelled on Vim"
  export groups=(firefox-esr-addons)
  _package firefox-esr
}

package_konform-browser-tridactyl() {
  export pkgdesc="Replace Konform Browser control mechanism with one modelled on Vim"
  export groups=(konform-browser-addons)
  _package konform
}
