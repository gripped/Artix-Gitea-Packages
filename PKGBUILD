# Maintainer: artist for Artix Linux

pkgname=ex-evi-compat
pkgver=1
pkgrel=2
pkgdesc="The ex and vi commands based on EVi's compatibility modes"
arch=(any)
url="https://gitlab.archlinux.org/archlinux/packaging/packages/ex-vi-compat"
license=(0BSD)
depends=(evi)
provides=(
  edit
  ex
  vedit
  vi
  view
)
conflicts=(vi)
replaces=(vi)
source=(
  LICENSE
  vi.sh
)
sha512sums=('a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930'
            'a0e984b125d8abee56ea8d8db18be7994e8285ff04b983249ffd97ef4e2afb2ddb13cd8a70e4f67c48b94197f387f4a9222e8cf81731d7ec2a80f7f69e447d50')
b2sums=('a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101'
        '382ca106b5410780a5f74ef6c64179c6cd9315923b0ba90a236da7325799f74fdbd2bb57dfd648412962787d7b2510605d8ec72b1da52c18154bd88527c25467')

package() {
  local cmd

  install -vDm 755 vi.sh "$pkgdir/usr/bin/vi"
  for cmd in {edit,ex,vedit,view} ; do
    ln -sv evi "$pkgdir/usr/bin/$cmd"
  done
  install -vDm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/0BSD.txt"
}

