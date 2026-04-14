# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=fzssh
pkgver=1.1.10
pkgrel=1
pkgdesc="a SSH/SFTP library based on libfilezilla"
url="https://filezilla-project.org"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('nettle' 'gmp' 'libfilezilla' 'argon2' 'libstdc++' 'libgcc' 'glibc')
makedepends=('meson')
# Upstream download link became (purposely) unstable
# See https://trac.filezilla-project.org/ticket/13186
source=("https://sources.archlinux.org/other/packages/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('9e34605c7c349aa3be31822b15c564c77f5f3f68030d8560b7b5b9dc085fd634')
sha512sums=('b726b478e1088f3e6259cd31cd861648c5dfb955f6de73a24da157efe7aa7a0593782ad00dabcfca6f8a9c41fdefcf348e84bcd23ecd29086dd2e5e1ed1f785b')

build() {
	artix-meson "${pkgname}-${pkgver}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
