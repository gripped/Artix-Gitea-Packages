# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: michalzxc
# Contributor: nbags <neilbags@gmail.com>

pkgname=fail2ban
pkgver=1.0.2
pkgrel=6
pkgdesc='Bans IPs after too many failed authentication attempts'
arch=('any')
url='https://www.fail2ban.org/'
license=('GPL')
depends=('python-pyinotify' 'sqlite' 'whois')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'firewalld: for a firewall backend'
  'ipset: for a firewall backend'
  'iptables: for a firewall backend'
  'nftables: for a firewall backend'
)
backup=(
  'etc/fail2ban/fail2ban.conf'
  'etc/fail2ban/jail.conf'
  'etc/logrotate.d/fail2ban'
)
source=("git+https://github.com/$pkgname/$pkgname.git#tag=$pkgver?signed")
b2sums=('48478252ac6fcbb6581dfa1237f577e42387fa4c4c93b60b1b39ee6015e922edece6cc1afcce79d476d2bad85b8a0de976f03e57bec3a9ba26894fafef6773ff')
validpgpkeys=('E6C3F631FBDA716B070C6ED94141C485A81A88CB') # Sergey G. Brester (sebres) <serg.brester@sebres.de>

prepare() {
  cd $pkgname
  sed -i 's|self.install_dir|"/usr/bin"|' setup.py
  sed -i 's/^before = paths-debian.conf/before = paths-arch.conf/' config/jail.conf

  # Python 3.12 support https://github.com/fail2ban/fail2ban/issues/3487
  git cherry-pick --no-commit 054e1d89ca3fa8b767ee21db1a3368f3d890baa8
  # Fix testRepairDb for sqlite >= 3.42 https://github.com/fail2ban/fail2ban/issues/3586
  git cherry-pick --no-commit cabcc9b3f49e59e57c3909ec83de74bab9911f7f
}

build() {
  cd $pkgname
  ./fail2ban-2to3
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  # Imports smtpd module that was removed in Python 3.12.
  # aiosmptd is now used in master, but the changes do not cleanly backport
  ./bin/fail2ban-testcases --ignore unittest.loader._FailedTest.test_smtp
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 files/fail2ban-tmpfiles.conf \
    "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
  install -Dm644 files/fail2ban-logrotate \
    "$pkgdir"/etc/logrotate.d/fail2ban
  install -Dm644 files/bash-completion \
    "$pkgdir"/usr/share/bash-completion/completions/fail2ban

  install -Dm644 -t "$pkgdir"/usr/share/man/man1 man/*.1
  install -Dm644 -t "$pkgdir"/usr/share/man/man5 man/*.5


  cd "$pkgdir"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cp -rl ./"$site_packages"/{etc,usr} .
  rm -r ./"$site_packages"/{etc,usr}

  # fix sendmail location
  sed -i 's/sbin/bin/g' etc/fail2ban/action.d/sendmail*.conf
}
