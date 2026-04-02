# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Martin Rys <https://rys.rs/contact>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=miniaudio
pkgver=0.11.25
pkgrel=2
pkgdesc='Single file audio playback and capture library'
arch=('any')
url='https://github.com/mackron/miniaudio'
license=('MIT')
makedepends=('cmake')
conflicts=('mini_al')
provides=('mini_al')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mackron/miniaudio/archive/${pkgver}.tar.gz")
sha256sums=('b900edcffe979816e2560a0580b9b1216d674b4f17fbadeca8f777a7f8ab0274')

build() {
	cd "${pkgname}-${pkgver}"
	cmake .
}

package() {
	cd "${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}/usr/include/miniaudio/"
	install -m644 miniaudio.h "${pkgdir}/usr/include/miniaudio/miniaudio.h"
	install -dm755 "${pkgdir}/usr/include/miniaudio/extras/"
	install -m644 extras/*.h "${pkgdir}/usr/include/miniaudio/extras/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/miniaudio/LICENSE"
	install -Dm644 miniaudio.pc "${pkgdir}/usr/lib/pkgconfig/miniaudio.pc"
}
