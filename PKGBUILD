# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh
pkgver=10.1p1
pkgrel=2
pkgdesc="SSH protocol implementation for remote login, command execution and file transfer"
arch=(x86_64)
url='https://www.openssh.com/portable.html'
license=(
  0BSD
  BSD-2-Clause
  BSD-3-Clause
  ISC
  LicenseRef-Public-Domain
  MIT
)
depends=(
  glibc
)
makedepends=(
  krb5
  libedit
  libfido2
  libxcrypt
  linux-headers
  openssl
  pam
  zlib
)
optdepends=(
  'libfido2: FIDO/U2F support'
  'sh: for ssh-copy-id and findssl.sh'
  'x11-ssh-askpass: input passphrase in X'
  'xorg-xauth: X11 forwarding'
)
backup=(
  etc/pam.d/sshd
  etc/ssh/ssh_config
  etc/ssh/sshd_config
)
source=(
  https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/$pkgname-$pkgver.tar.gz{,.asc}
  $pkgname-10.1p1-dont-reuse-c-isatty.patch::https://github.com/openssh/openssh-portable/commit/beae06f56e0d0a66ca535896149d5fb0b2e8a1b4.patch
  99-artixlinux.conf
  $pkgname.tmpfiles
  sshd.pam
  LICENSE
)
sha256sums=('b9fc7a2b82579467a6f2f43e4a81c8e1dfda614ddb4f9b255aafd7020bbf0758'
            'SKIP'
            '832e1df5ecdf6f7af58d3766884e41a207e7c75169997e6f41d2147bf2c01e5c'
            '907a6b8012214218d2bc505fded0fde6cbf7aa863cce630048e1c9b4c9189e48'
            '96735b6bde1339e6f456c4184b66c2dd2f59675335f6f401beed9195995a8a9b'
            '633e24cbfcb045ba777d3e06d5f85dfaa06d44f4727d38c7fb2187c57498221d'
            '7056c04df17a4e0f0bac9f787f347c9cd892cee6323d1c89528090afd0b934a3')
b2sums=('08864c9302935cde87eec9d736a90b0bcf23220349bf77cc177459715c567b6178722e9e5d8eea3d55eddb49fef09c187e0895e72236aede397e67674e10cd31'
        'SKIP'
        '717d2250ba8352a82f3f7226e30f72998c94fe35e3c1111e0371fc06673a8bf98c2610a5b5aa1bef91cbc8d18463914855e954fa459f78375009fc001a53fb8f'
        '3d195606c6ca9d254ccecad974f1e729e338c160861ba52d9e2d0f07b297618f11b93049085df960a4d06106d54d90b9a92521efa5a9a08ea7f52d0512942e68'
        '5d8e61300ab9771b240f06e62a1191d9b316dd474dd43aafd596e008c8e73b92748deef110059f1bd7fae6844b30c87d005f15666297fed29aa6e95955c7fcaa'
        '1d24cc029eccf71cee54dda84371cf9aa8d805433e751575ab237df654055dd869024b50facd8b73390717e63100c76bca28b493e0c8be9791c76a2e0d60990a'
        'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')
validpgpkeys=('7168B983815A5EEF59A4ADFD2A3F414E736060BA')  # Damien Miller <djm@mindrot.org>

prepare() {
  # Fix issue with remote TTY detection: https://gitlab.archlinux.org/archlinux/packaging/packages/openssh/-/issues/20
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-10.1p1-dont-reuse-c-isatty.patch

  cd $pkgname-$pkgver
  # remove variable (but useless) first line in config (related to upstream VCS)
  sed '/^#.*\$.*\$$/d' -i ssh{,d}_config

  # prepend configuration option to include drop-in configuration files for sshd_config
  printf "# Include drop-in configurations\nInclude /etc/ssh/sshd_config.d/*.conf\n" | cat - sshd_config > sshd_config.tmp
  mv -v sshd_config.tmp sshd_config
  # prepend configuration option to include drop-in configuration files for ssh_config
  printf "# Include drop-in configurations\nInclude /etc/ssh/ssh_config.d/*.conf\n" | cat - ssh_config > ssh_config.tmp
  mv -v ssh_config.tmp ssh_config

  # extract separate licenses
  sed -n '89,113p' LICENCE > ../rijndael.Public-Domain.txt
  sed -n '116,145p' LICENCE > ../ssh.BSD-3-Clause.txt
  sed -n '148,209p' LICENCE > ../BSD-2-Clause.txt
  sed -n '213,218p' LICENCE > ../snprintf.Public-Domain.txt
  sed -n '222,258p' LICENCE > ../openbsd-compat.BSD-3-Clause.txt
  sed -n '260,278p' LICENCE > ../openbsd-compat.ISC.txt
  sed -n '280,308p' LICENCE > ../openbsd-compat.MIT.txt
  sed -n '280,308p' LICENCE > ../openbsd-compat.MIT.txt
  sed -n '310,338p' LICENCE > ../blowfish.BSD-3-Clause.txt
  sed -n '340,368p' LICENCE > ../replacement.BSD-2-Clause.txt
}

build() {
  local configure_options=(
    --disable-lastlog
    --disable-strip
    --libexecdir=/usr/lib/ssh
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir=/etc/ssh
    --with-default-path='/usr/local/sbin:/usr/local/bin:/usr/bin'
    --with-kerberos5=/usr
    --with-libedit
    --with-pam
    --with-pid-dir=/run
    --with-privsep-path=/usr/share/empty.sshd
    --with-privsep-user=nobody
    --with-security-key-builtin
    --with-ssl-engine
    --with-xauth=/usr/bin/xauth
    --without-zlib-version-check
  )

  cd $pkgname-$pkgver

  ./configure "${configure_options[@]}"
  make
}

check() {
  # NOTE: make t-exec does not work in our build environment
  make file-tests interop-tests unit -C $pkgname-$pkgver
}

package() {
  depends+=(
    krb5 libkrb5.so libgssapi_krb5.so
    libedit libedit.so
    libxcrypt libcrypt.so
    openssl libcrypto.so
    pam libpam.so
    zlib libz.so
  )

  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -vDm 644 ../99-artixlinux.conf -t "$pkgdir/etc/ssh/sshd_config.d/"
  install -vdm 755 "$pkgdir/etc/ssh/ssh_config.d"

  install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 ../*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm644 ../sshd.pam "$pkgdir"/etc/pam.d/sshd

  # factory files
  install -Dm644 ../sshd.pam "$pkgdir"/usr/share/factory/etc/pam.d/sshd
  install -Dm644 "$pkgdir/etc/ssh/moduli" -t "$pkgdir"/usr/share/factory/etc/ssh/
  install -Dm644 "$pkgdir/etc/ssh/ssh_config" -t "$pkgdir"/usr/share/factory/etc/ssh/
  install -Dm644 "$pkgdir/etc/ssh/sshd_config" -t "$pkgdir"/usr/share/factory/etc/ssh/
  install -vDm 644 ../99-artixlinux.conf -t "$pkgdir/usr/share/factory/etc/ssh/sshd_config.d/"

  install -vDm 644 ../$pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -vDm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/0BSD.txt"

  install -Dm755 contrib/findssl.sh -t "$pkgdir"/usr/bin/
  install -Dm755 contrib/ssh-copy-id -t "$pkgdir"/usr/bin/
  install -Dm644 contrib/ssh-copy-id.1 -t "$pkgdir"/usr/share/man/man1/
}

# vim: ts=2 sw=2 et:
