# Maintainer: Cory Sanin <corysanin@artixlinux.org>

pkgname=artixlinux-appstream-data
pkgver=20260530
pkgrel=1
pkgdesc='Artix Linux application database for AppStream-based software centers'
arch=(any)
url='https://www.artixlinux.org'
license=(GPL)
depends=()
makedepends=()
conflicts=('archlinux-appstream-data')
source=()
noextract=()
for _repo in system world galaxy lib32; do
 source+=($_repo-$pkgver.xml.gz::https://gitea.artixlinux.org/corysanin/appstream-data-pkgbuild/releases/download/v$pkgver/$_repo-Components-x86_64.xml.gz
          $_repo-icons-48x48-$pkgver.tar.gz::https://gitea.artixlinux.org/corysanin/appstream-data-pkgbuild/releases/download/v$pkgver/$_repo-icons-48x48.tar.gz
          $_repo-icons-64x64-$pkgver.tar.gz::https://gitea.artixlinux.org/corysanin/appstream-data-pkgbuild/releases/download/v$pkgver/$_repo-icons-64x64.tar.gz
          $_repo-icons-128x128-$pkgver.tar.gz::https://gitea.artixlinux.org/corysanin/appstream-data-pkgbuild/releases/download/v$pkgver/$_repo-icons-128x128.tar.gz)
 noextract+=($_repo.xml.gz-$pkgver $_repo-icons-{48x48,64x64,128x128}-$pkgver.tar.gz)
done
sha256sums=('5a1116f55575248fa1d42dda4bd1a446125e9e7c56a9c2e2a05db1164c324a4c'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'e29850aba2e788ebc9ca343bda0761fb7e2ee7c5887f099149f703b9ca3addf1'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '3c6b70d2d7d97f0a1223efff6b459c80e32815b0447ca9f7976b681c3bfaf62e'
            'edc91b7ee6da856bd29bdb9bc4bfbebb68429a8e826e507c597fdd5f558830a5'
            'b0ebf0c995bc6acbc03d8cde2c7227655102e9d77778c86482bb315fb1749def'
            'dea6870b95ba5252b5312dfbdaf322ba900cad01afbfa90d9b0b0069e02d3616'
            '1e119223d844d9c39014488153263f7fa2a774cae22848a6330733ce98ca67f9'
            'e4c54c4878ba7de5cebef2f1e7712b3b9be5c3628f28ce5fdbe86a0a6f6549c5'
            '73995e13566562f4f51f98c27175bc367c20dd440d6900588bcf4825a67553e8'
            '12cdeca76013850cb234c269e0a427d47f1c324699b5b7622e21bf99372a461c'
            'd76b85ba17c9a462f5ebf481190953c459e7eb3815d8ddf90bbac2c2bad039aa'
            '78f8343e8b7f718c48e85525bd629ef1b484c1708058db859b3ad6a4bc0d8b50'
            'd5bd323d15e96646fab3b7e8fc5201ada0f689bed8946464b900e127489db085'
            '0a0e4e37ec4e3333fc9531e333ccae70626455a072c691044aabb242654c833e')

package() {
  mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/artixlinux-arch-{system,world,galaxy,lib32}/{48x48,64x64,128x128},xml}
  for _repo in system world galaxy lib32; do
   tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-arch-$_repo/48x48
   tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-arch-$_repo/64x64
   tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-arch-$_repo/128x128
   install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
  done
}

