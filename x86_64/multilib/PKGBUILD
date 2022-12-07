# Maintainer: Nathan <ndowens@artixlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=gpm
pkgname=lib32-$_pkgname
pkgver=1.20.7.r38.ge82d1a6
pkgrel=1
_commit='e82d1a653ca94aa4ed12441424da6ce780b1e530'
pkgdesc="A mouse server for the console and xterm (32 bit)"
arch=('x86_64')
url="https://www.nico.schottelius.org/software/gpm/"
license=('GPL')
depends=('lib32-ncurses' "$_pkgname")
makedepends=('git')
options=('!makeflags')
source=("git+https://github.com/telmich/gpm.git#commit=${_commit}"
         0001-multi-def.patch
         0001-format-security.patch)
sha1sums=('SKIP'
          '73babbae38e21827346dd27ca3ebd1761bb76889'
          '234055aa7e06568597677fb60417748d6125e857')
sha256sums=('SKIP'
            'a919e2707020abff66231234d5d8dcfb0b5cec870213aaa79d62d8724f075ca7'
            '94c5ccfea61c6d8a318724ee018465327ca10e72f6e7ff64946deded7e2ecf66')

pkgver() {
  cd $_pkgname

  GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"
  printf '%s.r%s.g%s' \
    "${GITTAG}" \
    "$(git rev-list --count ${GITTAG}..)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${_pkgname}
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --libdir=/usr/lib32
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install

# library fixes
  cd "${pkgdir}/usr/lib32/"
  ln -s libgpm.so.2.* libgpm.so
  chmod 755 "${pkgdir}"/usr/lib32/libgpm.so.*

  rm -rf "${pkgdir}"/usr/{bin,include,share} "$pkgdir"/etc
}
