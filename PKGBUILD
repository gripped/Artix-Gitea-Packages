# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=mkinitcpio
pkgver=39.1
pkgrel=1
pkgdesc="Modular initramfs image creation utility"
arch=('any')
url='https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio'
license=('GPL-2.0-only')
depends=('awk' 'mkinitcpio-busybox>=1.19.4-2' 'kmod' 'util-linux>=2.23' 'libarchive' 'coreutils'
         'bash' 'binutils' 'diffutils' 'findutils' 'grep' 'filesystem>=2011.10-1' 'zstd' 'udev')
checkdepends=('bats' 'bats-assert' 'lzop')
makedepends=('asciidoc')
optdepends=('gzip: Use gzip compression for the initramfs image'
            'xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'lz4: Use lz4 compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS')
provides=('initramfs')
backup=('etc/mkinitcpio.conf')
source=("https://sources.archlinux.org/other/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig}
        0001-no-systemd.patch)
sha512sums=('8d6ed6eb222f34960e5cd9480e965f1fdb9b1af439d68e199cd17e92a3bbc8a34fb9d4ade1b32a3f8b844529b1c6fbeb2d2fa40e0cf9bd1dd767caa2bb148b60'
            'SKIP'
            '967081598af3613a2cc28b1c775cc28f7acb20d0269c72d5076dc110d4aca8c16fe8c99e52f8e0cc002028acaab7d82edb1bc80efb735e4352a988ea0466d76f')
b2sums=('f3ac6e73dcb3825f6708a97022a7573078d9ac11bd5f7f147dc6dabfbe406fb56157cf0efef126b0e505b22816257c329d809f1bc085724ad305928137be9248'
        'SKIP'
        '7a9cbf7fb5714af3c1c28a015cbbf961998789fc71ba50bff1cbb0640827a969c6048300ee7b4598edc362d75a063785a6473103fdf27b02cb208ca5fe1156e5')
validpgpkeys=('ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB'    # Giancarlo Razzolini
              'C100346676634E80C940FB9E9C02FF419FECBE16')   # Morten Linderud

prepare() {
  patch -d "$pkgname-$pkgver" -Np1 -i ../0001-no-systemd.patch
}

check() {
  make -C "$pkgname-$pkgver" check
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
