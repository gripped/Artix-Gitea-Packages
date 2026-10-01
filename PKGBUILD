# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=mkinitcpio
pkgver=42.2
pkgrel=1
pkgdesc="Modular initramfs image creation utility"
arch=('any')
url='https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio'
license=('GPL-2.0-only')
depends=('awk' 'mkinitcpio-busybox' 'kmod' 'util-linux' 'libarchive' 'coreutils'
         'bash' 'binutils' 'diffutils' 'findutils' 'grep' 'gzip' 'filesystem' 'zstd' 'udev')
checkdepends=('bats' 'bats-assert' 'lzop')
makedepends=('asciidoctor' 'git' 'meson')
optdepends=('xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'lz4: Use lz4 compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS')
provides=('initramfs')
backup=('etc/mkinitcpio.conf')
source=("git+$url.git#tag=v${pkgver}?signed"
        '0001-no-systemd.patch' '0002-no-systemd-meson.patch')
sha512sums=('ddc6cb65586ea690ebdcf04f12eb0b441306efc900fb3045816512ec43b25cdec484d72cb1cbb928911a14ffd8637b14a2b7d0706232dd58797a3a07b0d40fc2'
            'a21cacf34ab69124c95d1523dce82091ad982348894f89f7fae3e3a07a27c005ff29ce89ba10469476642bb3aba24ceeeb685eae5d287b6d7fbff86e61d4e134'
            '822643aa77e78728bd073b54cb8fe5d831e6e23efe9359f1566bddc579ac0737bb97a7f8c7370a818ab063453b88c2fec5b995e4d8f31a4436282911dc12df4d')
b2sums=('b2fb0987878f13a26ebae0c2b4a75b15f52d3f1f8d5eb46ba7e8114629889070472232a4cb5cb259a3fae0c1658ac2d049f17933bbaa6bab9fdd31cd8af18640'
        '70f2d226ab6025c7e804481564c34db4ff2d617c5c95761e3a903ba50dabff26823c5b79511e3fbda788239570e45a5c0372f80c7f1d07b6aa929bb75268d42c'
        'ba26551286a496af42e9dc9f8591894430ec3ba72ffa302d17716029475f89afba8ade930c33d4877d848f9d38a9e8402557a36c4ea2eab1e13096a8ac2fcb55')
validpgpkeys=('ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB'    # Giancarlo Razzolini
              'BB8E6F1B81CF0BB301D74D1CBF425A01E68B38EF')   # nl6720

prepare() {
cd "$pkgname"
patch -Np1 -i ../0001-no-systemd.patch
patch -Np1 -i ../0002-no-systemd-meson.patch
rm -rf install/sd-vconsole
}
build(){
	artix-meson -Dudev_hooks=true -Dsystemd=disabled "$pkgname" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
