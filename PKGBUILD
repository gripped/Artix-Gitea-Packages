# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Marcel Huber <marcelhuberfoo at gmail dott com>
# Contributor: Illarion Kovalchuk <illarion.kovalchuk at gmail dot com>

pkgname=jenkins
pkgver=2.570
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
sha512sums=('cd69d2edb8a2bcfded25f94dd0488df5cc14ec8db32f66d2ccaedb97dd999e786aa2400c64fe9aec73007990c16603ca177a322c185ab4d378847e5951fb6ce1'
            'a845a7147be54affc586dfce9a188ec24c92e673e88dec0b62da386d2e597de6ecda103429008562abd897f179a52c37cf2188ebc65b8c636efd07d707e18f90'
            '896cbc64eadb2f3bb9fa7fc26dbfc527b1823d8bff3158be7f1936cc250f55eeafe89079e1ceb8f3d269041662573ccbbb36248140b4ba24144a564366f8847a'
            '57e94c44f2bb9692349bb6e596fd7885832372bf11df0947b04c40b61a089491c6770cfbdf6ad42f2b4bcf222ad69ba0d8f5042ce27309f0f59c990c682fffcb')

prepare() {
	cd "${pkgname}"
	patch -Np1 -i "${srcdir}/skip-failing-test.patch"
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
