# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: ML <neldoreth>

pkgname=zathura
pkgver=0.5.10
pkgrel=1
pkgdesc="Minimalistic document viewer"
url="https://pwmt.org/projects/zathura/"
arch=('x86_64')
license=('Zlib')
makedepends=('python-sphinx' 'texlive-bin' 'meson' 'ninja' 'appstream-glib' 'check')
checkdepends=('xorg-server-xvfb')
depends=('girara' 'sqlite' 'desktop-file-utils' 'file' 'libsynctex' 'file' 'libseccomp')
optdepends=('zathura-djvu: DjVu support'
            'zathura-pdf-poppler: PDF support using Poppler'
            'zathura-pdf-mupdf: PDF support using MuPDF'
            'zathura-ps: PostScript support'
            'zathura-cb: Comic book support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pwmt/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('78eeec3c4575d2a14282d71ad91b6adc355d28e38d8c28b0a60438e4c732b298f41a987049d0665d75c33de1400a3c77f6f6f9cccdf79cf0c2720f73d7096f53')

build() {
        cd "${pkgname}-${pkgver}"
        artix-meson build
        ninja -C build
}

check() {
        cd "${pkgname}-${pkgver}"
        ninja -C build test
}

package() {
        cd "${pkgname}-${pkgver}"
        DESTDIR="${pkgdir}" ninja -C build install
        install -Dm 664 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
