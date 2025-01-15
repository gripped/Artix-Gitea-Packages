# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>

pkgname=rsync
pkgver=3.4.0
pkgrel=1
pkgdesc='A fast and versatile file copying tool for remote and local files'
arch=('x86_64')
url='https://rsync.samba.org/'
license=('GPL3')
depends=('acl' 'libacl.so' 'lz4' 'openssl' 'popt' 'xxhash' 'libxxhash.so'
         'zlib' 'zstd')
optdepends=('python: for rrsync')
makedepends=('git' 'python-commonmark')
checkdepends=('rsync')
backup=(
    'etc/rsyncd.conf'
    'etc/xinetd.d/rsync'
)
validpgpkeys=('0048C8B026D4C96F0E589C2F6C859FB14B96A8C5'  # Wayne Davison <wayned@users.sourceforge.net>
              '9FEF112DCE19A0DC7E882CB81BB24997A8535F6F') # Andrew Tridgell <andrew@tridgell.net
source=("git+https://github.com/RsyncProject/rsync.git#tag=v${pkgver}?signed"
        'rsyncd.conf')
sha256sums=('f14621c42d88d42bc020a1cadfa82c4fa2a842df92caa4e41ca33d996f9bf23c'
            '733ccb571721433c3a6262c58b658253ca6553bec79c2bdd0011810bb4f2156b')

_backports=(
)

_reverts=(
)

prepare() {
  cd ${pkgname}

  local _c
  for _c in "${_backports[@]}"; do
    if [[ $_c == *..* ]]; then
      git log --oneline --reverse "${_c}"
    else
      git log --oneline -1 "${_c}"
    fi
    git cherry-pick -n -m1 "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    git log --oneline -1 "${_c}"
    git revert -n "${_c}"
  done
}

build() {
  cd ${pkgname}

  ./configure \
    --prefix=/usr \
    --enable-ipv6 \
    --disable-debug \
    --with-rrsync \
    --with-included-popt=no \
    --with-included-zlib=no
  make
}

check() {
  cd ${pkgname}

  # check for IPv6 support
  if rsync -V | grep -q 'no IPv6'; then
    echo 'Built without IPv6 support!' >&2
    exit 1
  fi

  make test

}

package() {
  cd ${pkgname}

  make DESTDIR="$pkgdir" install
  install -Dm0644 ../rsyncd.conf "$pkgdir/etc/rsyncd.conf"
  install -Dm0644 packaging/lsb/rsync.xinetd "$pkgdir/etc/xinetd.d/rsync"
}
