# Maintainer: artist for Artix Linux

pkgname=moksha-arandr
conflicts=(arandr moksha-arandr-git)
pkgver=0.1.11
pkgrel=3
pkgdesc="Visual front end for XRandR 1.2"
arch=('any')
url="https://christian.amsuess.com/tools/arandr/"
license=('GPL3')
depends=('gtk3' 'python-cairo' 'python-gobject' 'xorg-xrandr' 'libffi')
makedepends=('git' 'python-docutils' 'python-distutils-extra')
source=($pkgname::git+https://gitlab.com/arandr/arandr.git
        dont-compress-man-pages.patch
        gui.patch
        meta.patch
        widget.patch
        arandr.desktop)
sha256sums=('SKIP'
            'eb954b763bd2dd7f98ff04a4d45e59db9f8a16cc7384b47ffed733781057ab37'
            'ed9e7429134fdbf4769539a61d6690b35d7a4472f0c04ca01945b741bacb1c31'
            '05fadd4e6657d780c872f5f1c8badf7c9a64aae2d96350fcef12ff0781fc7a55'
            '1a5a694c1f756944209d95d961fd36d993469d47b46717a5294eb71a6738862c'
            'af30f629b463324c3fa97c18d2da4b1e268ed66fbb7256223d6dad22bb01cb26')

prepare() {
  cd "$srcdir"/$pkgname
  patch -Np1 -i ${srcdir}/dont-compress-man-pages.patch

  cp ${srcdir}/arandr.desktop data/
  patch -Np1 -i ${srcdir}/gui.patch
  patch -Np1 -i ${srcdir}/meta.patch
  patch -Np1 -i ${srcdir}/widget.patch
}

package() {
  cd "$srcdir"/$pkgname
  python setup.py install --prefix=/usr --root="$pkgdir"
}
