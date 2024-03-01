# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Jakub Klinkovský <j.l.k@gmx.com>
# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

pkgname=mandoc
pkgver=1.14.6
pkgrel=4
pkgdesc='A suite of tools compiling mdoc from the OpenBSD project'
arch=(x86_64)
url='https://mdocml.bsd.lv'
license=(ISC)
depends=(zlib)
makedepends=(less)
optdepends=('less: default pager')
provides=(man)
conflicts=(man)
_archive="$pkgname-$pkgver"
source=("$url/snapshots/$_archive.tar.gz"
        configure.local)
sha256sums=('8bf0d570f01e70a6e124884088870cbed7537f36328d512909eb10cd53179d9c'
            '383772d5dd7c51319588ac4b63d4e7c452490568f6a3e905d118fdd6c4aa8a68')

prepare() {
    cd "$_archive"
    cp ../configure.local .
}

build() {
    cd "$_archive"
    # apply CFLAGS and LDFLAGS from makepkg.conf
    {
        echo "CFLAGS=${CFLAGS@Q}"
        echo "LDFLAGS=${LDFLAGS@Q}"
    } >> configure.local
    ./configure
    make
}

package() {
    cd "$_archive"
    DESTDIR="$pkgdir" make install
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
