# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgbase=zabbix
pkgname=(zabbix-server zabbix-agent{,2} zabbix-proxy zabbix-frontend-php zabbix-web-service)
pkgver=7.4.0
pkgrel=1
arch=(x86_64)
url='https://www.zabbix.com/'
license=('GPL-2.0-only')
makedepends=(postgresql-libs libxml2 unixodbc net-snmp mariadb-libs libldap libevent go pkgconfig pcre2 openipmi)
source=("https://cdn.zabbix.com/zabbix/sources/stable/${pkgver%.*}/zabbix-${pkgver}.tar.gz"
        zabbix-agent.{sysusers,tmpfiles}
        zabbix-server.{sysusers,tmpfiles}
        zabbix-proxy.{sysusers,tmpfiles}
        zabbix-web-service.{sysusers,tmpfiles})

sha512sums=('aee2c06dea0777c54b3f73f0e98a04de139045bedb8b372f38980a426db2b3a3d187e52cc78af682a15d733254807a68b97bb9d90bd2fc821a8f13781a28064d'
            '7a04f644e32f337794d5cba778ad755b6390830b5598ddfbc135fcb1646f63f0b136a484fbd9238634d3bf43d3ff8e5b17f4d34a8079f72b67f5c9985d664f7f'
            'ca6b4779de23829dfdd80ee21e924fbe4e2754f4e693bed4b1a2aa846cd87d150e399b1169d7fe58d30c50ed837c1b8254e580de420267d0a1834d6dc409c43d'
            '50012749cb7c5d7d2f8361a64bcbb10e70f90688b1f55917c0f19b045506427b32b891aac930c2576cae4f6e6da5ab45d3be093399e442e440ffe15aef663a36'
            'b6d548a26f845ef1a39724e3273aa521715272e20a0038144f86d377a26dfec6e3e129404cfda77632cad2f5cd6bab4a33f70a26c8c67b0d0b2abb3678ad2d83'
            'b52ab5099a74d851c2de521230929523fc8a9aa6fea3face9a3b97b24b09e78f2e3ec5c186393bd8d86ab1af3a554b9c01c173beef283551c27ae43b3365bb2c'
            '64042ddf511b56b2a5a311e34643f4e049c09d909ea65b7343a8a9637f33dc59f2b1342201290ca0774cbcbf616096b3696982047fb622b7d51afb5eceb298dd'
            '985da35f11eb29cb134fb9e1facfe55e69be6a10ccc70e98fafc36e6e8498bdc85881b1726d3c47b454e638584ec75082f5eb6b1b815a1574bd670d630a8c79f'
            '309f55c8c381364eca6d31c4709a0ebb7e04cefad9e51f44173d839a58e7f8e95e3c678922f9e1fe42cff90dba5144cc7ee3a6e1c236b079b501c0e08ad2152d')

prepare() {
  cd $pkgbase-$pkgver
  sed -i \
    -e '/^LogFile=.*/d' \
    -e 's/# LogType=file/LogType=system/' \
    conf/zabbix_{agentd,proxy,server}.conf src/go/conf/zabbix_web_service.conf

  autoreconf -fi
}

build() {
  export GOPATH="$srcdir"/go
  export AGENT_LDFLAGS="${LDFLAGS}"

  _configure_flags=(
    --disable-static
    --prefix=/usr
    --infodir=/usr/share/info
    --mandir=/usr/share/man
    --sysconfdir=/etc/zabbix
    --enable-agent
    --enable-agent2
    --enable-ipv6
    --with-ldap
    --with-libcurl
    --with-libxml2
    --with-net-snmp
    --with-openssl
    --with-libpcre2
    --with-ssh2
    --with-unixodbc
    --with-openipmi
    --enable-webservice
  )

  cd $pkgbase-$pkgver

  # Make copies since `make clean` removes the files and they cannot be rebuilt easily
  for db in postgresql mysql sqlite3; do
	  mkdir -p ../copies/database/$db
	  cp database/$db/*.sql ../copies/database/$db/
  done

  for db in postgresql mysql; do
    ./configure ${_configure_flags[@]} --enable-server --with-$db
    make clean
    make
    mv src/zabbix_server/zabbix_server{,_$db}
  done

  for db in postgresql mysql sqlite3; do
    ./configure ${_configure_flags[@]} --enable-proxy --with-$db
    make clean
    make
    mv src/zabbix_proxy/zabbix_proxy{,_$db}
  done
}

package_zabbix-server() {
  pkgdesc='Monitoring software for networks and applications'
  depends=(net-snmp curl libxml2 unixodbc libldap libevent pcre2 openipmi)
  optdepends=('postgresql-libs: for PostgreSQL support'
              'mariadb-libs: for MariaDB support'
              'zabbix-web-service: for scheduled PDF report generation')
  backup=(etc/zabbix/zabbix_server.conf)

  cd $pkgbase-$pkgver

  for db in postgresql mysql; do
    install -Dm755 src/zabbix_server/zabbix_server_$db \
      "$pkgdir/usr/bin/zabbix_server_$db"

    install -d "$pkgdir/usr/share/$pkgname/$db"
    install -m644 ../copies/database/$db/*.sql -t "$pkgdir/usr/share/$pkgname/$db"
  done
  install -Dm755 src/zabbix_get/zabbix_get "$pkgdir/usr/bin/zabbix_get"

  install -Dm644 man/zabbix_server.man "$pkgdir/usr/share/man/man8/zabbix_server.8"
  install -Dm644 man/zabbix_get.man "$pkgdir/usr/share/man/man1/zabbix_get.1"

  install -Dm644 conf/zabbix_server.conf "$pkgdir/etc/zabbix/zabbix_server.conf"
  chown 170:170 "$pkgdir/etc/zabbix/zabbix_server.conf"


  install -Dm644 "$srcdir/zabbix-server.sysusers" \
	"$pkgdir/usr/lib/sysusers.d/zabbix-server.conf"
  install -Dm644 "$srcdir/zabbix-server.tmpfiles" \
	"$pkgdir/usr/lib/tmpfiles.d/zabbix-server.conf"

  # Fix socket paths to avoid 10 day cleanup in /tmp
  echo "d /run/$pkgname 750 $pkgname $pkgname" >> "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  sed -i \
    -e "s/# SocketDir=\/tmp/SocketDir=\/run\/$pkgname/" \
    "$pkgdir/etc/zabbix/"*.conf
}

package_zabbix-agent() {
  pkgdesc='Monitoring agent for Zabbix'
  depends=(curl pcre2)
  backup=(etc/zabbix/zabbix_agentd.conf)

  cd $pkgbase-$pkgver
  install -Dm755 src/zabbix_agent/zabbix_agentd "$pkgdir/usr/bin/zabbix_agentd"
  install -Dm755 src/zabbix_sender/zabbix_sender "$pkgdir/usr/bin/zabbix_sender"

  install -Dm644 conf/zabbix_agentd.conf "$pkgdir/etc/zabbix/zabbix_agentd.conf"
  chown 172:172 "$pkgdir/etc/zabbix/zabbix_agentd.conf"

  install -Dm644 conf/zabbix_agentd/userparameter_examples.conf \
	"$pkgdir/usr/share/zabbix-agent/userparameter_examples.conf"
  install -Dm644 conf/zabbix_agentd/userparameter_mysql.conf \
	"$pkgdir/usr/share/zabbix-agent/userparameter_mysql.conf"

  install -Dm644 man/zabbix_agentd.man \
	"$pkgdir/usr/share/man/man8/zabbix_agentd.8"
  install -Dm644 man/zabbix_sender.man \
	"$pkgdir/usr/share/man/man1/zabbix_sender.1"

  install -Dm644 "$srcdir/zabbix-agent.sysusers" \
	"$pkgdir/usr/lib/sysusers.d/zabbix-agent.conf"
  install -Dm644 "$srcdir/zabbix-agent.tmpfiles" \
	"$pkgdir/usr/lib/tmpfiles.d/zabbix-agent.conf"
}

package_zabbix-agent2() {
  pkgdesc='Monitoring agent for Zabbix (version 2)'
  depends=(curl pcre2)
  backup=(etc/zabbix/zabbix_agent2.conf)

  cd $pkgbase-$pkgver
  install -Dm755 src/go/bin/zabbix_agent2 "$pkgdir/usr/bin/zabbix_agent2"
  install -Dm644 src/go/conf/zabbix_agent2.conf "$pkgdir/etc/zabbix/zabbix_agent2.conf"
  chown 172:172 "$pkgdir/etc/zabbix/zabbix_agent2.conf"
  mkdir -p "$pkgdir/etc/zabbix/zabbix_agent2.d/plugins.d/"
  chown 172:172 "$pkgdir/etc/zabbix/zabbix_agent2.d/plugins.d/"

  install -Dm644 man/zabbix_agent2.man \
	"$pkgdir/usr/share/man/man8/zabbix_agent2.8"

}

package_zabbix-proxy() {
  pkgdesc='Data collecting proxy for Zabbix'
  depends=(net-snmp curl libxml2 sqlite unixodbc libldap pcre2 libevent openipmi)
  optdepends=('mariadb-libs: for MariaDB support'
              'postgresql-libs: for PostgreSQL support')
  backup=(etc/zabbix/zabbix_proxy.conf)

  cd $pkgbase-$pkgver
  for db in postgresql mysql sqlite3; do
    install -Dm755 src/zabbix_proxy/zabbix_proxy_$db \
      "$pkgdir/usr/bin/zabbix_proxy_$db"

    install -d "$pkgdir/usr/share/$pkgname/$db"
    install -m644 ../copies/database/$db/schema.sql -t "$pkgdir/usr/share/$pkgname/$db"
  done
  install -Dm644 conf/zabbix_proxy.conf "$pkgdir/etc/zabbix/zabbix_proxy.conf"
  chown 171:171 "$pkgdir/etc/zabbix/zabbix_proxy.conf"


  install -Dm644 "$srcdir/zabbix-proxy.sysusers" \
	"$pkgdir/usr/lib/sysusers.d/zabbix-proxy.conf"
  install -Dm644 "$srcdir/zabbix-proxy.tmpfiles" \
	"$pkgdir/usr/lib/tmpfiles.d/zabbix-proxy.conf"

  # Fix socket paths to avoid 10 day cleanup in /tmp
  echo "d /run/$pkgname 750 $pkgname $pkgname" >> "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  sed -i \
    -e "s/# SocketDir=\/tmp/SocketDir=\/run\/$pkgname/" \
    "$pkgdir/etc/zabbix/"*.conf
}

package_zabbix-frontend-php() {
  pkgdesc='PHP frontend for Zabbix'
  depends=(zabbix-server php php-gd)

  cd $pkgbase-$pkgver
  install -d "$pkgdir/usr/share/webapps/zabbix"
  cp -a ui/* "$pkgdir/usr/share/webapps/zabbix"
  chown 33:33 ${pkgdir}/usr/share/webapps/zabbix/conf/ # write access for http user
}

package_zabbix-web-service() {
  pkgdesc='Zabbix web service used to generate and send scheduled reports'
  depends=(chromium)
  backup=(etc/zabbix/zabbix_web_service.conf)

  cd $pkgbase-$pkgver
  install -Dm755 src/go/bin/zabbix_web_service "$pkgdir/usr/bin/zabbix_web_service"
  install -Dm644 src/go/conf/zabbix_web_service.conf "$pkgdir/etc/zabbix/zabbix_web_service.conf"
  chown 173:173 "$pkgdir/etc/zabbix/zabbix_web_service.conf"

  install -Dm644 "$srcdir/zabbix-web-service.sysusers" \
	"$pkgdir/usr/lib/sysusers.d/zabbix-web-service.conf"
  install -Dm644 "$srcdir/zabbix-web-service.tmpfiles" \
	"$pkgdir/usr/lib/tmpfiles.d/zabbix-web-service.conf"
}
