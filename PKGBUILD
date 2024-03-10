# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=mkinitcpio
pkgver=38
pkgrel=4
pkgdesc="Modular initramfs image creation utility"
arch=('any')
url='https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio'
license=('GPL-1.0-only')
depends=('awk' 'mkinitcpio-busybox>=1.19.4-2' 'kmod' 'util-linux>=2.23' 'libarchive' 'coreutils'
         'bash' 'binutils' 'diffutils' 'findutils' 'grep' 'filesystem>=2011.10-1' 'zstd' 'udev')
checkdepends=('bats' 'bats-assert' 'lzop')
conflicts=(
  'udev<255.4-2'
  'cryptsetup<2.7.0-3'
  'mdadm<4.3-2'
  'lvm2<2.03.23-3'
)
optdepends=('gzip: Use gzip compression for the initramfs image'
            'xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'lz4: Use lz4 compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS')
provides=('initramfs')
backup=('etc/mkinitcpio.conf')
source=("https://sources.archlinux.org/other/$pkgname/$pkgname-$pkgver.tar.gz"{,.sig}
        nosystemd.patch)
install=mkinitcpio.install
sha512sums=('ad1a4895e5cc3a01637f71d96ddb79d7f45708ec7305ffdb874403a1eb3c1743d121f28d93273b91792298eb21bcc0c5d9ef1ab3a3773083d60da5bdaee59d6e'
            'SKIP'
            'ac8da9f6c54ac020ad46aaf0009a769c71c01ba1285e2e0d021cbe1e6b2bca3fb7a1e85b0f141981abfdd1d23fb686d48f952ca949c81e39ac140b0b57e946b5')
b2sums=('4bc50da7196a69dc0ab7e7de345684baebbb655f9a07def9ac36a7f1c9aec752cf41c62134d6bbf240d8f49c6492a211f152bab062ec09457791d7ab030f1bc5'
        'SKIP'
        'ffa3c50f18af50323302b2804cde4eb1233b662004528ed3a98c050736c6ed2624fd38a37575737390dfee5f3928daaafb189ce67133909ddfffbea649f0cb39')
validpgpkeys=('ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB'    # Giancarlo Razzolini
              'C100346676634E80C940FB9E9C02FF419FECBE16')   # Morten Linderud

prepare() {
  patch -d "$pkgname-$pkgver" -Np1 -i ../nosystemd.patch
}

check() {
  make -C "$pkgname-$pkgver" check
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
