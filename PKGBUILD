# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=shadow
pkgver=4.19.4.artix1
_pkgver=4.19.4.arch1
_upstream_tag=${_pkgver%.*}
_dist_tag=${pkgver%.*}-arch${_pkgver#*.arch}
pkgrel=1
pkgdesc="Password and account management tool suite with support for shadow files and PAM"
arch=(x86_64)
url="https://github.com/shadow-maint/shadow"
license=(
  0BSD
  BSD-3-Clause
)
depends=(
  glibc
)
makedepends=(
  acl
  audit
  docbook-xsl
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
  etc/pam.d/newusers
  etc/pam.d/passwd
)
options=(!emptydirs)
# NOTE: distribution patches are taken from https://gitlab.archlinux.org/archlinux/packaging/upstream/shadow/
source=(
  git+$url.git?signed#tag=${_upstream_tag}
  https://gitlab.archlinux.org/archlinux/packaging/upstream/shadow/-/releases/${_dist_tag}/downloads/$pkgname-${_dist_tag}.patch.{sig,zst}
  useradd.defaults
  LICENSE
)
sha512sums=('56a02c3a86344ed06727588374a3989833e3b8e8fec142d29cd2c013eea5a6dd8d735ee9c31092d24e04d7712837e14d6e8909846512db2e91c6d46117fc33e4'
            'SKIP'
            '16453800b738476732e1aead1cbfe77a8f17582e612247c55007e6b188470b8362b34b81b318ad1725c9527da7088c71490a08953fcbcafcb8fd34545787e097'
            '706ba6e7fa8298475f2605a28daffef421c9fa8d269cbd5cbcf7f7cb795b40a24d52c20e8d0b73e29e6cd35cd7226b3e9738dc513703e87dde04c1d24087a69c'
            'a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')
b2sums=('e0eda3c7295ba6a1d969e053d6c59e18f10f283be8868ab668379969090fd34d866ddb030caaadcbf3025b103c44b1af8fd237df298f61e4e1f98403476ddd42'
        'SKIP'
        '82a13c7d847894ee013ab63b7f178969b576268e37094ed482fdd90e6df90301098a6e38cc6d3645b0eefef56a0a5060d97fae0e027f2948d68ba3222e946f32'
        'f743922062494fe342036b3acb8b747429eb33b1a13aa150daa4bb71a84e9c570cfcc8527a5f846e3ea7020e6f23c0b10d78cf2ba8363eea0224e4c34ea10161'
        'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')
validpgpkeys=(
  66D0387DB85D320F8408166DB175CFA98F192AF2  # Serge Hallyn <sergeh@kernel.org>
  A9348594CE31283A826FBDD8D57633D441E25BB5  # Alejandro Colomar <alx@kernel.org>
  991F6E3F0765CF6295888586139B09DA5BF0D338  # David Runge <dvzrv@archlinux.org>
)

prepare() {
  cd $pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
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
    --with-libpam  # PAM integration for chpasswd, newusers, passwd
    --with-yescrypt
    --without-bcrypt
    --without-libbsd  # shadow can use internal implementation for getting passphrase
    --without-nscd  # we do not ship nscd anymore
    --without-selinux
    --without-su  # su is provided by util-linux
    --disable-logind
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
    audit libaudit.so
    libxcrypt libcrypt.so
    pam libpam.so libpam_misc.so
  )

  cd $pkgname

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C man install

  # license
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/0BSD.txt"

  # custom useradd(8) defaults (not provided by upstream)
  install -vDm 600 ../useradd.defaults "$pkgdir/etc/default/useradd"
}
