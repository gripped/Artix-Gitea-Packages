# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Valentin Hăloiu <vially.ichb+aur@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Kevin Zuber <uKev@knet.eu>
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>
# Contributor: David Runge <dave@sleepmap.de>

pkgbase=uwsgi
pkgname=(
  uwsgi
  uwsgi-plugin-rack
  uwsgi-plugin-psgi
  uwsgi-plugin-cgi
  uwsgi-plugin-python
  uwsgi-plugin-pypy
  uwsgi-plugin-php
  uwsgi-plugin-php-legacy
  uwsgi-plugin-lua51
  uwsgi-plugin-mono
  uwsgi-plugin-webdav
  uwsgi-plugin-zabbix
  uwsgi-plugin-notfound
)
pkgver=2.0.31
pkgrel=3
pkgdesc="A full stack for building hosting services"
arch=(x86_64)
url="https://uwsgi-docs.readthedocs.io/en/latest/"
license=(LicenseRef-GPL-2.0-or-later-with-linking-exception)
makedepends=(
  jansson
  libcap
  libxcrypt
  libxml2
  lua51
  mono
  openssl
  pam
  pcre2
  perl
  php-embed
  php-legacy-embed
  pypy
  python
  python-gevent
  python-greenlet
  ruby
  util-linux
  zlib
)
source=(
  $pkgbase-$pkgver.tar.gz::https://github.com/unbit/$pkgbase/archive/refs/tags/$pkgver.tar.gz
  archlinux.ini
  emperor.ini
  uwsgi.logrotate
  uwsgi.sysusers
  uwsgi.tmpfiles
)
sha512sums=('d4d327f36455438e165298cb5a7d483c951f4acd3d834b46ceeda105bd3664792ead226b02e06db62e92c210544778119bf75a55d9d4f30f8fba896c7de51e6d'
            '3045b54799f11bf19959ed0858c15ba9e208bdd88e41b879766585314c506a7396f3fd030c34c2e3ef821d6c32262ec87c4c4be33cd2cd4e9591b982e7386cc6'
            'd54c84838ddb2f389e115ebb81aa2583705c9e330f020e6583b496f9c271ed236b6820c2a065f2b55a79adbf13e262b9ff2428124a8044b8fa20ca29ca4930ac'
            '937878372aa1556f6ba62ad7148d1681288c94d6cff609368a9e861dd4d4524330006a08ae5993441f7d3101170e3a0a681a4c8b3c2c13b364b8b1f81cf25117'
            '1841897037474ab0c4e80f2331cbc68e8e46282ed31341cda4799c1a7f7e9a17c716c558389f0031816f89d88f525afced3375882e6f44b5a74d5bd4a9b2c8a6'
            '4def9dcd06cfc2c6ce554add9d9545a01f3bb2681f0a2a6fc4ba68f91011111803a955cc41b5e70832ca448b196109368fdf874e81b7ec0edee4b51f864e16f7')
b2sums=('dd2d8b7d3b2293fb2f4ae587862b107238e5b8b4fbd9953a5de52b41329f3895609fe98f8476603d1f5e3f209d490cc5fa46a43cfb7d2b046c22bbddf55236b2'
        '6fd3a196b15d0c40200fbf0c4be70d1ba53bd838a26c864c0ff76f8698318f97cd4f9b378dd4db9b1368c080a2d659d2d1845b31f4396066d14976591d1f1b46'
        '835a1036422e9821cd52ffdf5a6053bdd59fc700d473600bda60b6730746f6c0750c30c85f4139d3ea81c6b6dd10d6849f9406decee3179861c51aca90da6161'
        'a8b7d003f66ed5c5b1b60d57c05339af3dcdcf346eab52760810086e17f6936dd29ed7fd26281657bc86ac6721c989cbfbaa8e81f97111c807bcd06baece3bf2'
        '62f21d02aed75b2343e41ba61f6825e6cde97df66b3041a69a3d18bf76af9d58862c546890f473c759e7a5a928b431bc83bd8ee99e5af134b4ba15d4366c6882'
        '9759827f7619358383bf0e68c955522c0054620f742f5122a59888fadfc0bc20bd587eab7a77bc73e8ee4d20cf8f02625c07f241462e8ab9c08f5af509daaef3')

prepare() {
  cd $pkgbase-$pkgver

  # fix default lua pkgconfig name
  sed -e 's/lua5.1/lua51/' -i plugins/lua/uwsgiplugin.py
  # move ruby plugin to new location and fix its name
  mv plugins/ruby{19,}
  sed -e 's/ruby19/ruby/' -i plugins/ruby/uwsgiplugin.py
  # duplicate the php plugin, so that we can modify it
  cp -av plugins/php{,_legacy}
  # link the php_legacy plugin against libphp-legacy.so
  sed -e 's/lphp/lphp-legacy/g; s/UWSGICONFIG_PHPPATH/UWSGICONFIG_PHP_LEGACY_PATH/g; s/NAME=.*/NAME="php_legacy"/g' -i plugins/php_legacy/uwsgiplugin.py
  sed -e 's/php_plugin/php_legacy_plugin/g' -i plugins/php_legacy/php_plugin.c
  # copy our custom build profile into place
  cp -v ../archlinux.ini buildconf/
}

build() {
  cd $pkgbase-$pkgver
  export UWSGICONFIG_PHP_LEGACY_PATH='php-config-legacy'
  python uwsgiconfig.py --verbose --build archlinux
}

package_uwsgi() {
  depends=(
    glibc
    jansson
    libcap libcap.so
    libxcrypt libcrypt.so
    libxml2
    openssl
    pam libpam.so
    pcre2
    util-linux-libs libuuid.so
    zlib
  )
  backup=('etc/uwsgi/emperor.ini')

  cd $pkgbase-$pkgver
  install -vDm 755 "${pkgbase}" -t "$pkgdir/usr/bin/"
  install -vDm 644 ../emperor.ini -t "$pkgdir"/etc/uwsgi/
  install -vDm 644 ../uwsgi.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/uwsgi.conf
  install -vDm 644 ../uwsgi.logrotate "$pkgdir"/etc/logrotate.d/uwsgi
  install -vDm 644 ../uwsgi.sysusers "$pkgdir"/usr/lib/sysusers.d/uwsgi.conf
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_uwsgi-plugin-cgi() {
  pkgdesc+=" (CGI plugin)"
  depends=(
    glibc
    uwsgi
  )

  cd $pkgbase-$pkgver
  install -vDm 755 cgi_plugin.so -t "$pkgdir"/usr/lib/uwsgi/
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_uwsgi-plugin-rack() {
  depends=(
    glibc
    ruby
    uwsgi
  )
  pkgdesc="Ruby rack plugin"

  cd $pkgbase-$pkgver
  install -vDm 755 {rack,fiber,rbthreads}_plugin.so -t "$pkgdir"/usr/lib/uwsgi/
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_uwsgi-plugin-psgi() {
  pkgdesc+=" (Perl psgi plugin)"
  depends=(
    glibc
    perl
    uwsgi
  )

  cd $pkgbase-$pkgver
  install -vDm 755 psgi_plugin.so -t "$pkgdir"/usr/lib/uwsgi/
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_uwsgi-plugin-python() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  pkgdesc+=" (Python plugin)"
  depends=(
    glibc
    python
    python-gevent
    python-greenlet
    uwsgi
  )

  cd $pkgbase-$pkgver
  install -vDm 755 {asyncio,gevent,greenlet,python}_plugin.so -t "$pkgdir"/usr/lib/uwsgi/
  install -vDm 644 uwsgidecorators.py -t "${pkgdir}${site_packages}"
  python -m compileall "${pkgdir}${site_packages}"
  python -O -m compileall "${pkgdir}${site_packages}"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_uwsgi-plugin-pypy() {
  pkgdesc+=" (PyPy plugin)"
  depends=(
    glibc
    pypy
    uwsgi
  )

  cd $pkgbase-$pkgver
  install -vDm 755 pypy_plugin.so -t "$pkgdir"/usr/lib/uwsgi/
  install -vDm 644 uwsgidecorators.py -t "$pkgdir"/opt/pypy/site-packages/
  pypy -m compileall "$pkgdir"/opt/pypy/site-packages/
  pypy -O -m compileall "$pkgdir"/opt/pypy/site-packages/
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_uwsgi-plugin-lua51() {
  pkgdesc+=" (LUA plugin)"
  depends=(
    glibc
    lua51
    uwsgi
  )

  cd $pkgbase-$pkgver
  install -vDm 755 lua_plugin.so -t "$pkgdir"/usr/lib/uwsgi/
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_uwsgi-plugin-php() {
  pkgdesc+=" (PHP plugin)"
  depends=(
    glibc
    php-embed
    uwsgi
  )

  cd $pkgbase-$pkgver
  install -vDm 755 php_plugin.so -t "$pkgdir"/usr/lib/uwsgi/
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_uwsgi-plugin-php-legacy() {
  pkgdesc+=" (PHP Legacy plugin)"
  depends=(
    glibc
    php-legacy-embed
    uwsgi
  )

  cd $pkgbase-$pkgver
  install -vDm 755 php_legacy_plugin.so -t "$pkgdir"/usr/lib/uwsgi/
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_uwsgi-plugin-mono() {
  pkgdesc+=" (mono plugin)"
  depends=(
    glibc
    mono
    uwsgi
  )

  cd $pkgbase-$pkgver
  install -vDm 755 plugins/mono/uwsgi.dll -t "$pkgdir"/usr/lib/mono/2.0/
  install -vDm 755 mono_plugin.so -t "$pkgdir"/usr/lib/uwsgi/
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_uwsgi-plugin-webdav() {
  pkgdesc+=" (WebDav plugin)"
  depends=(
    glibc
    libxml2
    uwsgi
  )

  cd $pkgbase-$pkgver
  install -vDm 755 webdav_plugin.so -t "$pkgdir"/usr/lib/uwsgi/
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_uwsgi-plugin-zabbix() {
  pkgdesc+=" (zabbix plugin)"
  depends=(
    glibc
    uwsgi
  )

  cd $pkgbase-$pkgver
  install -vDm 755 zabbix_plugin.so -t "$pkgdir"/usr/lib/uwsgi/
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_uwsgi-plugin-notfound() {
  pkgdesc+=" (notfound plugin)"
  depends=(uwsgi)

  cd $pkgbase-$pkgver
  install -vDm 755 notfound_plugin.so -t "$pkgdir"/usr/lib/uwsgi/
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
