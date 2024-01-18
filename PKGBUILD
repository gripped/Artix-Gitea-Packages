# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-polkit
pkgver=124
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges"
url="https://gitlab.freedesktop.org/polkit/polkit"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
	lib32-glib2
	lib32-elogind
	polkit
)
makedepends=(
	git
	lib32-expat
	lib32-pam
	meson
)
provides=(libpolkit-gobject-1.so)
_commit=82f0924dc0eb23b9df68e88dbaf9e07c81940a5a # tags/124
source=(
	"git+https://gitlab.freedesktop.org/polkit/polkit.git#commit=$_commit"
	"0001-fix-sysusers-d.patch"
)
b2sums=('SKIP'
	'360556ed06af2b8d69a9107ff91b7668b16e5bff0a1be165c60189c5631f2a4dd60341b7a409d98e978e698bb69138177d4d3dc49a5305d83fe89e2ffc79b9de')

pkgver() {
	cd polkit
	git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
	cd polkit
	patch -Np1 -i ../0001-fix-sysusers-d.patch
}

build() {
	local meson_options=(
		--cross-file lib32
		-D introspection=false
		-D libs-only=true
		-D os_type=redhat
		-D session_tracking=libelogind
		-D systemdsystemunitdir=no
		-D polkitd_uid=102
		-D polkitd_user=polkitd
		-D tests=true
	)

	artix-meson polkit build "${meson_options[@]}"
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs -t 3
}

package() {
	meson install -C build --destdir "$pkgdir"

	rm -r "$pkgdir"/usr/{include,lib,share}
}

# vim:set sw=2 sts=-1 et:
