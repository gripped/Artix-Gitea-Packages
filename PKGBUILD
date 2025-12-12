# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=bash
_basever=5.3
_patchlevel=9
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
b2sums=('82d1b54322bbd1e8c2a93380f1b2888a42a1d7186e504f41cee705a0fdd41463d8f20baa1755051e1396192f8ebd089524767d933a9e0b5fb76f2588601539bb'
        'SKIP'
        '93e55e4e1b7e133c0d03733121bb12ba9c64230ff328280ac68a5d1fca0f83637159c0861bca0c30eda61ca14d5a319cd38424959e84344e188c0349cd159ba7'
        '2d53f99e485218ed47f2e40907023645594ac8ffcf00d0569050d54a8f4dabe0a2bdcab515a45b663283c2e6299d805b923ea7b7b789c6a4150c37a98a5b117c'
        'dbfe5c1aaea94419305c1f8c9b54b94eab515260910f2309360ff702a27032faa34514e70b31adbb1e41bd912d4e43a610939cb07565f43e05dd19813a81752e'
        'ff7b83a0542bba7d50d75b8e258b1de9bf00442fd66a52d6092494524461d03da7386def13be24b71c7ade5a890467692f9596583a4c9844244d7d68fb51e05c'
        'eed9da98cd4b7cf9db720e9820cf809a9168cb84a8466127ff588d041badc66cc3fd657e897c702cf0b6d19aefc7b880d976aead003594a2e980d98b17ff886f'
        '830d042bc0b3473260844e9aa3bca3e14d4ae60264b1f7760f69168cd4db9d0d5b41c1887463b23663e52e9a6a611ef8a99be82c737f0760eaaaf97f7eec35db'
        'ca275ade6a7132d316a4d1ffd401c9bfc6de691c58531385d85087c4d50723aeacb5b4bc7abef0165b4fb3cbed146a0fefd9dae4c99c1547f61618798a772d29'
        'SKIP'
        'fec52c475b8126774290eab7a514f8145ae51edab150d413c09f5540719c9578fe1cb99987b6190a9cd82bd947e059c32e740a03d26e9d472af51356cafd8a32'
        'SKIP'
        '6bb6f6679726d65f95c11b4ac1fb0729eaebfeef02de06e9fda4e3ac2bb3d328cc6f7fd6e29976a0907390ed6709cd5a0a6046682acbed73eb0470143bf144e1'
        'SKIP'
        '6f3dcb7ca264868b235e25296b778152383e0f728a87f462fafb30d3c3e0334f8ac8bd862ed82e117641b34f4bd5bbb89ff118462f8a4d716049b651e6c4b0a6'
        'SKIP'
        '792a8f489f36537da9ac1c986ceeed99465cca1740a865c15f8c4942afcc9ee413117f789e18f13daeacd94079425ce0089edbfd4f9f30af56bec0ed15a02dc4'
        'SKIP'
        '92e1cac8784c463f143a1bbad088cb6a4451ef5d864f04205831ffe8835b3d5723e4bfc3ca864a77074afcdb14f627c728f796cb85c050c21916c16d1f990f18'
        'SKIP'
        '5939ba2b3e0dbd83ecb51b47e71f35e32e7647fad1bedf0f00b73cc279b91de977b1cae7314b87483f62cbc0888a739b39528f0ca882a26bc81cc9b9898336e3'
        'SKIP'
        '7ebe5ac77d3697da01ad7beb88a8fdaeac3ac2fb671cc5151ce10428044b4f5fd7ea13e35c91eef1a7d6027f9053a57a27864d5f6a935d48d6cd2be6a9239233'
        'SKIP'
        '09ddf6b605d409142a4107bd52c8b48a91a225d65b867b5074c8b5359d0b1012d2f50e54d1d5636b3413431cf4840d6bd34f9c84f062f3ead96eeaf912127532'
        'SKIP')

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

