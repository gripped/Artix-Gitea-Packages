# Maintainer: Denis Proskurin <dpvpro // gmail // com>
# Contributor: nous artixlinux org

pkgname=incron-next
pkgver=0.5.17
pkgrel=2
pkgdesc="Like the regular cron but is driven by filesystem events instead of time periods"
arch=('x86_64')
url="https://github.com/dpvpro/incron-next"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'bash')
makedepends=('git')
replaces=(incron)
conflicts=(incron)
provides=(incron)
options=('emptydirs')
source=("git+https://github.com/dpvpro/incron-next"
        "incron.sysusers"
        "incron.tmpfiles")
sha256sums=('SKIP'
            'e5da0a3af368c286fa2b180015c9efc5aef5018c271a16620b8c30bfe6f9ccc2'
            '422c4a715da4037550d2f97de28f47f91d0b58983c188c6cf1d1233370e048a4')

prepare() {
  cd "${srcdir}"/$pkgname
  sed -i 's|$(DESTDIR)$(PREFIX)/sbin/|$(DESTDIR)$(PREFIX)/bin/|g' Makefile
}

build() {
  cd "${srcdir}"/$pkgname
  make CXXFLAGS+=" --std=c++14"
}

package() {
  cd "${srcdir}"/$pkgname

  install -d "${pkgdir}"/usr/share/man "${pkgdir}"/usr/{s,}bin

  make PREFIX="${pkgdir}"/usr \
    MANPATH="${pkgdir}"/usr/share/man \
    USERDATADIR="${pkgdir}"/var/spool/incron \
    INITDIR="${pkgdir}"/etc \
    CFGDIR="${pkgdir}"/etc \
    SYSDATADIR="${pkgdir}"/etc/incron.d install

  install -Dm0644 "${srcdir}/incron.sysusers" "${pkgdir}/usr/lib/sysusers.d/incrond.conf"
  install -Dm0644 "${srcdir}/incron.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/incrond.conf"
  rm -r "$pkgdir"/{usr/sbin,var}
}
