# Maintainer: artist for Artix Linux

pkgname=faenza-icon-theme
pkgver=1.3.1
pkgrel=1
pkgdesc='Square shaped, colorful icons for desktops'
url='https://launchpad.net/~tiheum/+archive/equinox'
license=('GPL3')
arch=('any')
options=(!strip)
source=("https://github.com/rbrito/pkg-faenza-icon-theme/archive/refs/heads/master.zip"
        "copyright"
        "changelog")
sha512sums=('735c61735281ab5cb8b14981961aaeaa3437ede79d7550c7975694c84003693020230470175bc8c0daed4a6fc088f0d41a20f13511ecca5cb7f08b55eca43619'
            'b1d2a4e065fe57880edfc44600af26bad91ae0626d25c2342e2ed22dd3dc0c7cb713a858819ed6e6bc8db231b74c61456d2deb98fd09553638cb10aa4c002876'
            '40ca5b6c4818b8603b54f1b457c37a828dcf7b72dc6e7a1daf7e1eaf4eb99491b22eb30429650302ee518d25acca62ebda9b326d1e85cd1fac20529a80153c73')

package() {
  cd pkg-$pkgname-master
  mkdir -p "$pkgdir/usr/share/icons"

  cp -r Faenza* "$pkgdir/usr/share/icons"
  cp -r emesene "$pkgdir/usr/share"

  cd $srcdir
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" copyright changelog
}
