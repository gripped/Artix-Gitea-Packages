# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=shadow
pkgver=4.14.3
pkgrel=1
pkgdesc="Password and account management tool suite with support for shadow files and PAM"
arch=(x86_64)
url="https://github.com/shadow-maint/shadow"
license=(BSD-3-Clause)
depends=(
  acl libacl.so
  attr libattr.so
  audit libaudit.so
  glibc
  libxcrypt libcrypt.so
  pam libpam.so libpam_misc.so
)
makedepends=(
  docbook-xsl
  itstool
  libcap
  libxslt
)
backup=(
  etc/default/useradd
  etc/login.defs
  etc/pam.d/chpasswd
  etc/pam.d/groupmems
  etc/pam.d/newusers
  etc/pam.d/passwd
)
options=(!emptydirs)
# NOTE: distribution patches are taken from https://gitlab.archlinux.org/archlinux/packaging/upstream/shadow/-/commits/4.14.3.arch1
source=(
  $url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz{,.asc}
  0001-Disable-replaced-tools-their-man-pages-and-PAM-integ.patch
  0002-Adapt-login.defs-for-PAM-and-util-linux.patch
  0003-Add-Arch-Linux-defaults-for-login.defs.patch
  shadow.{sysusers,tmpfiles}
  useradd.defaults
)
sha512sums=('da5bba26ccf64535e39a4918033f76bf40da00959512424b23427511bedd9b5a4973343062cc8e415690ebc842a1d4a3ac344bca8d14a57f38281629d0bf3edd'
            'SKIP'
            '8d96630e9144f838edb9a5bc3dfae20158cb67aa9ddb64b07d80094123a21ebb0dd024230ab8e30ac13b64558daf8c0aad1bc301aa05fada44e26f73db2c9dc7'
            '38b1803c991cec6dc840c71cd7b5461488bedd49d6da37c29aa97e927a8e298b728b5c7566b60d3ac83438003a23d4d2c9d409f014df81d359fb08d61bbabb57'
            'df1a70e27fe665c02113cc8d810bbae968f88fa190314443f4ef58cb5c39c0826aae04da32d7da63eb17806414d7668d513dcfc47747e0e9a15943368805edd8'
            '5afac4a96b599b0b8ed7be751e7160037c3beb191629928c6520bfd3f2adcd1c55c31029c92c2ff8543e6cd9e37e2cd515ba4e1789c6d66f9c93b4e7f209ee7a'
            '97a6a57c07502e02669dc1a91bffc447dba7d98d208b798d80e07de0d2fdf9d23264453978d2d3d1ba6652ca1f2e22cdadc4309c7b311e83fa71b00ad144f877'
            '706ba6e7fa8298475f2605a28daffef421c9fa8d269cbd5cbcf7f7cb795b40a24d52c20e8d0b73e29e6cd35cd7226b3e9738dc513703e87dde04c1d24087a69c')
b2sums=('6707cae41a0f8478cadd94ea5eaba95cdc6b1b23896b8dd903c62c931839a82b0538f04f8c12433f148da5b23c12a033963380be81f6fc97fa0e3f9399e51b21'
        'SKIP'
        '9bfdd4d0b7ce997b4a95f9334790fd907e52afa4dd8f2104f2c1413f17c46f9d8f2c3ae9c86927b5f70cedbcae1f1ec522f3c81896f9629ad84eefdd87b0f7ce'
        'd8c6a25b7a7a7578dfc9e4dc762e9f40d3d5e3f8a6e44c6abd1dc6d874e81830ce2cf335584c35277b69539cc1172611d2fdfa72c740247f2dd35ba77b66827a'
        '56135cdc049ccce1f1da89f41b840cf2cd7365fec6d2e771906eb4e406b2ffe90703cf2070c52748b1035d7cfd29d90f4d9eed38b06f0fac8a58c3dd89a86ea9'
        '511c4ad9f3be530dc17dd68f2a3387d748dcdb84192d35f296b88f82442224477e2a74b1841ec3f107b39a5c41c2d961480e396a48d0578f8fd5f65dbe8d9f04'
        'd727923dc6ed02e90ef31f10b3427df50afbfe416bd03c6de0c341857d1bb33ab6168312bd4ba18d19d0653020fb332cbcfeeb24e668ae3916add9d01b89ccb4'
        'f743922062494fe342036b3acb8b747429eb33b1a13aa150daa4bb71a84e9c570cfcc8527a5f846e3ea7020e6f23c0b10d78cf2ba8363eea0224e4c34ea10161')
validpgpkeys=(
  66D0387DB85D320F8408166DB175CFA98F192AF2  # Serge Hallyn <sergeh@kernel.org>
  A9348594CE31283A826FBDD8D57633D441E25BB5  # Alejandro Colomar <alx@kernel.org>
)

prepare() {
  local filename

  cd $pkgname-$pkgver
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      printf "Applying patch %s\n" "${filename##*/}"
      patch -Np1 -i "$srcdir/${filename##*/}"
    fi
  done

  autoreconf -fiv
}

build() {
  local configure_options=(
    --bindir=/usr/bin
    --disable-account-tools-setuid  # no setuid for chgpasswd, chpasswd, groupadd, groupdel, groupmod, newusers, useradd, userdel, usermod
    --enable-man
    --libdir=/usr/lib
    --mandir=/usr/share/man
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --with-audit
    --with-fcaps  # use capabilities instead of setuid for setuidmap and setgidmap
    --with-group-name-max-length=32
    --with-libpam  # PAM integration for chpasswd, groupmems, newusers, passwd
    --with-yescrypt
    --without-libbsd  # shadow can use internal implementation for getting passphrase
    --without-nscd  # we do not ship nscd anymore
    --without-selinux
    --without-su  # su is provided by util-linux
  )

  cd $pkgname-$pkgver
  # add extra check, preventing accidental deletion of other user's home dirs when using `userdel -r <user with home in />`
  export CFLAGS="$CFLAGS -DEXTRA_CHECK_HOME_DIR"
  ./configure "${configure_options[@]}"

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C man install

  # license
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  # custom useradd(8) defaults (not provided by upstream)
  install -vDm 600 ../useradd.defaults "$pkgdir/etc/default/useradd"

  install -vDm 644 ../$pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm 644 ../$pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # adapt executables to match the modes used by tmpfiles.d, so that pacman does not complain:
  chmod 750 "$pkgdir/usr/bin/groupmems"

  # manually add PAM config for chpasswd and newusers: https://github.com/shadow-maint/shadow/issues/810
  install -vDm 644 etc/pam.d/{chpasswd,newusers} -t "$pkgdir/etc/pam.d/"
}
