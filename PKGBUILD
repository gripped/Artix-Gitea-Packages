# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Cory Sanin <corysanin@artixlinux.org>

pkgname=artixlinux-appstream-data
pkgver=20260820
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
sha256sums=('ade1207da69c327c5bf78f3ca8d80a892ee25e4a15ca374bfac6e1cbb441e815'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'ea21d1cf845fc255fd9103f734f865c3bcdb9fba6e1ac62cf68ef8597816f84b'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'ee879057379f6c3736b891ffffb7fc9cc43d2e0a9d7332e273bef7bf64623e04'
            'e661f10a2c739e34a4118edd05aff11ccebf350d1245f82192265ed4cad8e197'
            '322d162fc923bb917aaa28ee43f82a58cd2795d5c80654ea3d4bf1e6c07fdb5c'
            '16789c400eb15bd681140ea9c8b60bd0ddc5ded368a030f88352d7595fd86fcd'
            '3c5769f862f4e98da7bdb688e39265b07fbc885de57e766171c0c677ce36bd81'
            '0d6f45c5ebbd8ae2690bfde5099af1092d3f556948450d03db788f91f43ab714'
            'cf1aa484ca3ee2bafe2d8e036b16613c34133402eefba1170a049e606c61ec0a'
            '04a207bba47ce1b0a9cb9654832def8a6821d8ae2a10fef26c598778d6238bf1'
            '02cb2f70342ae5673e7c6c9c09fbe6c71376ccaa9f329f289752752b8f4cb4f4'
            '89847b87e18e303c151bffaa7a933a12eb09c8d4b705a73385086da6fbadd335'
            '31c35a9f1d80329088f1aaf1d461f20e22d7bc2b743212b2c58eff349e60a566'
            '2e5ceff6be45da4ce44e4e7b92030fd2dd5c9d6ecffceb2be809b34fab15e784')

package() {
  for _repo in $_repos; do
    mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/artixlinux-artix-"$_repo"/{48x48,64x64,128x128},xml}
    tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/48x48
    tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/64x64
    tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/128x128
    install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
  done
}
