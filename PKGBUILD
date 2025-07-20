# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh
pkgver=10.0p1
pkgrel=4
pkgdesc="SSH protocol implementation for remote login, command execution and file transfer"
arch=(x86_64)
url='https://www.openssh.com/portable.html'
license=(
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
  99-artixlinux.conf
  $pkgname.tmpfiles
  sshd.pam
)
sha256sums=('021a2e709a0edf4250b1256bd5a9e500411a90dddabea830ed59cef90eb9d85c'
            'SKIP'
            '907a6b8012214218d2bc505fded0fde6cbf7aa863cce630048e1c9b4c9189e48'
            '96735b6bde1339e6f456c4184b66c2dd2f59675335f6f401beed9195995a8a9b'
            '633e24cbfcb045ba777d3e06d5f85dfaa06d44f4727d38c7fb2187c57498221d')
b2sums=('4ce353adf75aade8f4b2a223ad13e2f92cd23d1e60b4ee52bad0eaf036571229438cd9760dfa99c0e10fa09a8ac47b2bfb04eb183fb7b9287ac564ec75316a75'
        'SKIP'
        '3d195606c6ca9d254ccecad974f1e729e338c160861ba52d9e2d0f07b297618f11b93049085df960a4d06106d54d90b9a92521efa5a9a08ea7f52d0512942e68'
        '5d8e61300ab9771b240f06e62a1191d9b316dd474dd43aafd596e008c8e73b92748deef110059f1bd7fae6844b30c87d005f15666297fed29aa6e95955c7fcaa'
        '1d24cc029eccf71cee54dda84371cf9aa8d805433e751575ab237df654055dd869024b50facd8b73390717e63100c76bca28b493e0c8be9791c76a2e0d60990a')
validpgpkeys=('7168B983815A5EEF59A4ADFD2A3F414E736060BA')  # Damien Miller <djm@mindrot.org>

prepare() {
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

  install -Dm755 contrib/findssl.sh -t "$pkgdir"/usr/bin/
  install -Dm755 contrib/ssh-copy-id -t "$pkgdir"/usr/bin/
  install -Dm644 contrib/ssh-copy-id.1 -t "$pkgdir"/usr/share/man/man1/
}

# vim: ts=2 sw=2 et:
