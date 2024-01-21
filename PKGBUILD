# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=mkinitcpio
pkgver=37.3
pkgrel=1
pkgdesc="Modular initramfs image creation utility"
arch=('any')
url='https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio'
license=('GPL')
depends=('awk' 'mkinitcpio-busybox>=1.19.4-2' 'kmod' 'util-linux>=2.23' 'libarchive' 'coreutils'
         'bash' 'binutils' 'diffutils' 'findutils' 'grep' 'filesystem>=2011.10-1' 'zstd' 'udev')
checkdepends=('bats' 'bats-assert' 'lzop')
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
sha512sums=('edee8dfbc452a0fc6ca9e8c7321beffa4463e504641b99a8d08ab9df665b697a0192f7760994b9917f34ba83d15543dedd3c4690364663b4534724a06a262db7'
            'SKIP'
            'f1ad7792b3b42397c2645e834d4b6c6a89122060455954d1ab56a71c673c3b8a8fdbbd6d722d30195211672b9075d09ac07ce6fb5d9723f56ce540709ebe4665')
b2sums=('f903348aa23983b4de1e095420acc358a09a6fd0c8ed9a9a7b9bd7df0bfde0bb17869996759f8f3c73ada85dd3ee3f83958401e1f9fa15aaacc06b048fe13660'
        'SKIP'
        '92e1969572e0022bd257f44314045f57db47821d99a40ea1290749967b50ead1cb11adaa9b79f4286fbf20a94173e0ba7f2d4f88208e31d7a03a8de4ea014396')
validpgpkeys=('ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB'    # Giancarlo Razzolini
              'C100346676634E80C940FB9E9C02FF419FECBE16')   # Morten Linderud

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i ../nosystemd.patch
}

check() {
  make -C "$pkgname-$pkgver" check
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
  rm -f "${pkgdir}"/usr/lib/initcpio/install/sd-*
}
