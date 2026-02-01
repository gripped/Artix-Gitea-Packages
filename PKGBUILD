# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=inetutils
pkgver=2.7
pkgrel=2
pkgdesc="A collection of common network programs"
arch=('x86_64')
url="https://www.gnu.org/software/inetutils/"
license=('GPL-3.0-or-later')
depends=('glibc' 'pam' 'libcap' 'readline' 'ncurses' 'libxcrypt'
	     libpam.so libcrypt.so libreadline.so libncursesw.so)
makedepends=('git' 'help2man' 'python')
backup=('etc/pam.d/rlogin' 'etc/pam.d/rsh')
options=('!emptydirs')
install=inetutils.install
source=("git+https://git.savannah.gnu.org/git/inetutils.git#tag=v${pkgver}?signed"
        "git+https://git.savannah.gnu.org/git/gnulib.git"
        'inetutils.sysusers'
        'rlogin.pam'
        'rsh.pam')
sha512sums=('c6559cfc92c6365abda86f22d0eaba63a93e8c2d7ae32ef33d10ca0d5f36b25c99427f4243877ffc180dc645fc3cb1b118b5358fecadfbece22243e02e7f942d'
            'SKIP'
            '00a6ff36efe63612990181f7cb37ea7d43ee7f2b6bda6b1fc23ccb2f3b19da54aabad041c2412936561dcd997f9613bd8144a96f5e04f30135a36f9ac98d8056'
            '432a45af5cd4f9f2dee4b631b45745b734e47cf631553e79db31905fa0839988914bcfed1dfcdd00d2ea6e4029b0674d46623c33ce0bd0678c2628fbaa0d1b25'
            'c957708315ea2d873da55691bb0d0997ee3e2dcb40fb47cef19fd60c25379f1660d0605edd8fb0a477252c5af3e422b44b5e0aaa5b76220dadc90791dd526801')
# GNU Keyring: https://ftp.gnu.org/gnu/gnu-keyring.gpg
validpgpkeys=(
  '4FBD67621082C4C502448E3B180551BAD95A3C35' # Alfred M. Szmidt <ams@gnu.org>
  '9AA9BDB11BB1B99A21285A330664A76954265E8C' # Simon Josefsson <simon@josefsson.org>
  'B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE' # simon@josefsson.org
)

prepare() {
  cd ${pkgname}

  # The inetutils does not have a submodule, that is added on the fly.
  # Giving the path like this should work anyway...
  GNULIB_REFDIR="${srcdir}/gnulib"
  export GNULIB_REFDIR

  git cherry-pick -n \
    fd702c02497b2f398e739e3119bed0b23dd7aa7b \
    ccba9f748aa8d50a38d7748e2e60362edd6a32cc

  sh bootstrap
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure \
    --prefix=/usr \
    --libexec=/usr/bin \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --without-wrap \
    --with-pam \
    --enable-ftp \
    --enable-ftpd \
    --enable-telnet \
    --enable-telnetd \
    --enable-talk \
    --enable-talkd \
    --enable-rlogin \
    --enable-rlogind \
    --enable-rsh \
    --enable-rshd \
    --enable-rcp \
    --enable-hostname \
    --enable-dnsdomainname \
    --disable-rexec \
    --disable-rexecd \
    --disable-tftp \
    --disable-tftpd \
    --disable-ping \
    --disable-ping6 \
    --disable-logger \
    --disable-syslogd \
    --disable-inetd \
    --disable-whois \
    --disable-uucpd \
    --disable-ifconfig \
    --disable-traceroute

  # fix tgetent from curses...
  sed -i '/HAVE_CURSES_TGETENT/c #define HAVE_CURSES_TGETENT 1' config.h
  sed -i '/# include <curses.h>/a # include <term.h>' telnet/telnet.c telnetd/utility.c

  make
}

check() {
  cd ${pkgname}
  make check
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install

  chmod -s "${pkgdir}"/usr/bin/{rcp,rlogin,rsh}

  install -D -m644 "${srcdir}/rlogin.pam" "${pkgdir}/etc/pam.d/rlogin"
  install -D -m644 "${srcdir}/rsh.pam" "${pkgdir}/etc/pam.d/rsh"

  install -vDm 644 ../$pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
