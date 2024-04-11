# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=shadow
pkgver=4.15.1
pkgrel=2
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
  itstool
  libcap
  libxcrypt
  libxslt
  pam
  elogind
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
# NOTE: distribution patches are taken from https://gitlab.archlinux.org/archlinux/packaging/upstream/shadow/-/commits/4.15.1.arch1
source=(
  $url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz{,.asc}
  0001-Disable-replaced-tools-their-man-pages-and-PAM-integ.patch
  0002-Adapt-login.defs-for-PAM-and-util-linux.patch
  0003-Add-Arch-Linux-defaults-for-login.defs.patch
  shadow.{sysusers,tmpfiles}
  useradd.defaults
  0001-elogind-support.patch
)
sha512sums=('e3ae51bf53bfa1662d81bbe0150ada19c116514f1e56391d877045d48e16776326446561759edbf5006c0f97ab1d5f4bae63521bf1fae67e118ddda0d4a8f6cb'
            'SKIP'
            '839b83a3824be89930207e635f7aaa10cf3660ba2f4a6e95b3366d083fe2c76295d1d54b108bdfe317e5ebb049a8bbbf7b5859907d201cee43af330abb2091b6'
            'a3da00d0368a9397be00ce1fc06416e5261f2000b99f69bd83202cf56e7d0ebea34562fbf35fdf43e7cf52a82f6720f6299defed9fa1d6436648e2f29d10512b'
            'c41e2cef30930a79a6ad4eb63a8106688fde49b3bfc22ec68833e1974d6932e856244dc5f0fbe63943dcd09c05d06db6aa71783aa09a25708f78898189436683'
            '5afac4a96b599b0b8ed7be751e7160037c3beb191629928c6520bfd3f2adcd1c55c31029c92c2ff8543e6cd9e37e2cd515ba4e1789c6d66f9c93b4e7f209ee7a'
            '97a6a57c07502e02669dc1a91bffc447dba7d98d208b798d80e07de0d2fdf9d23264453978d2d3d1ba6652ca1f2e22cdadc4309c7b311e83fa71b00ad144f877'
            '706ba6e7fa8298475f2605a28daffef421c9fa8d269cbd5cbcf7f7cb795b40a24d52c20e8d0b73e29e6cd35cd7226b3e9738dc513703e87dde04c1d24087a69c'
            '355f45d6f88ae2541392db06ab5055467ed432ba0107bdc0dc6ead33d6a677e12648d8876a70dc576a58ebf29989c7a2fce1a7336f0a786871e61dcfba003643')
b2sums=('a24f492cb2a7721b165c70237b1a9290acc0063bdf493f061752ca41d23a1154b26e16ee00dd96a19e825eff7f711391892eeb08a314d9277514d4d32a4adafe'
        'SKIP'
        '8d49018484533f1e9d0a2bdc81d6550a1662b275ffb5bb6dbe3d3062aa7d25e7acd3234bcbd3eb3e00dd8cd3a480cab9753d72b6970c44dc6e814ca5b45b554c'
        '5fa58287e123fac7ba2cde8c98e0dfd52cbff0d0d67306b359881ebc54997907fe64b59012880f8750a152d05c05063888a03e43c19eabc7a2de0590bae0b1df'
        '0ae11bf0ded3e6d6be3d960f5b75fdc885d936f499d162944ef27f0c3997be4fd1fc4f08cba60be6f81eddefbbb576cc37aeaf13993d80bfc8d452e496d286f4'
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
    --without-bcrypt
    --without-libbsd  # shadow can use internal implementation for getting passphrase
    --without-nscd  # we do not ship nscd anymore
    --without-selinux
    --without-su  # su is provided by util-linux
    --enable-logind=yes
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
  depends+=(
    acl libacl.so
    attr libattr.so
    audit libaudit.so
    libxcrypt libcrypt.so
    pam libpam.so libpam_misc.so
  )

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
}
