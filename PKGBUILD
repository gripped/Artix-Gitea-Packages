# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.4.5
pkgrel=1
pkgdesc="PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('Zlib')
conflicts=('zathura-pdf-poppler')
depends=('cairo' 'gumbo-parser' 'jbig2dec' 'libjpeg-turbo' 'libmupdf' 'openjpeg2' 'openssl' 'zathura')
makedepends=('meson' 'ninja' 'git' 'appstream' 'appstream-glib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pwmt/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        0001-Remove-mupdf-linking-detection.patch)
sha512sums=('75b4c79b649d71efa0f53ec96183860e0ccdb36a671be6df72a7519c5de3946eafcd42fa137c8c7c74d4b6209ce017b43b84e48dc28f29a732b4dfcd371b026f'
            '5402a6ae9f4b177a9f96483f59b5c50042eb9de3267675725ea2aa0beedfc677f267847e6b0274a7043c0d281136ec72282a2d40f87b408db935d7411eef7cac')

prepare() {
        cd "${pkgname}-${pkgver}"
        patch -p1 < "${srcdir}/0001-Remove-mupdf-linking-detection.patch"
}

build() {
        cd "${pkgname}-${pkgver}"
        artix-meson build
        ninja -C build
}

package() {
        cd "${pkgname}-${pkgver}"
        DESTDIR="${pkgdir}" ninja -C build install
        install -Dm 664 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
