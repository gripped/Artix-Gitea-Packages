# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Marcel Huber <marcelhuberfoo at gmail dott com>
# Contributor: Illarion Kovalchuk <illarion.kovalchuk at gmail dot com>

pkgname=jenkins
pkgver=2.519
pkgrel=1
pkgdesc="Extendable continuous integration server (latest)"
url="https://jenkins.io"
arch=('any')
license=('MIT')
_java=21
depends=("java-runtime=${_java}" 'ttf-dejavu' 'fontconfig')
makedepends=("java-environment=${_java}" 'git' 'maven')
provides=('jenkins-ci')
conflicts=('jenkins-ci')
replaces=('jenkins-ci')
install='jenkins.install'
source=("git+https://github.com/jenkinsci/jenkins.git#tag=${pkgname}-${pkgver}"
        'jenkins.tmpfiles'
        'jenkins.sysusers'
        'skip-failing-test.patch')
sha512sums=('c8b6a5656a19c25964aaa97aa12a2e7ef7226a6c6c3f0794e8cfa23d51ef19a216d0bf5f565d88685d5f4905b172fba0f9323110be2058f2ba2e5a63bb6945c1'
            'a845a7147be54affc586dfce9a188ec24c92e673e88dec0b62da386d2e597de6ecda103429008562abd897f179a52c37cf2188ebc65b8c636efd07d707e18f90'
            'b40bb2e8f8fed4ee218e5d8b5e5aa95ccff3c54f501bcab8fec86f68b5fae22d5446ce4c95985527b38e89540495c7d9c2a4d3932f851231e4250d578164be7f'
            '98fc2441b145e02afc2ef1ef107ac479638d9a71f85bb3a259c155c629ee83b2f59947e6eacb75023d7eb7c5947c2f41aaca77097da7fb56cf87f4e6d5efd35a')

prepare() {
	cd "${pkgname}"
	patch -Np1 < "${srcdir}/skip-failing-test.patch"
}

build() {
	cd "${pkgname}"
	export PATH="/usr/lib/jvm/java-${_java}-openjdk/bin:${PATH}"
	mvn -am -pl war,bom -Pquick-build -Dproject.build.outputTimestamp="${SOURCE_DATE_EPOCH}" package
}

check() {
	cd "${pkgname}"
	export PATH="/usr/lib/jvm/java-${_java}-openjdk/bin:${PATH}"
	mvn -am -Plight-test -Dproject.build.outputTimestamp="${SOURCE_DATE_EPOCH}" test
}

package() {
	cd "${pkgname}"
	install -Dm 644 "war/target/${pkgname}.war" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.war"
	install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -Dm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
