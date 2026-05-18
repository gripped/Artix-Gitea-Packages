# Maintainer: Eric Bélanger <eric@archlinux.org>
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgbase=lvm2
pkgdesc='Device mapper and Logical Volume Manager'
pkgname=('lvm2' 'device-mapper')
pkgver=2.03.41
pkgrel=1
arch=('x86_64')
url='https://sourceware.org/lvm2/'
license=('GPL-2.0-only' 'LGPL-2.1-only')
makedepends=('git' 'udev' 'libaio' 'thin-provisioning-tools')
validpgpkeys=('88437EF5C077BD113D3B7224228191C1567E2C17'  # Alasdair G Kergon <agk@redhat.com>
              'D501A478440AE2FD130A1BE8B9112431E509039F') # Marian Csontos <marian.csontos@gmail.com>
source=("git+https://gitlab.com/lvmteam/lvm2.git#tag=v${pkgver//./_}?signed"
        '0001-libdm-Makefile-add-an-empty-target-install_lvm2.patch')
sha256sums=('7ad3899acacc53697fcc6bf9e8f93e0017f22cddeea0db60c77fcab6ddc5959e'
            '867a9ea522754144cd33d203a9400013bb9209925db9ef033b07dd586eda69dd')

_backports=(
)

prepare() {
  cd lvm2/

  local _c
  for _c in "${_backports[@]}"; do
    git log --oneline -1 "${_c}"
    git show "${_c}" -- ':(exclude)WHATS_NEW' | git apply
  done


  # libdm/Makefile: add an empty target install_lvm2
  patch -Np1 < ../0001-libdm-Makefile-add-an-empty-target-install_lvm2.patch
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
  pkgdesc='Device mapper userspace library and tools'
  url='http://sourceware.org/dm/'
  depends=(
    'bash'
    'glibc'
    'libgcc' 'libgcc_s.so'
    'libudev' 'libudev.so')
  provides=('libdevmapper.so'
    'libdevmapper-event.so')

  cd lvm2/

  make DESTDIR="${pkgdir}" install_device-mapper
}

package_lvm2() {
  pkgdesc='Logical Volume Manager 2 utilities'
  url='https://sourceware.org/lvm2/'
  depends=(
    'bash'
    "device-mapper>=${pkgver}"
    'glibc'
    'libaio' 'libaio.so'
    'readline' 'libreadline.so'
    'libudev' 'libudev.so'
    'thin-provisioning-tools'
    'util-linux-libs' 'libblkid.so')
  conflicts=('lvm' 'mkinitcpio<38-1')
  backup=('etc/lvm/lvm.conf'
    'etc/lvm/lvmlocal.conf')

  cd lvm2/

  make -j1 DESTDIR="${pkgdir}" install_lvm2
  # /etc directories
  install -d "${pkgdir}"/etc/lvm/{archive,backup}

}
