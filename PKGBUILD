# Maintainer: artist for Artix Linux

pkgname=fakeroot
epoch=1
pkgver=1.37.2
pkgrel=2
pkgdesc='Tool for simulating superuser privileges'
arch=('x86_64')
license=('GPL-3.0-or-later')
url='https://tracker.debian.org/pkg/fakeroot'
install=fakeroot.install
depends=('glibc' 'filesystem' 'sed' 'util-linux' 'sh')
makedepends=('git' 'udev' 'po4a')
checkdepends=('sharutils')
source=("git+https://salsa.debian.org/clint/fakeroot.git#tag=upstream/${pkgver}"
        "https://sources.debian.org/data/main/f/fakeroot/1.37.1.1-1/wrapawk")
sha256sums=('8b347d814185d51f459b3122681931205cbda3f5ac34ab8995e1089f81f762a3'
            'd28fbe22bfd67c87746a39c916d4a284eda2ec26b67b181bbc7a5abd8e587ace')

prepare() {
  cd "${pkgname}"

  cp ../wrapawk ./

  autoreconf -fi
}

build() {
  cd "${pkgname}"

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/libfakeroot \
    --disable-static \
    --with-ipc=sysv
  make

  cd doc
  po4a -k 0 --rm-backups --variable 'srcdir=../doc/' po4a/po4a.cfg
}

check() {
  cd "${pkgname}"

  make \
    VERBOSE=1 \
    check
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" install

  install -dm0755 "${pkgdir}/usr/lib/ld.so.conf.d/"
  echo '/usr/lib/libfakeroot' > "${pkgdir}/usr/lib/ld.so.conf.d/fakeroot.conf"

  # install README for sysv/tcp usage
  install -Dm0644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
