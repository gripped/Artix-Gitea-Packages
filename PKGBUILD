# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Cory Sanin <corysanin@artixlinux.org>

pkgname=artixlinux-appstream-data
pkgver=20261120
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
sha256sums=('94f8b98d7ab1e9d641a704d090406ee711497ad8ee3e7a49ebce1b9ed6656cf1'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '94c61deb0da9657ff45879b42ce33cadfe10fc7b8ad3c5eff244e85fa9bd8840'
            '3c165f0854cf55d1736a9013c4644df7cfb398079388a0d519e35d3e9955cbfb'
            '637dc67cc9da28394cfef4f5d71149a74728678738fd858d329246b80bd19b1f'
            '5039edf34aa5527fcf07722d45115f913dc01840d89ac330624e1e9089376108'
            '9638672f6f1eefcde1b34fc8fbef18322e10a6d55d8e9f15617479af355320ec'
            '6278649d5201a7cc8ecf737f77d8524333b3ce46acb33df5400eb8670d74256e'
            '424bedd1ee16e0dbb51ef38b2906c6f21f98d919349f32b08588732e1f1ad211'
            '78fa88ac9500701d9fea9a2296472011e34fb7e2616687c71f51ceabcb5deeea'
            '7ae272bb1c9b3f62f0d79ef107b8e4ce50d8d78c90b47cb6b944bbcd9ad6a1ec'
            'a94d979a207ebecabd706d6da83049a8c782933e9d178a03b83ee4440dabb056'
            'dcc2259b9d63746fdba9553e9c1560981f6a1a88e260eae11ad410b8a06e6494'
            'b57e75d1c7a837d53400cc8f3a5a0b84d335842047aec242748f5467f078b2ac')

package() {
  for _repo in $_repos; do
    mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/artixlinux-artix-"$_repo"/{48x48,64x64,128x128},xml}
    tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/48x48
    tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/64x64
    tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/128x128
    install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
  done
}
