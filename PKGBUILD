# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=QCustomPlot
pkgbase=qcustomplot
pkgname=('qcustomplot' 'qcustomplot-doc')
pkgver=2.1.1
pkgrel=1
pkgdesc="Qt C++ widget for plotting and data visualization"
arch=('x86_64')
url="https://www.qcustomplot.com/"
license=('GPL3')
makedepends=('doxygen' 'graphviz' 'qt5-tools')
source=(
  "${pkgname}-${pkgver}.tar.bz2::https://www.qcustomplot.com/release/${pkgver}/${_name}-sharedlib.tar.gz"
  "${pkgname}-${pkgver}-source.tar.gz::https://www.qcustomplot.com/release/${pkgver}/${_name}.tar.gz"
)
sha512sums=('c661e4a835066fee92b254fbd7b825dbd5c58973189ff2099a01308cb81fe6bf3bac1456f5da91f01c6265f8f548f61b57e237d00a9b5c2c94acf1a024baa18e'
            '2e49a9b3f7ab03bcd580e5f3c3ae0d5e8c57d3ccce0ceed9862cde7ea23e2f3672a963af988be60e504cb5aa50bc462e4b28acf577eae41cc6fea2802642dc19')
b2sums=('5ded041a46a35dece817749479cba83da260407e387a339c5fba57a37897118b20cd50f362e78ea4a35c9babc5f6c73c235a671a17b5b0423b00e472c0a8eb60'
        '03f72e304fd55133b27cadb75941696d94d5d485c6ac2200d46f3da282fe23c1ca3638cef0cab9f760fb7f259043a3207f6a3b52d810305d1349c2c6c9306cdf')

prepare() {
  mv -v "${pkgbase}-sharedlib" "${pkgbase}-${pkgver}"
  cd "${pkgbase}-${pkgver}"
  # move required amalgameted sources into place
  mv -v "../${pkgname}/"* .
  sed \
		-e 's:../../::g' \
		-e '/CONFIG/s:shared.*:shared:g' \
		sharedlib-compilation/sharedlib-compilation.pro > ${pkgbase}.pro || die
}

build() {
  cd "${pkgbase}-${pkgver}"
  qmake-qt5 ${pkgbase}.pro
  make
}

package_qcustomplot() {
  depends=('qt5-base')
  provides=('libqcustomplot.so')
  replaces=('qcustomplot-qt5')

  cd "${pkgbase}-${pkgver}"
  # there is no install target
  install -vDm 644 "${pkgname}.h" -t "${pkgdir}/usr/include/"
  install -vdm 755 "${pkgdir}/usr/lib/"
  cp -av "lib${pkgname}.so"* "${pkgdir}/usr/lib/"
  install -vDm 644 changelog.txt -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

package_qcustomplot-doc() {
  pkgdesc+=" (docs)"

  cd "${pkgbase}-${pkgver}"
  install -vDm 644 documentation/*.qch -t "${pkgdir}/usr/share/doc/qt/"
  find examples -type f -exec install -vDm 644 {} "${pkgdir}/usr/share/doc/${pkgbase}/"{} \;
  (
    cd documentation
    find html -type f -exec install -vDm 644 {} "${pkgdir}/usr/share/doc/${pkgbase}/"{} \;
  )
}
