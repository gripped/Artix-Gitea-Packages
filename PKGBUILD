# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=mkinitcpio
pkgver=41
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
provides=('initramfs')
backup=('etc/mkinitcpio.conf')
source=("https://sources.archlinux.org/other/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig}
        "patch-udev.patch"
        # artist - this patch is patch is not needed as the code gets deleted by 0001-no-systemd.patch :
        #"install-encrypt-add-dlopen-ed-libcryptsetup.patch"
        '0001-no-systemd.patch'
        '0002-no-systemd-meson.patch'
)
sha512sums=('bb0955214d037e645c2cae34423a31a1baae5d9864bce56a4477dfe5a38151057f643dc34ec51de0ed9f420ec922f974a6cbec18f9d5c65813ca1e5896362776'
            'SKIP'
            '37e7f8b88a00f19660ea66c92e4a999548194ca827293b2bb723c3556b275bef86b5d89dffcb598c43c6c47c4c7a38b39159680d80eccf2f4d1c1c44b65757ea'
            'bba2bd7e7b4354b90b3f8146b0fb1b24f8281bffcde6dfd96498150b4b4793056cc9d900b332a3153eb54dba34ff9e42ad82b7f856ec12abe11505f9d07fd9b5'
            '5e337b886604ac1f62922acd618574cc26889e2e02fabd601db15e34b9c0551456c9e1e7683b9f9aa22a88a5b83aba8164b0d4b4385d0eb181b2d19c591fc126')
b2sums=('39d95a41b0da67e4d7e376083cc21a3c2b91ff262bd7096956457b2d0baee4e61342e022eb5ab05fb8ab189ef57d92c2a8e1f34a4b11deda4c1385e6cd553fa2'
        'SKIP'
        'b012816777c55b41e431b1727d3245abd3e040b6d167f4fb017115e1ff330516965052d47d0c8542ee837e625ff7d5478ef6afcdd908bdc1c0f2b374d9ceb9aa'
        '8131b6c94c632b619d113abdcffbbdc9a901d16face4aa75a11d81292dcf485b4f90192b2237362c09113a344025866412e82e0f292e465463b04016830a0dc2'
        '49b9da35d55d48a62cb866c58e29366d7ee865e03c4b51b34862b7bd450cd7b53bdd40156f7e376342540b051cabb9a57fc8b3f2c62b50dac7e27470875a792a')
validpgpkeys=('ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB'    # Giancarlo Razzolini
              'C100346676634E80C940FB9E9C02FF419FECBE16')   # Morten Linderud

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 < "$srcdir/patch-udev.patch"
  # artist - this patch is patch is not needed as the code gets deleted by 0001-no-systemd.patch :
  #patch -Np1 < "$srcdir/install-encrypt-add-dlopen-ed-libcryptsetup.patch"

  patch -Np1 -i ../0001-no-systemd.patch
  patch -Np1 -i ../0002-no-systemd-meson.patch
}

build(){
  cd $pkgname-$pkgver
  artix-meson \
     -Dsystemd=disabled \
    ../build
  meson compile -C ../build
}

check() {
  cd $pkgname-$pkgver
  meson test -C ../build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" meson install -C ../build
}
