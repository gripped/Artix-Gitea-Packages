# Maintainer: artist for Artix Linux

pkgname=moksha-arandr
conflicts=(arandr moksha-arandr-git)
pkgver=0.1.11
pkgrel=3.2
pkgdesc="Visual front end for XRandR 1.2"
arch=('any')
url="https://christian.amsuess.com/tools/arandr/"
_url="https://raw.githubusercontent.com/BodhiDev/bodhi8packages/refs/heads/main/misc/arandr"
license=('GPL3')
depends=('gtk3' 'python-cairo' 'python-gobject' 'xorg-xrandr' 'libffi')
makedepends=('git' 'python-docutils' 'python-distutils-extra')
source=($pkgname::git+https://gitlab.com/arandr/arandr.git
        $_url/usr/lib/python3/dist-packages/screenlayout/{auxiliary,demo,gui,i18n,meta,snap,widget,xrandr}.py
        dont-compress-man-pages.patch
        gui.patch
        meta.patch
        widget.patch
        arandr.desktop)
sha256sums=('SKIP'
            '9e5d0d892bb8d8b68a9da37ee71cade14c7bb3186efd71746fde79fb664f25f2'
            'c15c064c062abe2ac8c25210213f12d2328802b05179cc779734f60f7a7a341f'
            'f23c80fb7f5e1ea12f1670f0b98cf7a4874776d87bbf4e614edda7d162a3b59c'
            '6b0bb2c77137f87c134b8c2d015f1d886b1f75ea061ed8e8526dc7e9693fce25'
            '6383d7e3d7947ce421a6d8d296cd12ee0f226369c27c400d264777f1f6769790'
            '96817527955e7883497daab0ceb4870ef62fdc715c05b55e13c93be01877ca95'
            'ef99c57dbad288548659a7d6e706eb009e9c564c00ba85cba07f226996faf49d'
            '3d001c3fb5f3aa376a53e0353896ef9513da3220f2cedd6e08ba498d446178a7'
            'eb954b763bd2dd7f98ff04a4d45e59db9f8a16cc7384b47ffed733781057ab37'
            'be8c889163074c2c0e4ef1f415f7bbd0612719dc60201c5c5f52809f4a52b7ce'
            'a7d59fca20a86e148d6f5b7a3b10aca3bdb1b9333a062195cdfc6ad9ae526422'
            '5c15030e5c0f511a99d9ce993a5dfd61e737d90e1c860f7b6e547d514a286152'
            'af30f629b463324c3fa97c18d2da4b1e268ed66fbb7256223d6dad22bb01cb26')

prepare() {
  cd "$srcdir"/$pkgname
  patch -Np1 -i ${srcdir}/dont-compress-man-pages.patch

  cp ${srcdir}/arandr.desktop data/
  cp ${srcdir}/*.py screenlayout/
  patch -Np1 -i ${srcdir}/gui.patch
  patch -Np1 -i ${srcdir}/meta.patch
  patch -Np1 -i ${srcdir}/widget.patch
}

package() {
  cd "$srcdir"/$pkgname
  python setup.py install --prefix=/usr --root="$pkgdir"
}

