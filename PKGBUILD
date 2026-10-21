# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Cory Sanin <corysanin@artixlinux.org>

pkgname=artixlinux-appstream-data
pkgver=20261020
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
sha256sums=('f8cf6e6aebebba23e7e8e9009cebcde26dc302b2f020ba61f3b91aaf342663e2'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '1642e3a010e2773970ae2665284d5dac44c7c04983024396bb7fe6d35f1ebee4'
            'bc5579f164bf1520464e342da08a477b7c639045e7becbc0ba4faeee9f3b8bc6'
            '07fff55a3f37e1d6c23a3db39827ab590cbadb8174e394e8945506f67bbe4c55'
            'd70ca54b099ba7d7fb85a2ccfc1d4abb8b19404fd4b5846062add129f024751c'
            '41544d22b2e88dddc80ed3e437efad96577af7813ad6466c09efdb206849fdec'
            '3e1e54bd5de9ea74b3eabb742bc10d463e9c2fabf7c0ec2ebb5fa42b115ac675'
            '191c0534361b942fb7c4ab5ba480a6021db789be0a25b865357a48609759af11'
            '521c0951dc7e24f727cfd49236fbd3f07b351f17de326e547904357899212743'
            '6afe3f9319df54bab523230647ec085218f5fafa75ff5db5f8ef963b648d8524'
            '817cf610ba9a64e5f62589536374b82829a89fcc4b18ed181c9b126b3fd2e119'
            '61e65c5ac6b62a182fbd0329f6387238915fedf6864f6312dbe5459fd02a6c34'
            'cb954d6a3990beb03375479b497713eb744db95f980f60925470874d02cb9e91')

package() {
  for _repo in $_repos; do
    mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/artixlinux-artix-"$_repo"/{48x48,64x64,128x128},xml}
    tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/48x48
    tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/64x64
    tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/128x128
    install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
  done
}
