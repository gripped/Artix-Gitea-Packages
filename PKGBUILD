# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=shadow
pkgver=4.16.0
pkgrel=1
pkgdesc="Password and account management tool suite with support for shadow files and PAM"
arch=(x86_64)
url="https://github.com/shadow-maint/shadow"
license=(BSD-3-Clause)
depends=(
  glibc
  libelogind
)
makedepends=(
  acl
  attr
  audit
  docbook-xsl
  elogind
  git
  itstool
  libcap
  libxcrypt
  libxslt
  pam
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
# NOTE: distribution patches are taken from https://gitlab.archlinux.org/archlinux/packaging/upstream/shadow/-/commits/4.16.0.arch1
source=(
  git+$url.git?signed#tag=$pkgver
  0001-Disable-replaced-tools-their-man-pages-and-PAM-integ.patch
  0002-Adapt-login.defs-for-PAM-and-util-linux.patch
  0003-Add-Arch-Linux-defaults-for-login.defs.patch
  shadow.{sysusers,tmpfiles}
  useradd.defaults
  0001-elogind-support.patch
)
sha512sums=('9b01725da77dd76efc3a22f2a31c6727e5cf2bab64e803c3e5e3bfb4921ed5344de2b359c07253bbb6a1cd846c4fc6168604ba6ac455e32d5f3ec2ebac2ebf2a'
            '8550c2df5d38b375aa2da28ba65e9c658c69a18a455e3f5977aa2cc7af976a69a86a71d22a8857bf3a1ebedcc1fa4bc169c51655a7636bed2242bd420b9a084f'
            '4b1ff03841cb924e82d0d118158105d4a0d1d19285610b0b81cb640c3dcfcd83f3ee384ea451934adcbf13aadc731140a1e963d6f5d31761847ff8f5dc8128d8'
            '173d9607e4010d1d7d7fcd9f0ee2eb68b55998816228447a4e02bef150bb475c40aa23bfdce2de4260b02f448513975791bd1d88d1b6ff17ede7631f0b76f5a2'
            '5afac4a96b599b0b8ed7be751e7160037c3beb191629928c6520bfd3f2adcd1c55c31029c92c2ff8543e6cd9e37e2cd515ba4e1789c6d66f9c93b4e7f209ee7a'
            '97a6a57c07502e02669dc1a91bffc447dba7d98d208b798d80e07de0d2fdf9d23264453978d2d3d1ba6652ca1f2e22cdadc4309c7b311e83fa71b00ad144f877'
            '706ba6e7fa8298475f2605a28daffef421c9fa8d269cbd5cbcf7f7cb795b40a24d52c20e8d0b73e29e6cd35cd7226b3e9738dc513703e87dde04c1d24087a69c'
            '355f45d6f88ae2541392db06ab5055467ed432ba0107bdc0dc6ead33d6a677e12648d8876a70dc576a58ebf29989c7a2fce1a7336f0a786871e61dcfba003643')
b2sums=('4829db7d27b60648e0697d183023d7813b9215b812644b4767872669ad4eafe5e91de40a1a1a4c6f5f2cc6c091b1867c31f5d011a34adb0e37e9fd632d6afab5'
        'c828510e0be5062d020b904a45bfe73ed70b4f2821d0af0c0fb349465315b8b3f478b0d84c175e9bbe2f326e1741705f52b7549cd51e6983cab8689d66227877'
        '190e4248cd13d7e4d2d51360e62d89f6498ac6208abf536f9bfcb98893d6d0f0dfc53037787e1a738ef16ace75484096cba997e5bd95083b38693797f78dfdb4'
        '76859eff360cf1cfaf58296c4a42b38daa4709a130dfdeaffc3666d56351479fa9131e3ee6ecd491142bf1b093e47465477739c08368d496e2c1b7c9d66f0795'
        '511c4ad9f3be530dc17dd68f2a3387d748dcdb84192d35f296b88f82442224477e2a74b1841ec3f107b39a5c41c2d961480e396a48d0578f8fd5f65dbe8d9f04'
        'd727923dc6ed02e90ef31f10b3427df50afbfe416bd03c6de0c341857d1bb33ab6168312bd4ba18d19d0653020fb332cbcfeeb24e668ae3916add9d01b89ccb4'
        'f743922062494fe342036b3acb8b747429eb33b1a13aa150daa4bb71a84e9c570cfcc8527a5f846e3ea7020e6f23c0b10d78cf2ba8363eea0224e4c34ea10161'
        '33e27ac3451731f9b896b0a4da538d685923c9b0d347fe033241b7e0a215361ba6ed7d0b5c4899155256ad865e3125bc56a9e8c3b007724fb15135d284da8476')
validpgpkeys=(
  66D0387DB85D320F8408166DB175CFA98F192AF2  # Serge Hallyn <sergeh@kernel.org>
  A9348594CE31283A826FBDD8D57633D441E25BB5  # Alejandro Colomar <alx@kernel.org>
)

prepare() {
  local filename

  cd $pkgname
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
    --without-bcrypt
    --without-libbsd  # shadow can use internal implementation for getting passphrase
    --without-nscd  # we do not ship nscd anymore
    --without-selinux
    --without-su  # su is provided by util-linux
    --enable-logind=yes
  )

  cd $pkgname
  # add extra check, preventing accidental deletion of other user's home dirs when using `userdel -r <user with home in />`
  export CFLAGS="$CFLAGS -DEXTRA_CHECK_HOME_DIR"
  ./configure "${configure_options[@]}"

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  depends+=(
    acl libacl.so
    attr libattr.so
    audit libaudit.so
    libxcrypt libcrypt.so
    pam libpam.so libpam_misc.so
  )

  cd $pkgname

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
}
