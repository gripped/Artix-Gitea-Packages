# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Cory Sanin <corysanin@artixlinux.org>

pkgname=artixlinux-appstream-data
pkgver=20260620
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
sha256sums=('a22ffaa203110bec739c048955596446e7dd0cf714cf80238c72aee581b1995d'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'a6ae3aace57331f6d164936340b04b68a49726206cd0d984bbc6423db13e05a4'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '14925c5542cda2fca51054d6e9654f1d084a72ec4021eb454d4f846dcc32e805'
            '91ad591097ab9021814b0ed3d50d3f4486c2e82048586fa59a6dadf331afdfd3'
            '541f448533ab547c5dc1ce5057664056e886acc986e1c46dc0bc8f06a4bb3491'
            'b127237a2cf54be7337b1bc7c5ff920a01713da1d4c3df39969a2da40401f7b4'
            'c2d6337f0376fa61634061ac44a199e9c5128e2b851d6ba6140d2121562733b9'
            'd98b3b582234cfd18b0465913bb6c5707499b643f06c029b3035403826912543'
            '709687c6e0815b8ba8d72634cfaa0e41d0779769bca1350fae6a0a55dc875477'
            'f8c788143dd16f9439ac4ebe04dae12917bd9cd1613a78b83d5ec0f491cdddbe'
            '89b04e4be9876cfa1a8deddd8131d2da549da93dbe4605663760561f581c815c'
            'f6c10e5b16a247493ffe51738a11c5dd3b5ea7349a19f4891fdc414fc4007eef'
            '446a9b773a6c34d8690f9f80add545931aabdec39145d6924cb7555353f6c71e'
            'f557f803588be61e0cbf2f26aa40ada2ec956d621b77c858936a9fdeb4ed7841')

package() {
  for _repo in $_repos; do
    mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/artixlinux-artix-"$_repo"/{48x48,64x64,128x128},xml}
    tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/48x48
    tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/64x64
    tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/128x128
    install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
  done
}
