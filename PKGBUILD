# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: simo <simo@archlinux.org>
# Contributor: Sid Karunaratne

pkgname=tor
pkgver=0.4.9.15
pkgrel=1
pkgdesc='Anonymizing overlay network.'
arch=('x86_64')
url='https://www.torproject.org/download/tor/'
license=("BSD-3-Clause" "LGPL-3.0-only" "MIT")
depends=(
  'bash'
  'glibc'
  'libcap' 'libcap.so'
  'libevent' 'libevent-2.1.so'
  'libseccomp' 'libseccomp.so'
  'openssl' 'libcrypto.so' 'libssl.so'
 
  'xz' 'liblzma.so'
  'zlib' 'libz.so'
  'zstd' 'libzstd.so'
)
optdepends=('torsocks: for torify')
makedepends=('ca-certificates')
backup=('etc/tor/torrc')
source=("https://dist.torproject.org/${pkgname}-${pkgver}.tar.gz"{,.sha256sum{,.asc}}
        "disable-openssl-dynamic-linking-warning.patch"
        'torrc.patch'
        'tor.sysusers'
        'tor.tmpfiles'
)
sha256sums=('1911f5b216a6814ed143a08bbcff1c6dc96d2ca3b505df9a21876080a92963f3'
            '2a083b5cf16e772f9af611a5bf7485532581ec7455e7e9227cb5daabb686efca'
            'SKIP'
            '4067f5a6589bfaa97dd2b1a20aa73a9d3f1793bb8862c602c24b4f0cefd05dc9'
            'c5c082fd1cda30c95c40043d5be96926fa81e5388a97534373bf0ce100191ade'
            '86dccabaf769a48ffad9dffa37fcd7fbf7ef1712464ddfd12a4b43f2a680cdeb'
            '07bedb17660a3673b31b0005b6505065c90b32f2c6b28b969241da675560f926')
b2sums=('b3be42c2619998967f1bdb76b33d66689ba15ac683e30561e589558e76c74ecad2690caf4bd5bf16d2f7e85637a766d94528b5dd29ee79f4532d806d54da0738'
        '74572fd3dc7507fe5ce065521b1b1fe90981091e0e97eba02ee9b0d7a30f2bdb0a472f986b348a8acf678c24bb9699fb964578cfd8a0788579cde31b42098a39'
        'SKIP'
        'cb9fbdc4bb449975bab57ad11a188ccc0462981132ab9617108d6a92f71e22448e407afc73f252fc4f3f2f6bf9e5c211abd9cdfe6514a76ff2162ef750348b90'
        '98baf96cdac36072086f48bf4701cede6cf31eee207f4a1a4cfc81b483ba53b991082aaf4ed638e50dfd67fb006bbd915af97943ab658df29dfa51ea4aa77dd2'
        '39fbefb33b008782b3800cbbd6f0d7caa9686eda8ccd2d0fef805bd29a21d3bf246e92974e8a93bb931910f84fe0145a18e55ec788168fc9eb0c0590c7f28510'
        '5d55d9a7e42b6ce78b8ab985bab37afe8f0bacddb5abd895c4a490adb8f98b9422f90b40066fef05ecf37b7b21e80aadc615c4b7f6e12b05581304113a1b1f1d')
validpgpkeys=(
  '2133BC600AB133E1D826D173FE43009C4607B1FB' # Nick Mathewson
  'B74417EDDF22AC9F9E90F49142E86A2A11F48D36' # David Goulet
  '1C1BC007A9F607AA8152C040BEA7B180B1491921' # Alexander Færøy
)

prepare() {
  # verify the signed sums match the expected source tarball
  sha256sum -c ${pkgname}-${pkgver}.tar.gz.sha256sum
  cd ${pkgname}-${pkgver}
  # uncomment essential config sections in the torrc file
  patch -Np1 -i ../torrc.patch
  patch -Np1 -i ../disable-openssl-dynamic-linking-warning.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gpl
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/etc/tor/torrc{.sample,}

  # install arch custom files
  install -Dm 644 "${srcdir}"/tor.sysusers "${pkgdir}"/usr/lib/sysusers.d/tor.conf
  install -Dm 644 "${srcdir}"/tor.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/tor.conf

  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim: ts=2 sw=2 et:
