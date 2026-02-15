# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=mkinitcpio
pkgver=40
pkgrel=4
pkgdesc="Modular initramfs image creation utility"
arch=('any')
url='https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio'
license=('GPL-2.0-only')
depends=('awk' 'mkinitcpio-busybox' 'kmod' 'util-linux' 'libarchive' 'coreutils'
         'bash' 'binutils' 'diffutils' 'findutils' 'grep' 'gzip' 'filesystem' 'zstd' 'udev')
checkdepends=('bats' 'bats-assert' 'lzop')
makedepends=('meson')
optdepends=('xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'lz4: Use lz4 compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS'
            'eukify: alternative UKI generator')
conflicts=(
  'lvm2<2.03.36-2'
)
provides=('initramfs')
backup=('etc/mkinitcpio.conf')
source=("https://sources.archlinux.org/other/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig}
        '0001-trigger.patch'
        '0001-no-systemd.patch'
        '0002-no-systemd-meson.patch'
)
sha512sums=('f74a1cee5ea24b8f57d84952e92048548b6cba2138c19d9a05e76051f4765994cd5b1e41363d90b3a9718e0844268cc4046cd02dcecb32e38948ba90ecceb17f'
            'SKIP'
            '9cf1374a1cb12267e7c0a58aed7c188e75ebaddba1b1738e77d18e9b48d8ee0b0a5eb16d4eba901a0b56be06e113f3284216206c9f97f8db35ca121e9ab3533b'
            'cb75fa00a4a4be71552d30566df5208f23050f0f9a7a7f914a41e536e3ddbb61ac4bb6af55e70be1db5890648e4f749606f5c8d9c86dab5815abedc154e80db7'
            '9842c294ce8b1d487f6f31af4e5a4d738451ac0bff8362695202058a3bbeab233e739a87aff8471f395b7b4daf2fc6aeb553c33c4bd81a4461b2d8d0e45602e2')
b2sums=('c683e795e0d058567d86905e0fe14086a675e0156d11f965cc335da9361ce1809659906b0d263c2bb368f4049fc94715cfb8981414d57cfd3f877816a75ac14d'
        'SKIP'
        'f50e34e58c76f0972e8ba4222b7b5d6ab7c1ed2710a6064a65239ad4999df2c7c20a6b1e2c6a745195c7809a5ee8259ef6c30361ea88d5b5dbc50e40a885f201'
        '48004a3a62ad7a4b4b6b579624585e9d6369c88d6568c906b524a9bd71e5fd32859d76051830fb92ca1ffd76f53ff37056616e24681041519180cf7c3c4bc246'
        'df89743e13001cfc7185c6a19cea944b9b5bfb01f16b2bdcda7aa60f2804c1d1bfd6840b1ae6ccbcef889e8c560daae051c49560148d51a022fcfa53b033c939')
validpgpkeys=('ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB'    # Giancarlo Razzolini
              'C100346676634E80C940FB9E9C02FF419FECBE16')   # Morten Linderud

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 < ../0001-trigger.patch
  patch -Np1 -i ../0001-no-systemd.patch
  patch -Np1 -i ../0002-no-systemd-meson.patch
}

build(){
  cd "$pkgname-$pkgver"
  artix-meson \
    -Dsystemd=disabled \
    ../build
  meson compile -C ../build
}

check() {
  cd "$pkgname-$pkgver"
  meson test -C ../build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" meson install -C ../build
}
