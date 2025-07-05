# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=bash
_basever=5.3
_patchlevel=0
pkgver=${_basever}.${_patchlevel}
pkgrel=1
pkgdesc='The GNU Bourne Again shell'
arch=(x86_64)
license=('GPL-3.0-or-later')
url='https://www.gnu.org/software/bash/bash.html'
backup=(
  etc/bash/bash{rc,_logout} 
  etc/skel/.bash{rc,_profile,_logout}
)
depends=(
  readline
  libreadline.so
  glibc
  ncurses
)
optdepends=('bash-completion: for tab completion')
provides=('sh')
install=bash.install
source=(
  https://ftp.gnu.org/gnu/bash/bash-$_basever.tar.gz{,.sig}
  dot.bashrc
  dot.bash_profile
  dot.bash_logout
  system.bashrc
  system.bash_logout

  artix.bashrc)
validpgpkeys=('7C0135FB088AAF6C66C650B9BB5869F064EA74AB') # Chet Ramey

if [[ $((10#${_patchlevel})) -gt 0 ]]; then
  for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
    source=(${source[@]} https://ftp.gnu.org/gnu/bash/bash-$_basever-patches/bash${_basever//.}-$(printf "%03d" $_p){,.sig})
  done
fi
b2sums=('88a4f0146eb11698120890f2afaf28210295135f8f7f61dcbb99eeb0c39c84da5360a3b0572a26dc2a36b207fd440b83bb5a947213af90306c8f6ab608964ff1'
        'SKIP'
        '93e55e4e1b7e133c0d03733121bb12ba9c64230ff328280ac68a5d1fca0f83637159c0861bca0c30eda61ca14d5a319cd38424959e84344e188c0349cd159ba7'
        '2d53f99e485218ed47f2e40907023645594ac8ffcf00d0569050d54a8f4dabe0a2bdcab515a45b663283c2e6299d805b923ea7b7b789c6a4150c37a98a5b117c'
        'dbfe5c1aaea94419305c1f8c9b54b94eab515260910f2309360ff702a27032faa34514e70b31adbb1e41bd912d4e43a610939cb07565f43e05dd19813a81752e'
        'ff7b83a0542bba7d50d75b8e258b1de9bf00442fd66a52d6092494524461d03da7386def13be24b71c7ade5a890467692f9596583a4c9844244d7d68fb51e05c'
        'eed9da98cd4b7cf9db720e9820cf809a9168cb84a8466127ff588d041badc66cc3fd657e897c702cf0b6d19aefc7b880d976aead003594a2e980d98b17ff886f'
        '830d042bc0b3473260844e9aa3bca3e14d4ae60264b1f7760f69168cd4db9d0d5b41c1887463b23663e52e9a6a611ef8a99be82c737f0760eaaaf97f7eec35db')

prepare() {
  cd "${pkgname}-${_basever}"
  for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
    local patch="bash${_basever//.}-$(printf "%03d" $_p)"
    patch -Np0 -i ../"${patch}"
  done
  # add patches from gentoo, fixing various upstream reported issues
  # https://gitweb.gentoo.org/repo/gentoo.git/tree/app-shells/bash/files
}

build() {
  cd "${pkgname}-${_basever}"

  _bashconfig=(-DDEFAULT_PATH_VALUE=\'\"/usr/local/sbin:/usr/local/bin:/usr/bin\"\'
               -DSTANDARD_UTILS_PATH=\'\"/usr/bin\"\'
               -DSYS_BASHRC=\'\"/etc/bash/bashrc\"\'
               -DSYS_BASH_LOGOUT=\'\"/etc/bash/bash_logout\"\'
               -DNON_INTERACTIVE_LOGIN_SHELLS
               -std=gnu17)
  export CFLAGS="${CFLAGS} ${_bashconfig[@]}"

  ./configure \
    --prefix=/usr \
    --with-curses \
    --enable-readline \
    --without-bash-malloc \
    --with-installed-readline
  make
}

check() {
  make -C "${pkgname}-${_basever}" check
}

package() {
  make -C "${pkgname}-${_basever}" DESTDIR="$pkgdir" install
  ln -s bash "${pkgdir}/usr/bin/sh"
  ln -s bash "${pkgdir}/usr/bin/rbash"

  # system-wide configuration files
  install -Dm644 artix.bashrc "$pkgdir/etc/bash/bashrc.d/artix.bashrc"
  install -Dm644 system.bashrc "${pkgdir}/etc/bash/bashrc"
  install -Dm644 system.bash_logout "${pkgdir}/etc/bash/bash_logout"

  # user configuration file skeletons
  install -dm755 "${pkgdir}/etc/skel/"
  install -m644 dot.bashrc "${pkgdir}/etc/skel/.bashrc"
  install -m644 dot.bash_profile "${pkgdir}/etc/skel/.bash_profile"
  install -m644 dot.bash_logout "${pkgdir}/etc/skel/.bash_logout"
}

