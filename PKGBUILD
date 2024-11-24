# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=pam
pkgver=1.7.0
pkgrel=1.1
pkgdesc="PAM (Pluggable Authentication Modules) library"
arch=('x86_64')
license=('GPL-2.0-only')
url="http://linux-pam.org"
depends=(
  audit
  glibc
  libaudit.so
  libcrypt.so
  libnsl
  libtirpc
  libxcrypt
  pambase
  libelogind
)
makedepends=(
  docbook-xml
  docbook-xsl
  docbook5-xml
  flex
  fop
  git
  libxslt
  meson
  w3m
)
provides=(
  libpam.so
  libpamc.so
  libpam_misc.so
)
backup=(
  etc/security/{access.conf,faillock.conf,group.conf,limits.conf,namespace.conf,namespace.init,pwhistory.conf,pam_env.conf,time.conf} 
  etc/environment
)
source=("pam::git+https://github.com/linux-pam/linux-pam?signed#tag=v${pkgver}"
        "${pkgname}.tmpfiles"
        0001-meson-support-elogind-as-a-logind-provider.patch)
validpgpkeys=(
        '8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB' # Thorsten Kukuk
        '296D6F29A020808E8717A8842DB5BD89A340AEB7' # Dimitry V. Levin <ldv@altlinux.org>
)
b2sums=('88ecba59692fe86f6f6516007b87fb897018cc5f818c106a037f15df4dda7c31e50fbfcb137493d49cb754e41f2f69a60f24ffea3374ff5e38ce6263bfa7abac'
        '36582c80020008c3810b311a2e126d2fb4ffc94e565ea4c0c0ab567fdb92943e269781ffa548550742feb685847c26c340906c7454dcc31df4e1e47d511d8d6f'
        'd725c16b045971f5e25aed0b6fd2a7efb329cc38600c8fc4534a2ed3422b9d90f3e47ed72c12d86ec538395d6b21852dc04539b7969115deb4b169bee693ce9c')
options=('!emptydirs')

prepare() {
  cd "${pkgname}"
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch ${src}..."
    patch -Np1 < "../${src}"
  done
}

build() {
  artix-meson "${pkgname}" \
    -Dlogind=enabled \
    -Deconf=disabled \
    -Dselinux=disabled \
    -Dpam_userdb=disabled \
    -Dsystemdunitdir=/usr/lib/systemd \
    build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm 644 $pkgname.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf

  # set unix_chkpwd uid
  chmod +s "${pkgdir}"/usr/bin/unix_chkpwd

  rm -r ${pkgdir}/usr/lib/systemd
}

