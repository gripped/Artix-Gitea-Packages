# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=fzssh
pkgver=1.2.0
pkgrel=3
pkgdesc="a SSH/SFTP library based on libfilezilla"
url="https://filezilla-project.org"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('nettle' 'gmp' 'libfilezilla' 'argon2' 'libstdc++' 'libgcc' 'glibc')
makedepends=('meson')
# Upstream download link became (purposely) unstable
# See https://trac.filezilla-project.org/ticket/13186
source=("https://sources.archlinux.org/other/packages/${pkgname}/${pkgname}-${pkgver}.tar.xz"
         nettle-4.patch)
sha256sums=('ab8888adc6a0c935740837078977eeb671651723031df260687c45180e20165a'
            '03483bf3adddb6ee45328bd2618b19d71af6d3c4fad943f1e539819eb44709f9')
sha512sums=('1ec5d278740989da05e2a23fecb48f77f63e892f1372f98f2d214683e80b5fb0417ce76d5761516fc3885626c61c93c1146af6bc040758c7bdf1c4bdee34d30d'
            'dad01f1c84beb8c8a3e9cb8a9fd30d67ec08f32c3255e7e6f4c3734767e247b9325b13f19b49b74c03c0959a2f15476582228d7036673eea347f1ce2d5cb605c')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../nettle-4.patch
}

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
