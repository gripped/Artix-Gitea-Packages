# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=libblockdev
pkgver=3.0.3
pkgrel=5
pkgdesc="A library for manipulating block devices"
arch=('x86_64')
url="https://github.com/storaged-project/libblockdev"
license=(LGPL-2.1-or-later)
depends=(
  'cryptsetup'
  'device-mapper'
  'e2fsprogs'
  'gcc-libs'
  'glib2'
  'glibc'
  'kmod'
  'keyutils'
  'libbytesize'
  'libnvme'
  'mdadm'
  'nss'
  'parted'
  'libudev'
  'util-linux-libs'
  'volume_key'
)
makedepends=(
  'autoconf-archive'
  'gobject-introspection'
  'gtk-doc'
  'ndctl'
  'python'
  'util-linux'
)
optdepends=(
  'btrfs-progs: BTRFS plugin'
  'dosfstools: VFAT filesystem support'
  'exfatprogs: for exFAT filesystem support'
  'f2fs-tools: for F2FS filesystem support'
  'gobject-introspection-runtime: for Python integration'
  'lvm2: LVM plugin'
  'ndctl: NVDIMM plugin'
  'nilfs-utils: for nilfs filesystem support'
  'ntfs-3g: NTFS filesystem support'
  'python: for Python integration'
  'udftools: for UDF filesystem support'
  'xfsprogs: XFS filesystem support'
)
source=(
  "https://github.com/storaged-project/libblockdev/releases/download/$pkgver-1/libblockdev-$pkgver.tar.gz"
  $pkgname-3.0.3-memory_allocation_for_device_ioctls.patch::$url/commit/2ae0d949eb87142b0212e5953a0e5ad1a146ed6b.patch
)
sha512sums=('f2cc6fbe1df6fd9886016177a4a94984d704f3b402c7090344c581afb89f7cb050c9516c52974157a99ea6c6239f6a1f6079cde0b43a2336af0daca7311ca788'
            'a0609158aa1d94ce99491a403561c7c8a7100f665c23a2225ea226027316550aeba5ebfaf8c74d50bb94d4be0ebb14ddb8d1f17475207418bc40414553a50dea')
b2sums=('c26a806797effc7231a0eb92f1b8cd74e548da5b1800cddd75a21e7df327be8371edabc2e9a39a727291f365b6a4f6242f78b66396adc4526b41749219f0429f'
        '3c798fe55d15e959d43f948dad802788be005fed81a2d3f28ae6796f7c7548c28f8bb79efcb75a077efe2a69f9b604f0035b738364d263c08096f4f6e938deee')

prepare() {
  # fix issue with udisks being OOM killed:
  # https://github.com/storaged-project/udisks/issues/1192
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-3.0.3-memory_allocation_for_device_ioctls.patch
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --without-bcache
    --without-lvm_dbus
    --without-mpath
  )

  cd $pkgname-$pkgver
  ./configure "${configure_options[@]}"
  # prevent libtool from overlinking everything
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
