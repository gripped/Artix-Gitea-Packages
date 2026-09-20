# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Cory Sanin <corysanin@artixlinux.org>

pkgname=artixlinux-appstream-data
pkgver=20260920
pkgrel=1
pkgdesc='Artix Linux application database for AppStream-based software centers'
arch=(any)
url='https://www.artixlinux.org'
license=(GPL)
depends=()
makedepends=()
source=()
noextract=()
_repos='system world galaxy lib32'
for _repo in $_repos; do
 source+=($_repo-$pkgver.xml.gz::https://gitea.artixlinux.org/corysanin/appstream-data-pkgbuild/releases/download/v$pkgver/$_repo-Components-x86_64.xml.gz
          $_repo-icons-48x48-$pkgver.tar.gz::https://gitea.artixlinux.org/corysanin/appstream-data-pkgbuild/releases/download/v$pkgver/$_repo-icons-48x48.tar.gz
          $_repo-icons-64x64-$pkgver.tar.gz::https://gitea.artixlinux.org/corysanin/appstream-data-pkgbuild/releases/download/v$pkgver/$_repo-icons-64x64.tar.gz
          $_repo-icons-128x128-$pkgver.tar.gz::https://gitea.artixlinux.org/corysanin/appstream-data-pkgbuild/releases/download/v$pkgver/$_repo-icons-128x128.tar.gz)
 noextract+=($_repo.xml.gz-$pkgver $_repo-icons-{48x48,64x64,128x128}-$pkgver.tar.gz)
done
sha256sums=('66b4c6b1f230be2a0d83ad1af5ba90bdb024528e85b67b717a747b6751743e73'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '5e6686c0a1a22c2a7547afbdc1485b59523206c9d236fa3ddd5d6e5a1351bc87'
            '6c5af0da86b5f8b601ad8b3892f20d6994e148fbade1c4bd3f034ec1d2f3fe60'
            '1cf2baa3947f85e1f5ac7856d7834407c86c5b2205cb7c9021dfbd1aa78b91ac'
            '41885df8f9ca914a3f19e8c4abb100963d7d1bab3cdcfd17543012cf1169fe52'
            '687329ddd4441577599c4fe4d2c9fef9f11136a567b357760d8d503979a01abd'
            '750d6bf9dbabd3d7d03e2a9cce2dd6b468607e1b9d0816e6510863f19b50a9b4'
            'e500b6cd5e8e9c0fc9826d340d65ae72c171af60678601029b979164b8fd5088'
            '127acc7e5c27ff7117cea4a97f51dd3647958b96950c93e556031c788bc73adc'
            '9c2c5b19b3ab504ec0351fbfb3790fdd91c1b94cee0137c05c5fc059d63ffe18'
            'd269eb8c93ec52b117083a5a0493eb27ff58d4ffe2a3cbbe6f473762b1a9eada'
            '7e6c9c491ad15d99e72c7a7250e6a80952d39dc7648758ca3a759a50ea1cf872'
            '7abb223b00878f03126b7634e5bd9ba591180c4b7ca2eaaf5de977558be1f3b8')

package() {
  for _repo in $_repos; do
    mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/artixlinux-artix-"$_repo"/{48x48,64x64,128x128},xml}
    tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/48x48
    tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/64x64
    tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/128x128
    install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
  done
}
