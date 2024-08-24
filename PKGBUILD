# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Gabriel B. Casella <gbc921@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=pdfgrep
pkgver=2.2.0
pkgrel=4.1
pkgdesc='A tool to search text in PDF files'
arch=(x86_64)
url='https://pdfgrep.org'
# url='https://gitlab.com/pdfgrep/pdfgrep'
license=(GPL-2.0-or-later)
depends=('libgcrypt>=1.0.0'
         pcre2
         poppler)
_archive="$pkgname-$pkgver"
source=("$url/download/$_archive.tar.gz"
        '0000-libcrypt-resolution.patch')
sha256sums=('0661e531e4c0ef097959aa1c9773796585db39c72c84a02ff87d2c3637c620cb'
            '34ee6f7a15b2e9c9cfc5881a809bc659292fe3cd919d2ad2f413997b866acf40')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -u < ../0000-libcrypt-resolution.patch
	autoreconf -fiv
}

build() {
	cd "$_archive"
	./configure --prefix=/usr
	make
}

check() {
	cd "$_archive"
	make -k check
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir/" install
}
