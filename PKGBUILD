# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Vianney le Clément <vleclement AT gmail·com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=parallel
pkgname=('parallel' 'parallel-docs')
pkgver=20241122
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel'
arch=('any')
url='https://www.gnu.org/software/parallel/'
license=('GPL-3.0-only')
source=(
  "https://ftp.gnu.org/gnu/$pkgbase/$pkgbase-$pkgver.tar.bz2"{,.sig}
  '0001-Remove-citation-things.patch'
)
sha512sums=('ab95a9213ed2636d653683be9078ba2882fbd0813194a900436aedeb2957d417914b51c1712ef3a331b1b3ba732793afeef5c21307c7c0a1f37a15fb616272d8'
            'SKIP'
            'd688db58ed94aa23c335997037ff7960a6aefdc19c59ff93be5eae334e0a1bafbc3be7d6fab573f3c66824e2f42a86a3f021eebfe4f03e5c07e711f8362cbb63')
b2sums=('691b5eae714f6b4f4be46e4e8d43c7e424a443576f59c27590f1093a870d15bf22b4baee7924fe1eb95e92fc3806feb40ea90a8e04d9278df5807b43293068a4'
        'SKIP'
        '4d18c7bfd6b0d417ba8d11e2c830b5d875cb6665459bdc2ad01d3575fe8f0c9333a7eb99382b69d256fefcbc3e2a8131a64c4c2a996d2fc76f360cc4946aa51a')
validpgpkeys=('CDA01A4208C4F74506107E7BD1AB451688888888')

prepare() {
  cd "$pkgbase-$pkgver"

  # remove citation warnings
  # https://en.opensuse.org/openSUSE:Packaging_guidelines#Donation_requests
  patch -p1 -i "$srcdir/0001-Remove-citation-things.patch"
}

build() {
  cd "$pkgbase-$pkgver"

  ./configure --prefix=/usr

  make
}

package_parallel() {
  depends=('perl' 'procps')
  optdepends=('parallel-docs: documentation')

  cd "$pkgbase-$pkgver"

  make DESTDIR="$pkgdir" install

  # split documentation out of main package
  mv "$pkgdir/usr/share/doc" docs
}

package_parallel-docs() {
  pkgdesc+=' (documentation)'

  cd "$pkgbase-$pkgver"

  install -vd "$pkgdir/usr/share/doc"
  mv -v docs/* "$pkgdir/usr/share/doc"
}

# vim:set ts=2 sw=2 et:
