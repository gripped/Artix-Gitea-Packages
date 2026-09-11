# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=mkinitcpio
pkgver=42
pkgrel=1.2
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
        '0001-no-systemd.patch'
	'0002-no-systemd-meson.patch')
sha512sums=('bb8b7b2153c6c73c3e8829b0d2beed9c9096830cf21ec9f97fc993384f0e174e66c412ced96589fcf8244e17b8427db346310d50ab8335fb489d7842ba7fe0c9'
            'a21cacf34ab69124c95d1523dce82091ad982348894f89f7fae3e3a07a27c005ff29ce89ba10469476642bb3aba24ceeeb685eae5d287b6d7fbff86e61d4e134'
            '95730598b7497fd43b7d40924024fb0b43c423a8a098b2af4d4e1ffbbd8534fd521f4050b0b5db0161427b5d6d80c5b75177c86bd3c4501884b0b7891b66469a')
b2sums=('fad80b4d2abe0eecb001b6369103a6ed079c6dbb724821498a635ce51cf4731a46831fe4aaf05e860782ab0a69ad0ba09e11f314a0a1ac452d1b9001df38cd4b'
        '70f2d226ab6025c7e804481564c34db4ff2d617c5c95761e3a903ba50dabff26823c5b79511e3fbda788239570e45a5c0372f80c7f1d07b6aa929bb75268d42c'
        '1ef09da70d5e5944839eeac21626cf28384b848ad7bd751342807d054f10f6ca4ce2414338f6fa37bc7a852f90f61939040117d437d96df536fc87b970f71895')
validpgpkeys=('ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB'    # Giancarlo Razzolini
              'BB8E6F1B81CF0BB301D74D1CBF425A01E68B38EF')   # nl6720

prepare() {
	cd "$pkgname"
	patch -Np1 -i ../0001-no-systemd.patch
	rm -rf install/sd-vconsole
	
	sed -e 's,systemd_hooks,udev_hooks,g' \
	    -i meson.build \
	    -i meson.options
}

build(){
	artix-meson -Dudev_hooks=true -D systemd=disabled "$pkgname" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
