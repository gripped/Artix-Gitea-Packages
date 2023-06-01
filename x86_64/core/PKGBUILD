# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=mkinitcpio
pkgver=36
pkgrel=1
pkgdesc="Modular initramfs image creation utility"
arch=('any')
url='https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio'
license=('GPL')
depends=('awk' 'mkinitcpio-busybox>=1.19.4-2' 'kmod' 'util-linux>=2.23' 'libarchive' 'coreutils'
         'bash' 'binutils' 'diffutils' 'findutils' 'grep' 'filesystem>=2011.10-1' 'zstd' 'udev')
checkdepends=('bash-bats' 'bash-bats-assert' 'lzop')
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
sha512sums=('f13cfdfee62dc1a344b75413fde8f35eb594c4c372d4a2ed8bbc22f2c01d93ea59d423807d06d19a6d1789e47b35286845daffeffef0fec4bae022e0e92b7b64'
            'SKIP'
            'f1ad7792b3b42397c2645e834d4b6c6a89122060455954d1ab56a71c673c3b8a8fdbbd6d722d30195211672b9075d09ac07ce6fb5d9723f56ce540709ebe4665')
b2sums=('b60d8e61a15167df3316a7336467740efd4888784228dd6a08b1d974c54c479c082ba142eb60d3f356b06053e5c472f747e0ca830d50bed9f31c13d52b549ca1'
        'SKIP'
        '92e1969572e0022bd257f44314045f57db47821d99a40ea1290749967b50ead1cb11adaa9b79f4286fbf20a94173e0ba7f2d4f88208e31d7a03a8de4ea014396')
validpgpkeys=('ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB'    # Giancarlo Razzolini
              'C100346676634E80C940FB9E9C02FF419FECBE16')   # Morten Linderud

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../nosystemd.patch
}

check() {
  make -C "$pkgname-$pkgver" check
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
  rm -f "${pkgdir}"/usr/lib/initcpio/install/sd-*
}
