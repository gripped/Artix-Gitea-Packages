# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh
pkgver=9.6p1
pkgrel=1
pkgdesc="SSH protocol implementation for remote login, command execution and file transfer"
arch=(x86_64)
url='https://www.openssh.com/portable.html'
license=(
  BSD-2-Clause
  BSD-3-Clause
  ISC
  MIT
)
depends=(
  glibc
  krb5 libkrb5.so libgssapi_krb5.so
  ldns
  libedit
  libxcrypt libcrypt.so
  openssl
  pam libpam.so
  zlib
)
makedepends=(
  libfido2
  linux-headers
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
  sshd.conf
  sshd.pam
)
sha256sums=('910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c'
            'SKIP'
            '78b806c38bc1e246daaa941bfe7880e6eb6f53f093bea5d5868525ae6d223d30'
            '76635a91526ce44571485e292e3a777ded6a439af78cb93514b999f91fb9b327'
            '633e24cbfcb045ba777d3e06d5f85dfaa06d44f4727d38c7fb2187c57498221d')
b2sums=('dd7f6747fe89f7b386be4faaf7fc43398a9bf439e45608ae61c2126cf8743c64ef7b5af45c75e9007b0bda525f8809261ca0f2fc47ce60177ba769a5324719dd'
        'SKIP'
        '1ff8cd4ae22efed2b4260f1e518de919c4b290be4e0b5edbc8e2225ffe63788678d1961e6f863b85974c4697428ee827bcbabad371cfc91cc8b36eae9402eb97'
        'a3fd8f00430168f03dcbc4a5768ed788dd43140e365a882b601510f53f69704da04f24660157bb8a43125f5389528993732d99569d77d5f3358074e7ae36d4ca'
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
}

build() {
  local configure_options=(
    --prefix=/usr
    --sbindir=/usr/bin
    --libexecdir=/usr/lib/ssh
    --sysconfdir=/etc/ssh
    --disable-strip
    --with-ldns
    --with-libedit
    --with-security-key-builtin
    --with-ssl-engine
    --with-pam
    --with-privsep-user=nobody
    --with-kerberos5=/usr
    --with-xauth=/usr/bin/xauth
    --with-pid-dir=/run
    --with-default-path='/usr/local/sbin:/usr/local/bin:/usr/bin'
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
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -vDm 644 ../99-artixlinux.conf -t "$pkgdir/etc/ssh/sshd_config.d/"
  install -vdm 755 "$pkgdir/etc/ssh/ssh_config.d"

  ln -sf ssh.1.gz "$pkgdir"/usr/share/man/man1/slogin.1.gz
  install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm644 ../sshd.conf -t "$pkgdir"/usr/lib/tmpfiles.d/
  install -Dm644 ../sshd.pam "$pkgdir"/etc/pam.d/sshd

  install -Dm755 contrib/findssl.sh -t "$pkgdir"/usr/bin/
  install -Dm755 contrib/ssh-copy-id -t "$pkgdir"/usr/bin/
  install -Dm644 contrib/ssh-copy-id.1 -t "$pkgdir"/usr/share/man/man1/
}

# vim: ts=2 sw=2 et:
