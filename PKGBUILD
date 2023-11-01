# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=shadow
pkgver=4.14.2
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
# NOTE: distribution patches are taken from https://gitlab.archlinux.org/archlinux/packaging/upstream/shadow/-/commits/v4.14.2.arch1
source=(
  $url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz{,.asc}
  0001-Disable-replaced-tools-their-man-pages-and-PAM-integ.patch
  0002-Adapt-login.defs-for-PAM-and-util-linux.patch
  0003-Add-Arch-Linux-defaults-for-login.defs.patch
  shadow.{sysusers,tmpfiles}
  useradd.defaults
)
sha512sums=('b417dbe0fbbeced1022e64efe9dcd8b41d14779c45163e6de63891ac63f837d43f3e559f99f884099aa45282299ceb4dcb9fd29d21c9925687ff8462fe6ead2f'
            'SKIP'
            'd1f05cb5bbd92fc4dd25d31ef59307214fcf6e57742cde984252ca77ba8fc8a5ada98769ad23976c23907ef6c2f399f6b3d59e3d655843fa18a1d050fd33c933'
            'eaf8122f12824da7de4665e78b807dd8d0e731f27267227b35dac99c3d1712a9527487b2b20c7fa3279fc3e1d6d5a0ece0d15e91f2f5255da9e31a3fb01a87c5'
            'f879b24ee304a93a5d34ee5868778ce928eddf40cd11c62ca782ab5322467bcff28ddca6ce83df4cede068bbe8277d54030f329b9fd6f90ad7fb511d23ef028f'
            '5afac4a96b599b0b8ed7be751e7160037c3beb191629928c6520bfd3f2adcd1c55c31029c92c2ff8543e6cd9e37e2cd515ba4e1789c6d66f9c93b4e7f209ee7a'
            '97a6a57c07502e02669dc1a91bffc447dba7d98d208b798d80e07de0d2fdf9d23264453978d2d3d1ba6652ca1f2e22cdadc4309c7b311e83fa71b00ad144f877'
            '706ba6e7fa8298475f2605a28daffef421c9fa8d269cbd5cbcf7f7cb795b40a24d52c20e8d0b73e29e6cd35cd7226b3e9738dc513703e87dde04c1d24087a69c')
b2sums=('419f0a516753616ef691f71ec9002eef6fd7568c013ac71900d7481eff1bd9165c69d9587b7ca25800543a2eac58cfb7ce4224063e8af7b278f589640485c28f'
        'SKIP'
        '0631587a1a7209f411f4eb72511b3523cdeb543b750f56be664ca135531dd0f7b1c1611fe9f2e1e5c5594f5f6703fdf8b982b41f1527d855d806a2a04deeb02d'
        '44228c694fbd92ade47852a85b52b58385e1ef9755a2dd2254be21b0bf80dc17f57c7ef9d64f092f10b7302fea05c5a9fa3ae0d8ba40e3ce00ecf26c98793202'
        '22d4ea8ec0ce9ba5e2e4ea9817c39d9bdae18e7a15797497319024265547dccf3dfb5f3cf59a904c10a45cb5282dda76c8ccb0f4a94f0f327174277dd98d8312'
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
