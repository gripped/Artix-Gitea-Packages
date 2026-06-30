# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Eli schwartz <eschwartz@archlinux.org>

pkgname=firefox-noscript
pkgver=13.6.26
pkgrel=1
pkgdesc="Extension for firefox which disables javascript"
arch=('any')
url="https://noscript.net/"
license=('GPL2')
checkdepends=('jq')
makedepends=('nodejs' 'git' 'npm')
groups=('firefox-addons')
source=("git+https://github.com/hackademix/noscript.git#tag=$pkgver"
	"nscl.git::git+https://github.com/hackademix/nscl.git")
sha256sums=('b3b7cd0dfb0828d811b524d6eafcee4797e5597b64266c127f7ef5d88ffd11a2'
            'SKIP')
b2sums=('086c9217a997e956eac9ebaf13ff1613bbb3e0d5d077a7405eb8a6e60726994fef2459e14a2978eb0c39bb62f319e2a529e6d4b5e553c0c13f749ff322ea8584'
        'SKIP')

prepare() {
  cd noscript
  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  cd noscript
  npm install web-ext decomment
  PATH=`pwd`/node_modules/.bin:$PATH bash ./build.sh
}

package() {
  optdepends=('firefox' 'konform-browser')
  _extension_id="{73a6fe31-595d-460b-a920-fcc0f8843232}"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 noscript/xpi/noscript-$pkgver.xpi "${_extension_dest}.xpi"
}
