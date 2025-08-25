# Maintainer: artist for Artix Linux

# we really need our own apptrem tars
# this is a temporary and messy solution
_pkgname=archlinux-appstream-data

pkgname=artixlinux-appstream-data
pkgver=20250825
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
sha256sums=('aa8a8cafe0a719886d43a86179ad4f48b5f5c69ed9bd3a7fdb6e16709cacaba5'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'effeb272d34fadcf64089d54e3a5aa910def4cb9f3d76722c6cd9a1bc25fe914'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'ad02feba82734f10ee136203173b51a25e026af4cee66e0458b6d989a110526a'
            'ee86ba9cafc988815fd67949f648a8f031f22f6e2a52677b5357ccef604c9205'
            '3f9e825dc9f10f4d01b8e4a709d1c54c9c5f804a39321c82da84f2ff9033808d'
            'c51af203f3e2b843b91bfeabe436c764dfdd3e028deecfe6387320161981920c'
            '3db7854df15ee9f6d2ea5e37b4e36298f3016d51e52e5aa1fbd3aa9e29c071b5'
            'da8fbf96266d8b662f44b7e8711cfee5fc1330bfeee7b9dba25f03cc9c4e773f'
            'eff4cd46db55087386121242c94634ca66e172f17057c91ec2276d03632e0c27'
            '048d1b9c252dcdc549dc4326eac99f1e110b6f65088c79c72c648fc357d6b665'
            'ad02feba82734f10ee136203173b51a25e026af4cee66e0458b6d989a110526a'
            'ee86ba9cafc988815fd67949f648a8f031f22f6e2a52677b5357ccef604c9205'
            '3f9e825dc9f10f4d01b8e4a709d1c54c9c5f804a39321c82da84f2ff9033808d'
            'c51af203f3e2b843b91bfeabe436c764dfdd3e028deecfe6387320161981920c')

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
