# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Eli schwartz <eschwartz@archlinux.org>

pkgname=firefox-noscript
pkgver=13.6.25
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
sha256sums=('42e125e167b7255a985ba593f414f7f7d4062126d783b57d0e64704fdc0e6a54'
            'SKIP')
b2sums=('97244e222398495658bdfbe7e5035e75cc5b159504a8fb92250ee7e74428ccc722651bb88bd081a7d77a7b2d443c14b588728d4b8ee5686313f06a5d37090fb7'
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
