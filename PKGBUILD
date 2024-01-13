# Maintainer: Rémy Oudompheng <remy@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=namcap
pkgver=3.5.0
pkgrel=1
pkgdesc='A Pacman package analyzer'
arch=(any)
url="https://gitlab.archlinux.org/pacman/$pkgname"
license=(GPL-2.0-or-later)
depends=(binutils
         elfutils
         licenses
         pkgconf
         pyalpm
         python
         python-license-expression
         python-pyelftools)
checkdepends=(python-pytest
              python-six
              elogind)
makedepends=(python-{build,installer,wheel}
            python-setuptools)
_archive="$pkgname-$pkgver"
source=("$url/-/releases/$pkgver/downloads/$_archive.tar.bz2"{,.asc})
sha256sums=('4ce09b1fea317b553f565326cac1ac532f2e3c2f857bbce668d2a68325c5ef98'
            'SKIP')
validpgpkeys=(9F377DDB6D3153A48EB3EB1E63CC496475267693  # caleb@alerque.com
              CCB34EBBB9541EF3F7B366C1D4A753468A5A5B67) # alerque@archlinux.org

build() {
  cd "$_archive"
  python -m build -wn
}

check() {
  cd "$_archive"
  env PARSE_PKGBUILD_PATH="$PWD" PATH="$PWD/scripts:$PATH" pytest
}

package() {
  cd "$_archive"
  python -m installer -d "$pkgdir" dist/*.whl
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
  mv "$pkgdir/"{"$site_packages/usr/share",usr}
  rmdir "$pkgdir/$site_packages/usr"
}
