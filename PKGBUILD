# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Marcel Huber <marcelhuberfoo at gmail dott com>
# Contributor: Illarion Kovalchuk <illarion.kovalchuk at gmail dot com>

pkgname=jenkins
pkgver=2.499
pkgrel=1
pkgdesc="Extendable continuous integration server (latest)"
url="https://jenkins.io"
arch=('any')
license=('MIT')
_java=17
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
sha512sums=('3c7745053d1c21ca7386c421f17500215ffd156ef9333383c6b7c07009f1ef5bf959ba5ac7658c070966aba3aec2d51d92d38543a48dec82c4e63cbe1976e077'
            'a845a7147be54affc586dfce9a188ec24c92e673e88dec0b62da386d2e597de6ecda103429008562abd897f179a52c37cf2188ebc65b8c636efd07d707e18f90'
            'b40bb2e8f8fed4ee218e5d8b5e5aa95ccff3c54f501bcab8fec86f68b5fae22d5446ce4c95985527b38e89540495c7d9c2a4d3932f851231e4250d578164be7f'
            '876180dc1674ec56c32a4fceac7d9608f450520ace7d3ecb68cbe7ba8f1bcba31f2c063f52a9076c432b78fd31157da3febc65e98e7d9050a4134d4e0304e8bd')

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
