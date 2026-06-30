# Maintainer: commandk <handle@artixlinuxorg>

pkgname=(
  firefox-tridactyl
  firefox-developer-edition-tridactyl
  firefox-esr-tridactyl
  konform-browser-tridactyl
)

pkgbase=firefox-tridactyl
pkgver=1.24.6
pkgrel=1
arch=(any)
url=https://github.com/tridactyl/tridactyl
license=(Apache-2.0)
makedepends=(
  git
  node-gyp
  python
  strip-nondeterminism
  yarn
)
source=("git+$url.git#commit=$pkgver?signed")
b2sums=('ed418936ac7832c971e7c92ff34926dbd19fb4c198e5f49ea438d0d2fdca1047d340615cbdeee3fb0d12a9c7106a562b275f0ba1904a02c75cdc32d2c42bacbc')
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
