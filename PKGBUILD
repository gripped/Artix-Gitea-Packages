# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=shadow
pkgver=4.14.0
pkgrel=2
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
# NOTE: distribution patches are taken from https://gitlab.archlinux.org/archlinux/packaging/upstream/shadow/-/commits/v4.14.0.arch1
source=(
  $url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz{,.asc}
  0001-Disable-replaced-tools-and-their-man-pages-and-PAM-i.patch
  0002-Adapt-login.defs-for-PAM-and-util-linux.patch
  0003-Add-Arch-Linux-defaults-for-login.defs.patch
  shadow.{sysusers,tmpfiles}
  useradd.defaults
)
sha512sums=('ff960481d576f9db5a9f10becc4e1a74c03de484ecfdcd7f1ea735fded683d7ba0f9cd895dc6a431b77e5a633752273178b1bcda4cefaa5adbf0f143c9a0c86f'
            'SKIP'
            'ac119fd4a7867021923c54d54612499313686bb2faa957133f63c77700b8777dd87628fd4f36d4e4c1160700624a776510bc5d450ef5be1adc128552edfcb062'
            '57166e14262df3ddcf03008a34ef603a624a31b6d40b18b9fc4d8be50fb857540dea2ffc9dab81c91bcd87bbb3b0dee381219ebd3e68f71864c64a33d5ec7b15'
            '14a0527164b5c60bdba0db4ad23d6a2269ce39527bf34adc73abd0716aeced2b9873b60dcb24bd5b8eebd302c1adcbe301f3add7ecd532a873e51fd8bcbb7788'
            '5afac4a96b599b0b8ed7be751e7160037c3beb191629928c6520bfd3f2adcd1c55c31029c92c2ff8543e6cd9e37e2cd515ba4e1789c6d66f9c93b4e7f209ee7a'
            '08a56b16673f282404f3ee026236f3d361045b4448bad7d3cc5d7cbeaf06a1d66a3a3e0848accaebde206741a7998699b9f18bd56a44d93422370567fe8cb180'
            'e9ffea021ee4031b9ad3a534bfb94dbf9d0dfd45a55ecac5dedb2453ea0c17fb80bbb9ad039686bc1f3349dc371977eb548e3a665c56531469c22f29fc4eced8')
b2sums=('6e9a6108f856953ec91c597e46ad4f912101a829c7b3ff3389510be43f56f0a70425bd562119282d73df269df45af354e626741ad748f9c1e6f27b74a462a62c'
        'SKIP'
        '77b6e4bc6dc070b992728440fc29a8ed04e8f51cc7e58628f294c68bec7f102c8a80af6a41cf9a3c37d33e7a40ead4f4729f2e68412ab5606e6ecbd3008f5048'
        'e6359de24e563564979fd0b7915a3227239a84f175cb188392097394d4d41c782100655cbd0a779b6dfde7eddcf8b314ab15eb15ca891287a820547551d54c04'
        '98f21ed043ea0dbec9150b54dc45ca7a596828706ccaa4d34b2590b2e90f8555793e9ceaaa6f8bda5b9560c9141395ba280cf08212c2b3ed0ac15fad493604f5'
        '511c4ad9f3be530dc17dd68f2a3387d748dcdb84192d35f296b88f82442224477e2a74b1841ec3f107b39a5c41c2d961480e396a48d0578f8fd5f65dbe8d9f04'
        'b425e7b3d48de694114dfdf378e66175b1ef32cb773be2506813ace8a6dfd1035e7d10c30efb6791df2ae920bdec3aa7cb862ed93bac4cde713c549bd896d1b2'
        'd5bea0cfc2e6d3d1749c65440ca911533d41b6f8117fe09e9efec23524637cfa823d230303a7fbb45d3cd251bf8036d48b9b21049ced208f7ed191fcbd75e879')
validpgpkeys=(66D0387DB85D320F8408166DB175CFA98F192AF2)  # Serge Hallyn <sergeh@kernel.org>

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
    --without-libbsd  # shadow can use internal implementation for getting passphrase
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

  # manually add PAM config for chpasswd and newusers: https://github.com/shadow-maint/shadow/issues/810
  install -vDm 644 etc/pam.d/{chpasswd,newusers} -t "$pkgdir/etc/pam.d/"
}
