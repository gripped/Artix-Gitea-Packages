# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-softlayer
pkgver=6.2.7
_commit=0e656572a605dcb5c2f34d0f6a5c13d0589f396e
pkgrel=1
pkgdesc="A library for SoftLayer's API"
arch=('any')
license=('MIT')
url='https://github.com/softlayer/softlayer-python'
depends=('python-prettytable' 'python-click' 'python-requests' 'python-prompt_toolkit'
         'python-pygments' 'python-urllib3' 'python-rich')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-testtools' 'tk')
source=("git+https://github.com/softlayer/softlayer-python.git#commit=$_commit"
         fix-tests.patch)
sha512sums=('88111a05431fafe3a3e9fabf9111c652da9300c8d549220776448d878c89a59ce17074b85b3e550b69672875ba05dc526073958894b0db3d2c19ed752a007abe'
            'e4f843fa3a04cd4332904f3652cb996b72bd671e701a774d11fbee59e3172f44edb178cfcb2622e8825da0d70835b4e095f56426ab6ea9c65095c3cc7c4241a3')

prepare() {
  cd softlayer-python
  sed -i 's/==/>=/' setup.py
  patch -p1 -i ../fix-tests.patch
}

build() {
  cd softlayer-python
  python setup.py build
}

check() {
  cd softlayer-python
  python -m pytest
}

package() {
  cd softlayer-python
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # It's only present when tests are enabled, so adding -f
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  rm -rf "$pkgdir"/usr/lib/python${python_version}/site-packages/tests

  # Prevent collisions with `sl` package; This command is deemed deprecated by
  # the project anyway
  rm -f "$pkgdir/usr/bin/sl"
}

# vim:set ts=2 sw=2 et:
