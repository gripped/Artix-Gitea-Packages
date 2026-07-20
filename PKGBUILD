# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Cory Sanin <corysanin@artixlinux.org>

pkgname=artixlinux-appstream-data
pkgver=20260720
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
sha256sums=('adeaad0818f111eb15fe46bdaad86d75c44271de3f5346989f44457ababfd019'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'b13ce4a46dd6278a044fec0a36842293459a411a4ed22b3b55897668b22deee8'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '1586891b6fc23a191b460d81e9be89ea892feb96ec03a5e8cddd5117ac3a2024'
            '56441d347b4f983777c8bb453653b43c8215429e7cb37b993f9a42eb1efc1b46'
            'f94a5f92a75674b2fd1aa1f1e83fadda4a98ed225d207f49ca92f5e7b30903b6'
            'fa94b87497ea94c4e72705c6c266507ad10f971e88ca50f8c908810ee30e0929'
            'faf8da888c344a4ca3025bcf38a737d49eacb89b9e09871ea19c87e6eb9cba2f'
            '3a62e164cf37d319ed87ddfd733365dd99ccb16c58dec4c0e9197aa63694bd40'
            'e9b218f979157566a502d51f15fdff84fa08da623593a9a85ecb8d6ae9014b7c'
            'fc5e44fa0b66799bdedea019b5bac22d47968b9aa16d856571562da787dbda21'
            'f4c832f8b8e4cc58db3fbc9402f0704ce88696d76703344b6de16b7430e7570e'
            '55075a119060b1f5b447fbd6bc51fa68d49c88836bf2d53ae727c16e649c2162'
            'fad5fb3380f107adf08da79f291423944e34d3f65414774fd5b4faf318cc2954'
            '84f8378db744b4f9797f94315e707b2dc1b3333578a74e2beca51e15161c6dc4')

package() {
  for _repo in $_repos; do
    mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/artixlinux-artix-"$_repo"/{48x48,64x64,128x128},xml}
    tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/48x48
    tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/64x64
    tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/128x128
    install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
  done
}
