# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Fredrik Haikarainen <fredrik.haikarainen@gmail.com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
pkgname='light'
pkgver='1.2.2'
_commit='2a54078cbe3814105ee4f565f451b1b5947fbde0'
pkgrel='5'
pkgdesc='A program to control backlights (and other hardware lights)'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL-3.0-only')
install="$pkgname.install"
source=(
	# $pkgrel added to make sure our cached source file doesn't get used, as the previous pkgrel used a different upstream
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$_commit/$pkgname-$_commit.tar.gz"
	'fix-global-var.diff'
	'namespace-udev-rule.diff'
	'update-manpage.diff'
)
sha512sums=(
	'0000000000000000000000000000000000000000000000000000000000000000'
	'0000000000000000000000000000000000000000000000000000000000000000'
	'0000000000000000000000000000000000000000000000000000000000000000'
	'0000000000000000000000000000000000000000000000000000000000000000'
)

_sourcedirectory="$pkgname-$_commit"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	patch --forward -p1 < "../fix-global-var.diff"
	patch --forward -p1 < "../namespace-udev-rule.diff"
	patch --forward -p1 < "../update-manpage.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	./autogen.sh
	./configure --prefix='/usr' --with-udev
	make
}

check() {
	# Not using -V, as it doesn't match the real version
	_checkoutput="$("$srcdir/$_sourcedirectory/src/$pkgname" -h)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q 'Increase brightness by value$'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
