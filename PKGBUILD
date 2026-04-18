# Maintainer: capezotte <capezotte@artixlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=maven
pkgver=3.9.15
pkgrel=1
pkgdesc='Java project management and project comprehension tool'
url='https://maven.apache.org'
arch=('any')
license=('Apache-2.0')
depends=('java-environment>=8' 'bash' 'procps-ng')
backup=('usr/share/java/maven/conf/settings.xml')
source=(https://downloads.apache.org/maven/maven-3/${pkgver}/binaries/apache-maven-${pkgver}-bin.tar.gz{,.asc} # identical to what Arch provides
        maven.sh)
noextract=(apache-maven-${pkgver}-bin.tar.gz)
# https://www.apache.org/dist/maven/KEYS
validpgpkeys=(
  '042B29E928995B9DB963C636C7CA19B7B620D787' # StephenConnolly<stephenc@apache.org>
  'AE9E53FC28FF2AB1012273D0BF1518E0160788A2' # Karl Heinz Marbaise (ASF Key) <khmarbaise@apache.org>
  'BBE7232D7991050B54C8EA0ADC08637CA615D22C' # Enrico Olivelli <eolivelli@apache.org>
  'B02137D875D833D9B23392ECAE5A7FB608A0221C' # Robert Scholte <rfscholte@apache.org>
  '6A814B1F869C2BBEAB7CB7271A2A1C94BDE89688' # Michael Osipov (Java developer) <1983-01-06@gmx.net>
  '29BEA2A645F2D6CED7FB12E02B172E3E156466E8' # Tamas Cservenak (ASF) (Release key) <cstamas@apache.org>
  '88BE34F94BDB2B5357044E2E3A387D43964143E3' # Tamas Cservenak <tamas@cservenak.net>
  '84789D24DF77A32433CE1F079EB80E92EB2135B1' # Slawomir Jaranowski <sjaranowski@apache.org>
)
sha256sums=('36182f85e91128cd5c4608462ac92194e7a30638f65034de66f4e1b00600a6fc'
            'SKIP'
            '6ec2fef2a5f179f873b180452c72915e639e7b881a6894e13c209816b3518908')

package() {
  install -Dm 644 ./maven.sh -t "${pkgdir}/etc/profile.d"

  install -d "${pkgdir}/usr/share/java/${pkgname}"
  bsdtar xf apache-maven-${pkgver}-bin.tar.gz \
    --strip-components=1 \
    -C "${pkgdir}/usr/share/java/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/java/${pkgname}/bin/mvn" "${pkgdir}/usr/bin/mvn"
  ln -s "/usr/share/java/${pkgname}/bin/mvnDebug" "${pkgdir}/usr/bin/mvnDebug"
}

# vim: ts=2 sw=2 et:
