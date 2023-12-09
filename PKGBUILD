# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: ML <neldoreth>

pkgname=zathura
pkgver=0.5.3
pkgrel=1

pkgdesc="Minimalistic document viewer"
url="https://pwmt.org/projects/zathura/"
arch=('x86_64')
license=('custom')

makedepends=('python-sphinx' 'texlive-bin' 'meson' 'ninja' 'appstream-glib' 'check')
checkdepends=('xorg-server-xvfb')
depends=('girara' 'sqlite' 'desktop-file-utils' 'file' 'libsynctex' 'file' 'libseccomp')
optdepends=('zathura-djvu: DjVu support'
            'zathura-pdf-poppler: PDF support using Poppler'
            'zathura-pdf-mupdf: PDF support using MuPDF'
            'zathura-ps: PostScript support'
            'zathura-cb: Comic book support')

source=(zathura-$pkgver.tar.gz::https://pwmt.org/projects/zathura/download/zathura-$pkgver.tar.xz
        fix-xvfb-run-tests.patch)

sha256sums=('54cc78fd68664cd66bbc7b7f72a78c677d381a9e3e3f6923f3d02ef5809943de'
            '15bf4be1a6c1dc539e2f034fa30d509d19b016ec130aaa4cbe506bf61bc343fe')

prepare() {
  # Patch to prevent xvfb-run tests to fail when trying to kill the process during check()
  # See https://stackoverflow.com/questions/30504274/xvfb-run-line-171-kill-25939-no-such-process#comment64585805_35319908
  cd zathura-$pkgver
  patch -Np1 <${srcdir}/fix-xvfb-run-tests.patch
}

build() {
  cd zathura-$pkgver
  artix-meson build

  cd build
  ninja
}

check() {
  cd zathura-$pkgver/build

  ninja test
}

package() {
  cd zathura-$pkgver/build
  DESTDIR="$pkgdir" ninja install

  install -D -m664 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
