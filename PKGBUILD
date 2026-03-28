# Packager: nous
# Maintainer: https://github.com/michael105

pkgname=tinydns
pkgver=0.3.2
pkgrel=1
pkgdesc='Tiny cache DNS server'
arch=('x86_64')
url="https://github.com/michael105/tinydns"
license=('MIT')
source=("$pkgname-$pkgver.zip::$url/archive/refs/heads/master.zip"
        'fixes.patch')
sha256sums=('c03d1c38e68533ce92579d33f6ff070bfccb48bc6976a905d8210118a7f0673b'
            '30869a8cf77c6f1479543404bb6edf763ddc8c269e4736780e6153cb61397d55')

prepare() {
  cd "$srcdir/$pkgname-master"
  patch -p1 < ../fixes.patch
}

build() {
  cd "$srcdir/$pkgname-master"
  make
}

package() {
  cd "$srcdir/$pkgname-master"
  backup=(etc/${pkgname}.conf)
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.conf ${pkgdir}/etc/${pkgname}.conf
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
