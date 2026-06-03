# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Cory Sanin <corysanin@artixlinux.org>

pkgname=artixlinux-appstream-data
pkgver=20260531
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
sha256sums=('6055a1c621a071522a004b358833542dff88534cdde2bac5465c2c927c867e68'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '9ebaf480f7500f4443d495e2e50e585675e57771eba948a1ceed144d19249cc2'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'f6691c12a5195ef0957516fbe2b0025092789ca9c74b4f37a2aecfc350c00618'
            '8f498ed26023bc31fbfbdc8dbacf801f891babda3b38dc1e837d0d873cac188e'
            'c9962129ea119059c5cd66b41d2b2fa616d05cb7e690d24639ed254ebac2b0bf'
            'f791395b41c36e394e75a79b4b720e4d74b88fc3da99689d03c51b5c67dd7f60'
            '18a987f59775be545581dae350ea4d7a11fd5136fe08a73f5f45a320c4ba14e7'
            '72b07598d606cc191898a716b6785836c4b135b9846ad186cf301186af0b84af'
            '11558ca443e989c2263d335b3188fdfde3f2fcebbe5ca4a2ff746761c9154d85'
            'b71797763344e3ad131cca7d07935b1052701bdd707673dc2ed74f4bab12580e'
            '886bba7b86e16c7f6f4b1f2ef124f0888340b089979a0ef2e32a299ccfdb9279'
            'acca3ea976fd1f69914d1bc2139cfcaf4a1ba9ed093bc52008b20ea8eb31a3d7'
            '9648888f87ded1210ae31f07956747a89774c0c67324793d4cec0ddb50104bf6'
            '947b8130bb95ff829fdb9109edd371335f806961627f1976f2a26587b46cc146')

package() {
  for _repo in $_repos; do
    mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/artixlinux-artix-"$_repo"/{48x48,64x64,128x128},xml}
    tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/48x48
    tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/64x64
    tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/128x128
    install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
  done
}
