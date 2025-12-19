# Maintainer: David Runge <dvzrv@archlinux.org>

_name=mailman
pkgname=mailman3
pkgver=3.3.10
pkgrel=7
pkgdesc="The GNU mailing list manager"
arch=(any)
url="https://www.list.org/"
license=(GPL-3.0-or-later)
depends=(
  gunicorn
  python
  python-aiosmtpd
  python-alembic
  python-atpublic
  python-authheaders
  python-authres
  python-click
  python-dateutil
  python-dnspython
  python-falcon
  python-flufl.bounce
  python-flufl.i18n
  python-flufl-lock
  python-lazr.config
  python-passlib
  python-requests
  'python-sqlalchemy>=1.4'
  python-zope-component
  python-zope-configuration
  python-zope-event
  python-zope-interface
  python-nntplib
)
makedepends=(
  git
  python-build
  python-installer
  python-pdm-backend
)
checkdepends=(
  python-nose2
  python-psycopg2
  python-pymysql
  python-pytest
)
optdepends=(
  'hyperkitty: for local archive and list interaction'
  'lynx: for the default HTML to plaintext conversion'
  'mailman3-hyperkitty: for archiving mails with an instance of hyperkitty'
  'postorius: for local configuration interaction'
  'python-mailmanclient: for programmatically interfacing the mailman REST API locally'
  'python-psycopg2: for PostgreSQL support'
  'python-pymysql: for MySQL support'
  'smtp-server: for using a local mail server'
)
conflicts=(mailman)
replaces=(mailman-core)
backup=(etc/mailman.cfg)
source=(
  $pkgname::git+https://gitlab.com/$_name/$_name?signed#tag=v$pkgver
  $pkgname-3.3.10-stop-modifying-cc-header.patch
  $pkgname.sysusers
  $pkgname.tmpfiles
)
sha512sums=('923ae08b99657bf0ea626afc81e97e96e9ccc5b437a9f71a0d91549a3eac2544dfcb60c5a89ce22f2ce251c1a9bcbff6743610ad137d33ace9b4a06999739ce3'
            '63f636acc93cf9605db16e92e6bb6836075109ae746953cbed40a64758cb6b2802d3e8948deac512d7cccc2cd4bd793f53da9477fc23d666860bc793058cb07d'
            'e65090ac5988feb6ec28293f7ee4762e9d4ea9784d69554a0d4a65b24a079dc3b3faec537c0070f7e055c0fa03309f067d26e347190a41b21afc48847ef64379'
            '6f4b51fd5eb34ac974b3312c34eb1437d9435cfd50f0cb89db02b94ce514bceca2c6dc7cb172b79b2d6a23d68e7ea391ec58dbd9899938c0fe88c03c67c521b9')
b2sums=('513404b857ee26d19f8f4c3883cf9eb9d1494377f4c33b88302b7d5ec9f522901481ee0137a036bac2adbee88c66a866757495774a3fe8e388eba7fec50f000e'
        '2faa6486e6cd040e442378c377a316ebfc691ab3d209ac6f3c949693b8af51834fcb78086c403c5516874530d15b0fabe5adba8e3011673bba21f5b93b5d5437'
        '4443bbcdb1f0ae5a223139bfdf5f9434293dd21436c28c172b0588728a92db7120e96cddf75c56af0b02b874640e49e4777c8c8c371ad330c866939805dc309f'
        '461dce577696405011ed89f7fc109caaf27f4183b4d315baa8ad03db0f12015ebc447cbe9c0b8c5bcba38b63fcaf45adcfcb3e5bf5afb7eb0bd87a2e1b0301e5')
validpgpkeys=('541EA0448453394FF77A0ECC9D9B2BA061D0A67C') # Abhilash Raj <maxking@asynchronous.in>

prepare() {
  cd $pkgname
  # make sure that mailman runs in a FHS compliant way
  printf "[mailman]\nlayout: fhs\n" >> ../$_name.cfg
  # set /var/lib/mailman instead of /var/tmp/mailman as default var_dir:
  sed -e 's|/var/tmp/mailman|/var/lib/mailman|g' -i src/$_name/config/schema.cfg
  # fix use of PosixPath with >= Python 3.13: https://gitlab.com/mailman/mailman/-/merge_requests/1309
  git cherry-pick -n 685d9a7bdbd382d9e8d4a2da74bd973e93356e05
  # stop modifying the CC header as it breaks DKIM: https://gitlab.com/mailman/mailman/-/merge_requests/1039
  git apply ../$pkgname-3.3.10-stop-modifying-cc-header.patch
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  # thanks to test design it is impossible to run tests:
  # https://gitlab.com/mailman/mailman/-/issues/400
  # nose2 -v
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  # config
  install -vDm 640 ../$_name.cfg -t "$pkgdir/etc/"
  # state dir
  install -vdm 750 "$pkgdir/var/lib/mailman"
  # sysusers.d
  install -vDm 644 ../$pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  # tmpfiles.d
  install -vDm 644 ../$pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
