# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Marcel Huber <marcelhuberfoo at gmail dott com>
# Contributor: Illarion Kovalchuk <illarion.kovalchuk at gmail dot com>

pkgname=jenkins
pkgver=2.423
pkgrel=1
_java=17
pkgdesc='Extendable continuous integration server (latest)'
arch=('any')
url='https://jenkins.io'
license=('MIT')
depends=("java-runtime=${_java}" 'ttf-dejavu' 'fontconfig')
makedepends=("java-environment=${_java}" 'git' 'maven')
provides=('jenkins-ci')
conflicts=('jenkins-ci')
replaces=('jenkins-ci')
install='jenkins.install'
source=("https://github.com/jenkinsci/jenkins/archive/refs/tags/jenkins-${pkgver}.tar.gz"
        'jenkins.tmpfiles'
        'jenkins.sysusers'
        'skip-failing-test.patch')
sha512sums=('f84ceb21eae18902675e5336e9796bc920ebdfb8409d6c5691f3b6e5f1d8c54dd1ba978963499fd12cd73386a770a44eb0b903081895693e9e592776dbdf5164'
            'a845a7147be54affc586dfce9a188ec24c92e673e88dec0b62da386d2e597de6ecda103429008562abd897f179a52c37cf2188ebc65b8c636efd07d707e18f90'
            '896cbc64eadb2f3bb9fa7fc26dbfc527b1823d8bff3158be7f1936cc250f55eeafe89079e1ceb8f3d269041662573ccbbb36248140b4ba24144a564366f8847a'
            '876180dc1674ec56c32a4fceac7d9608f450520ace7d3ecb68cbe7ba8f1bcba31f2c063f52a9076c432b78fd31157da3febc65e98e7d9050a4134d4e0304e8bd')

prepare() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  patch -Np1 <"${srcdir}"/skip-failing-test.patch
}

build() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  export PATH="/usr/lib/jvm/java-${_java}-openjdk/bin:${PATH}"
  mvn -am -pl war,bom -Pquick-build -Dproject.build.outputTimestamp="${SOURCE_DATE_EPOCH}" package
}

check() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  export PATH="/usr/lib/jvm/java-${_java}-openjdk/bin:${PATH}"
  mvn -am -Plight-test -Dproject.build.outputTimestamp="${SOURCE_DATE_EPOCH}" test
}

package() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  install -Dm 644 war/target/jenkins.war "${pkgdir}/usr/share/java/jenkins/jenkins.war"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/jenkins/LICENSE"
  install -Dm 644 ../jenkins.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/jenkins.conf"
  install -Dm 644 ../jenkins.sysusers "${pkgdir}/usr/lib/sysusers.d/jenkins.conf"
}
