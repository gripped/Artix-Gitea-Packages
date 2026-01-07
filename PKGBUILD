# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgbase=zabbix
pkgname=('zabbix-common' 'zabbix-server' 'zabbix-frontend-php' 'zabbix-web-service' 'zabbix-proxy' 'zabbix-agent' 'zabbix-agent2')
pkgver=7.4.6
pkgrel=2
pkgdesc="The universal, open-source observability solution for IT & OT"
url="https://cdn.zabbix.com/zabbix"
arch=('x86_64')
license=('GPL-2.0-only')
makedepends=('postgresql-libs' 'libxml2' 'unixodbc' 'net-snmp' 'mariadb-libs' 'libldap' 'libevent' 'go' 'pkgconfig' 'pcre2' 'openipmi' 'git')
source=("$pkgbase-$pkgver.tar.gz::$url/sources/stable/7.4/$pkgbase-$pkgver.tar.gz"
        'zabbix-common.sysusers'
        'zabbix-common.tmpfiles'
        'zabbix-server.tmpfiles'
        'zabbix-web-service.tmpfiles'
        'zabbix-proxy.tmpfiles'
        'zabbix-agent.tmpfiles'
        'zabbix-agent2.tmpfiles'
        'write_log_to_syslog.patch'
        'set_socket_paths.patch'
        'reproducible_build.patch')
sha512sums=('2f593e210409c74974395bf163be127159136eac86216443122f5d2104cb85b5b652c6f445ed7408532b894f7ddbc3f1f060465f7797326f1198d3354f48e2e9'
            '8570843ad927d900f9e9aa95dfa8a24ebb0f01beda3073b24c5963aedd92e3ebed75bbb6139127830eaf289df233c2734d81b52b25a1b8f4db57336152514194'
            '7c39d1cb1d269e8a2a22c634612c7d110e9e67c170f32add33312f97bc2e7f8f19bf5bb1d1c71df43afc893043472069b9f828dfc5a9f2946606798ed54c73a0'
            'c82056591146e7ef0020a3cd9865322407a116e20beb1ddd6fc2afdec09306b6d249d9a2afe8d9234932861b506b3b50a3b528944ab3889c076e5088cd7e63ed'
            '3c3e64be4dd050b3cc483098e1a2165c87ba9a4a421aa29f1bc49b9536ce446457949bf85b3bd87cd3f1842b6c4d5db675e343078ef90820557a8278293019f7'
            'd4d7fd47bb0aaaec02802edb1d6895791300ab2491c71ff9dc59ec26659c906918d0ea9162b4bc799e358abef186356544e5a2cc9e14a6ec82c08f6240bc0946'
            '02c2107d37221ce1a987d4aaea3673008df2553f00a6a0b044e3f4bb39a52b2ff68477575cc968209fd397ecfe27a21bf89a0d3ca2010e7c942c2d9546df4d8d'
            '0f8d0db314f8e0ed1cfc1bc1951aaa81455f52ea3012f2eb54bed37056d7d89ad1dd22af18039f1ce9c96430050b2b30e4d24ff8606f3f364f1596838435252b'
            '49a197a97536745818664593cf597540eb51e1f0c2429efea6be9ab85ee57f2a4b6e72a197bf02440c9b49a80a7ea0417f9b5a23bef003dc3337d7f08792cbf5'
            '55dec0ef08d54e7972421e3958119cb7df9e0ef10ff6c58836306d4ad6e3724fb902e819070d76e4a5fa24428610d838db7eb0425f05b19493b5e2c9b5919931'
            '71aaf2cdf6885547931c212fa312b4d684af1b765be78f7ad4cded4700305d81602d76fae859338357ef9dda8c7fe265c829ed1a4a964e67591f4390def1b23b')

prepare() {
	cd "${pkgbase}-${pkgver}"

	#./bootstrap.sh

	# Write logs to syslog (rather than log files)
	patch -Np1 -i "${srcdir}/write_log_to_syslog.patch"

	# Set socket paths to `/run/zabbix`
	patch -Np1 -i "${srcdir}/set_socket_paths.patch"

	# Honor SDE for reproducible builds
	patch -Np1 -i "${srcdir}/reproducible_build.patch"

	autoreconf -fiv

	# Clean up git residues and delete development tests
	find . -type f -name ".gitignore" -exec rm {} \;
	rm -rf ui/tests
}

build() {
	export GOPATH="${srcdir}/go"
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

	cd "${pkgbase}-${pkgver}"

	for db in postgresql mysql; do
		./configure "${_configure_flags[@]}" --enable-server --with-"${db}"
		make clean
		make gettext
		# make dbschema
		make
		mkdir -p "${srcdir}/copies/database_server/${db}"
		cp database/"${db}"/*.sql "${srcdir}/copies/database_server/${db}/"
		mv src/zabbix_server/zabbix_server{,_"${db}"}
	done

	for db in postgresql mysql sqlite3; do
		./configure "${_configure_flags[@]}" --enable-proxy --with-"${db}"
		make clean
		make gettext
		# make dbschema
		make
		mkdir -p "${srcdir}/copies/database_proxy/${db}"
		cp database/"${db}"/*.sql "${srcdir}/copies/database_proxy/${db}/"
		mv src/zabbix_proxy/zabbix_proxy{,_"${db}"}
	done
}

package_zabbix-common() {
	pkgdesc="Zabbix user and group required by zabbix packages"

	install -Dm 644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm 644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

package_zabbix-server() {
	pkgdesc="Monitoring software for networks and applications"
	depends=('zabbix-common' 'net-snmp' 'curl' 'libxml2' 'unixodbc' 'libldap' 'libevent' 'pcre2' 'openipmi')
	optdepends=('postgresql-libs: for PostgreSQL support'
	            'mariadb-libs: for MariaDB support'
	            'zabbix-web-service: for scheduled PDF report generation')
	backup=('etc/zabbix/zabbix_server.conf')

	cd "${pkgbase}-${pkgver}"

	for db in postgresql mysql; do
		install -Dm 755 "src/zabbix_server/zabbix_server_${db}" "${pkgdir}/usr/bin/zabbix_server_${db}"
		install -d "${pkgdir}/usr/share/${pkgname}/${db}"
		install -m 644 "${srcdir}/copies/database_server/${db}"/*.sql -t "${pkgdir}/usr/share/${pkgname}/${db}/"
	done

	install -Dm 755 src/zabbix_get/zabbix_get "${pkgdir}/usr/bin/zabbix_get"

	install -Dm 644 man/zabbix_server.man "${pkgdir}/usr/share/man/man8/zabbix_server.8"
	install -Dm 644 man/zabbix_get.man "${pkgdir}/usr/share/man/man1/zabbix_get.1"

	install -Dm 644 conf/zabbix_server.conf "${pkgdir}/etc/zabbix/zabbix_server.conf"
	install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

}

package_zabbix-frontend-php() {
	pkgdesc="PHP frontend for Zabbix"
	depends=('zabbix-server' 'php' 'php-gd')

	cd "${pkgbase}-${pkgver}"

	install -d "${pkgdir}/usr/share/webapps/zabbix"
	cp -av ui/* "${pkgdir}/usr/share/webapps/zabbix"

	# Write access for http user
	chown 33:33 "${pkgdir}/usr/share/webapps/zabbix/conf/"
}

package_zabbix-web-service() {
	pkgdesc="Zabbix web service used to generate and send scheduled reports"
	depends=('zabbix-common' 'chromium')
	backup=('etc/zabbix/zabbix_web_service.conf')

	cd "${pkgbase}-${pkgver}"

	install -Dm 755 src/go/bin/zabbix_web_service "${pkgdir}/usr/bin/zabbix_web_service"

	install -Dm 644 src/go/conf/zabbix_web_service.conf "${pkgdir}/etc/zabbix/zabbix_web_service.conf"
	install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

}

package_zabbix-proxy() {
	pkgdesc="Data collecting proxy for Zabbix"
	depends=('zabbix-common' 'net-snmp' 'curl' 'libxml2' 'sqlite' 'unixodbc' 'libldap' 'pcre2' 'libevent' 'openipmi')
	optdepends=('mariadb-libs: for MariaDB support'
	            'postgresql-libs: for PostgreSQL support')
	backup=('etc/zabbix/zabbix_proxy.conf')

	cd "${pkgbase}-${pkgver}"

	for db in postgresql mysql sqlite3; do
		install -Dm 755 "src/zabbix_proxy/zabbix_proxy_${db}" "${pkgdir}/usr/bin/zabbix_proxy_${db}"
		install -Dm 644 "${srcdir}/copies/database_proxy/${db}/schema.sql" "${pkgdir}/usr/share/${pkgname}/${db}/schema.sql"
	done

	install -Dm 644 conf/zabbix_proxy.conf "${pkgdir}/etc/zabbix/zabbix_proxy.conf"
	install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

}

package_zabbix-agent() {
	pkgdesc="Monitoring agent for Zabbix"
	depends=('zabbix-common' 'curl' 'pcre2')
	backup=('etc/zabbix/zabbix_agentd.conf')

	cd "${pkgbase}-${pkgver}"

	install -Dm 755 src/zabbix_agent/zabbix_agentd "${pkgdir}/usr/bin/zabbix_agentd"
	install -Dm 755 src/zabbix_sender/zabbix_sender "${pkgdir}/usr/bin/zabbix_sender"

	install -Dm 644 conf/zabbix_agentd.conf "${pkgdir}/etc/zabbix/zabbix_agentd.conf"
	install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	install -Dm 644 conf/zabbix_agentd/userparameter_examples.conf "${pkgdir}/usr/share/zabbix-agent/userparameter_examples.conf"
	install -Dm 644 conf/zabbix_agentd/userparameter_mysql.conf "${pkgdir}/usr/share/zabbix-agent/userparameter_mysql.conf"

	install -Dm 644 man/zabbix_agentd.man "${pkgdir}/usr/share/man/man8/zabbix_agentd.8"
	install -Dm 644 man/zabbix_sender.man "${pkgdir}/usr/share/man/man1/zabbix_sender.1"

}

package_zabbix-agent2() {
	pkgdesc="Monitoring agent for Zabbix (version 2)"
	depends=('zabbix-common' 'curl' 'pcre2')
	backup=('etc/zabbix/zabbix_agent2.conf')

	cd "${pkgbase}-${pkgver}"

	install -Dm 755 src/go/bin/zabbix_agent2 "${pkgdir}/usr/bin/zabbix_agent2"

	mkdir -p "${pkgdir}/etc/zabbix/zabbix_agent2.d/plugins.d/"
	install -Dm 644 src/go/conf/zabbix_agent2.conf "${pkgdir}/etc/zabbix/zabbix_agent2.conf"
	install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	install -Dm 644 man/zabbix_agent2.man "${pkgdir}/usr/share/man/man8/zabbix_agent2.8"

}
