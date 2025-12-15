# Maintainer: Eric Bélanger <eric@archlinux.org>
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgbase=lvm2
pkgname=('lvm2' 'device-mapper')
pkgver=2.03.38
pkgrel=1
arch=('x86_64')
url='https://sourceware.org/lvm2/'
license=('GPL-2.0-only' 'LGPL-2.1-only')
makedepends=('git' 'udev' 'libaio' 'thin-provisioning-tools')
validpgpkeys=('88437EF5C077BD113D3B7224228191C1567E2C17'  # Alasdair G Kergon <agk@redhat.com>
              'D501A478440AE2FD130A1BE8B9112431E509039F') # Marian Csontos <marian.csontos@gmail.com>
source=("git+https://gitlab.com/lvmteam/lvm2.git#tag=v${pkgver//./_}?signed")
sha256sums=('57906de8293d19f284c58bee82602f018bf7283ed03c043ca2ab3e28e453c974')

_backports=(
)

prepare() {
  cd lvm2/

  local _c
  for _c in "${_backports[@]}"; do
    git log --oneline -1 "${_c}"
    git show "${_c}" -- ':(exclude)WHATS_NEW' | git apply
  done

}

build() {
  # build system requires bash:
  # https://www.redhat.com/archives/linux-lvm/2020-January/msg00004.html
  # https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Defining-Variables.html
  export CONFIG_SHELL=/bin/bash

  cd lvm2/

  ./configure \
    CONFIG_SHELL=/bin/bash \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-cmdlib \
    --enable-dmeventd \
    --enable-lvmpolld \
    --enable-pkgconfig \
    --enable-readline \
    --enable-udev_rules \
    --enable-udev_sync \
    --enable-write_install \
    --with-cache=internal \
    --with-default-dm-run-dir=/run \
    --with-default-locking-dir=/run/lock/lvm \
    --with-default-pid-dir=/run \
    --with-default-run-dir=/run/lvm \
    --with-libexecdir=/usr/lib/lvm2 \
    --with-systemdsystemunitdir=no \
    --with-thin=internal \
    --with-udev-prefix=/usr
  make
}

package_device-mapper() {
  pkgdesc="Device mapper userspace library and tools"
  url="http://sourceware.org/dm/"
  depends=('glibc' 'libudev' 'libudev.so')
  provides=('libdevmapper.so'
    'libdevmapper-event.so')

  cd lvm2/

  make DESTDIR="${pkgdir}" install_device-mapper
}

package_lvm2() {
  pkgdesc="Logical Volume Manager 2 utilities"
  depends=('bash' "device-mapper>=${pkgver}" 'libudev'
    'libudev.so' 'util-linux-libs' 'libblkid.so' 'readline' 'libreadline.so'
    'thin-provisioning-tools' 'libaio' 'libaio.so')
  conflicts=('lvm' 'mkinitcpio<38-1')
  backup=('etc/lvm/lvm.conf'
    'etc/lvm/lvmlocal.conf')

  cd lvm2/

  make DESTDIR="${pkgdir}" install_lvm2
  # /etc directories
  install -d "${pkgdir}"/etc/lvm/{archive,backup}

}
