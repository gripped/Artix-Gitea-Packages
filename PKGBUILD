# Maintainer: artist for Artix Linux

pkgname=greetd-tuigreet
_pkgname=${pkgname#*-}
pkgver=0.8.0
pkgrel=4.3
pkgdesc='A console UI greeter for greetd'
url="https://github.com/apognu/$_pkgname"
license=(GPL3)
arch=(x86_64)
depends=(gcc-libs greetd)
provides=(greetd-greeter)
makedepends=(cargo scdoc)
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz"
        "$_pkgname.tmpfiles"
	"startx.patch"
        "ratatui.patch"
        "keep_un_after_bad_pwd.patch")
sha256sums=('ed371ebe288a3e5782f01681c6c4ed4786b470184af286fa0e7b8898e47c154e'
            '8f83aee7874aab5d06981a1d1cd05df906368a79dbca90d157a33a2f023b67d3'
            '3e8649945767e9a2625d049a82616729586e0f452680e9e164f3e74101ff5d77'
            '74f0c2b15fd87d14b2505c28544330e3323fa849808bfa944371da3f11069b5f'
            '9e0e41b0e7a8af863015ee0a0d0f7b288ddad2a03f7d74e31de863cff8afbf38')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
	patch -Np1 -i "${srcdir}"/startx.patch
	patch -Np1 -i "${srcdir}"/ratatui.patch
	patch -Np1 -i "${srcdir}"/keep_un_after_bad_pwd.patch
}

build() {
	cd "$_archive"
	cargo build --release --all-features
	scdoc < contrib/man/$_pkgname-1.scd > contrib/man/$_pkgname.1
}

check() {
	cd "$_archive"
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/share/man/man1/" "contrib/man/$_pkgname.1"
	install -Dm0644 "../$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
