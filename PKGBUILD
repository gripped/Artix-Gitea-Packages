# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh
pkgver=10.2p1
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
  99-artixlinux.conf
  $pkgname.tmpfiles
  sshd.pam
  LICENSE
  $pkgname-10.2p1-error-to-debug-pkcs11_fetch_certs.patch::https://github.com/openssh/openssh-portable/commit/607f337637f2077b34a9f6f96fc24237255fe175.patch
  $pkgname-10.2p1-pinentry-pkcs11provider.patch::https://github.com/openssh/openssh-portable/commit/434ba7684054c0637ce8f2486aaacafe65d9b8aa.patch
)
sha256sums=('ccc42c0419937959263fa1dbd16dafc18c56b984c03562d2937ce56a60f798b2'
            'SKIP'
            '907a6b8012214218d2bc505fded0fde6cbf7aa863cce630048e1c9b4c9189e48'
            '96735b6bde1339e6f456c4184b66c2dd2f59675335f6f401beed9195995a8a9b'
            '633e24cbfcb045ba777d3e06d5f85dfaa06d44f4727d38c7fb2187c57498221d'
            '7056c04df17a4e0f0bac9f787f347c9cd892cee6323d1c89528090afd0b934a3'
            '8a059f4895a9da4a2425425a1f1be1a2ee790b52626b412db8987fa6772a9a22'
            '35b019c4af919d068ec444774273db7af0009ffb8615f66db90e337710382a80')
b2sums=('8c031b10b1642e21b46f7d1db84ba42692e378a54af3d8e5b5c8706c3a0a06d442a02ed8803063121e7ff325ea275cad4432b9eaa6a7f47a4d7cfad504953ab6'
        'SKIP'
        '3d195606c6ca9d254ccecad974f1e729e338c160861ba52d9e2d0f07b297618f11b93049085df960a4d06106d54d90b9a92521efa5a9a08ea7f52d0512942e68'
        '5d8e61300ab9771b240f06e62a1191d9b316dd474dd43aafd596e008c8e73b92748deef110059f1bd7fae6844b30c87d005f15666297fed29aa6e95955c7fcaa'
        '1d24cc029eccf71cee54dda84371cf9aa8d805433e751575ab237df654055dd869024b50facd8b73390717e63100c76bca28b493e0c8be9791c76a2e0d60990a'
        'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101'
        '72c4115bee487869bed7a543817c9ab3e3e17c2c884446314f9f4828cf6ce46c759bbf7dfae9194612931e2ead1ae9e4e52bdbe750bfcb22dfe5583b8168a379'
        '88a62f93d6a7a58c0f170333cd279d339342a898d51cdd5aeb1488bee53cc5d7cf6f0468a2f9b098b8f7977cd4cf81ad706a12942b6dac33b3fa5406592f6963')
validpgpkeys=('7168B983815A5EEF59A4ADFD2A3F414E736060BA')  # Damien Miller <djm@mindrot.org>

prepare() {
  # Fix an issue with PKCS#11 provided keys: https://gitlab.archlinux.org/archlinux/packaging/packages/openssh/-/issues/23
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-10.2p1-error-to-debug-pkcs11_fetch_certs.patch
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-10.2p1-pinentry-pkcs11provider.patch

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
