# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=python-aiohttp-socks
pkgver=0.10.2
pkgrel=1
pkgdesc="SOCKS proxy connector for aiohttp. SOCKS4(a) and SOCKS5 are supported."
arch=('any')
url="https://github.com/romis2012/aiohttp-socks"
license=('Apache-2.0')
depends=(
  'python'
  'python-aiohttp'
  'python-python-socks'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-anyio'
  'python-flask'
  'python-pytest'
  'python-pytest-asyncio'
  'python-tiny-proxy'
  'python-trustme'
)
source=("git+$url.git?signed#tag=v$pkgver")
b2sums=('7a1c16c5fa0264f345e762b09661b6800cd03dce45f59a04bdd140e76784873f10d0f32d8ca49990d88dad2979af679b800940ba113850aa9e7b16b4fca38ddc')
validpgpkeys=('706A8935FED55F3BFB7C188B5EEAD7400A5D80ED') # Roman Snegirev (maintainer)

build() {
  cd "${pkgname//python-/}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname//python-/}"
  pytest
}

package() {
  cd "${pkgname//python-/}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
