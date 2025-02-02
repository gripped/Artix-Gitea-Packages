# Maintainer: artist for Artix Linux

# we really need our own apptrem tars
# this is a temporary and messy solution
_pkgname=archlinux-appstream-data

pkgname=artixlinux-appstream-data
pkgver=20250202
pkgrel=1
pkgdesc='Artix Linux application database for AppStream-based software centers'
arch=(any)
url='https://www.artixlinux.org'
license=(GPL)
depends=()
makedepends=()
source=()
noextract=()
for _repo in core extra multilib; do
    case $_repo in
            core) _tar=system ;;
            extra) _tar=world ;;
            multilib) _tar=lib32 ;;
    esac
    source+=($_tar-$pkgver.xml.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/$_repo/Components-x86_64.xml.gz
            $_tar-icons-48x48-$pkgver.tar.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/$_repo/icons-48x48.tar.gz
            $_tar-icons-64x64-$pkgver.tar.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/$_repo/icons-64x64.tar.gz
            $_tar-icons-128x128-$pkgver.tar.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/$_repo/icons-128x128.tar.gz)
#     noextract+=($_tar.xml.gz-$pkgver $_tar-icons-{48x48,64x64,128x128}-$pkgver.tar.gz)
    noextract+=($_tar-icons-{48x48,64x64,128x128}-$pkgver.tar.gz)
done
source+=(galaxy-$pkgver.xml.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/extra/Components-x86_64.xml.gz
            galaxy-icons-48x48-$pkgver.tar.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/extra/icons-48x48.tar.gz
            galaxy-icons-64x64-$pkgver.tar.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/extra/icons-64x64.tar.gz
            galaxy-icons-128x128-$pkgver.tar.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/extra/icons-128x128.tar.gz)
# noextract+=(galaxy.xml.gz-$pkgver galaxy-icons-{48x48,64x64,128x128}-$pkgver.tar.gz)
noextract+=(galaxy-icons-{48x48,64x64,128x128}-$pkgver.tar.gz)
sha256sums=('536f61750c62a05ea9b5714c03183f121a5d95e5b05e2c89463031061137e7e1'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'df6236ceed933a247c639621345c1f325ba5d76197a6d4f1c2174a714f6ad9bb'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'e530eca2718a74c6436b06130a13b3cc394142c4c9bfaae55313a23bdbd2051e'
            'a9b9073ad9ee20257d2bff50c6ecdfd42fe14cc866ca00013a4a208d5a13bcba'
            'a8d6a43fe1b886152c6b6c9613ca8997632ee15341e8acfecd276f2392cc2185'
            '5becd14ba6bd6c7bf0a7d93094181ce2febaa5303f1e5aed1a0382c9753a4a67'
            'd39e7a4176bbcbc8be096031eaa436e88c23a74fe27c734ac73093ddfe167f1f'
            'b5e96af95d7bc2f208ffd73ba7862075443bdd60f0aca44457b1c97077f722ee'
            'cb2318f13fdfff2dca063cf27075e7e2087a785bcdad7b8b93def4b9660f479f'
            'b12e2bf47cd2f4ca4ba56ea3c56fbccf35c00fb0a89c014362a295a690d36881'
            'e530eca2718a74c6436b06130a13b3cc394142c4c9bfaae55313a23bdbd2051e'
            'a9b9073ad9ee20257d2bff50c6ecdfd42fe14cc866ca00013a4a208d5a13bcba'
            'a8d6a43fe1b886152c6b6c9613ca8997632ee15341e8acfecd276f2392cc2185'
            '5becd14ba6bd6c7bf0a7d93094181ce2febaa5303f1e5aed1a0382c9753a4a67')

prepare() {
    local _a
    for _repo in system world galaxy lib32; do
        case $_repo in
            system) _a=core ;;
            world) _a=extra ;;
            galaxy) _a=extra ;;
            lib32) _a=multilib ;;
        esac
        sed -e "s/archlinux-arch-$_a/artixlinux-artix-$_repo/" -i $_repo-$pkgver.xml
        tar -zcvf "$_repo-$pkgver.xml.gz" "$_repo-$pkgver.xml"
    done
}

package() {
    local _artix
    mkdir -p "$pkgdir"/usr/share/swcatalog/{icons/artixlinux-artix-{system,world,galaxy,lib32}/{48x48,64x64,128x128},xml}
    for _repo in system world galaxy lib32; do
        tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/48x48
        tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/64x64
        tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/swcatalog/icons/artixlinux-artix-$_repo/128x128
        install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/swcatalog/xml/$_repo.xml.gz
    done
}
