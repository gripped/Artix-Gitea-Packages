# Maintainer: Tom Gundersen <teg@jklm.no>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgbase=util-linux
pkgname=(util-linux util-linux-libs)
_tag='d32d74bf433a419f2a8976530fb03669bde722cd' # git rev-parse v${_tag_name}
_tag_name=2.39.2
pkgver=${_tag_name/-/}
pkgrel=1
pkgdesc='Miscellaneous system utilities for Linux'
url='https://github.com/util-linux/util-linux'
arch=('x86_64')
makedepends=('git' 'meson' 'asciidoctor' 'bash-completion' 'libcap-ng'
             'libutempter' 'libxcrypt' 'python' 'udev' 'cryptsetup'
             'libcrypt.so' 'libmagic.so' 'libncursesw.so')
license=('GPL2')
options=('strip')
validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284')  # Karel Zak
source=("git+https://github.com/util-linux/util-linux#tag=${_tag}?signed"
        pam-{login,common,runuser,su}
        'util-linux.sysusers'
        '60-rfkill.rules')
sha256sums=('SKIP'
            '99cd77f21ee44a0c5e57b0f3670f711a00496f198fc5704d7e44f5d817c81a0f'
            '57e057758944f4557762c6def939410c04ca5803cbdd2bfa2153ce47ffe7a4af'
            '48d6fba767631e3dd3620cf02a71a74c5d65a525d4c4ce4b5a0b7d9f41ebfea1'
            'b28f31fcafa401b0eb26bc0c710002acc4f7718f97af45b0d444e4af6dfb15a8'
            '10b0505351263a099163c0d928132706e501dd0a008dac2835b052167b14abe3'
            '7423aaaa09fee7f47baa83df9ea6fef525ff9aec395c8cbd9fe848ceb2643f37')

_backports=(
)

_reverts=(
)

prepare() {
  cd "${pkgbase}"

  local _c _l
  for _c in "${_backports[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git cherry-pick --mainline 1 --no-commit "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git revert --mainline 1 --no-commit "${_c}"
  done

  # do not mark dirty
  sed -i '/dirty=/c dirty=' tools/git-version-gen
}

build() {
  local _meson_options=(
    -Dfs-search-path=/usr/bin:/usr/local/bin

    -Dlibuser=disabled
    -Dncurses=disabled
    -Dncursesw=enabled
    -Deconf=disabled

    -Dbuild-chfn-chsh=enabled
    -Dbuild-line=disabled
    -Dbuild-mesg=enabled
    -Dbuild-newgrp=enabled
    -Dbuild-vipw=enabled
    -Dbuild-write=enabled
    -Dsystemd=disabled
  )

  artix-meson "${pkgbase}" build "${_meson_options[@]}"

  meson compile -C build
}

package_util-linux() {
  conflicts=('rfkill' 'hardlink')
  provides=('rfkill' 'hardlink')
  replaces=('rfkill' 'hardlink')
  depends=('pam' 'shadow' 'coreutils' 'libudev' 'readline' 'glibc' 'zlib'
           'libcap-ng' 'libutempter' 'libxcrypt' 'libcrypt.so' 'util-linux-libs'
           'libmagic.so' 'libncursesw.so')
  optdepends=('words: default dictionary for look')
  backup=(etc/pam.d/chfn
          etc/pam.d/chsh
          etc/pam.d/login
          etc/pam.d/runuser
          etc/pam.d/runuser-l
          etc/pam.d/su
          etc/pam.d/su-l)

  _python_stdlib="$(python -c 'import sysconfig; print(sysconfig.get_paths()["stdlib"])')"

  DESTDIR="${pkgdir}" meson install -C build

  # remove static libraries
  rm "${pkgdir}"/usr/lib/lib*.a*

  # setuid chfn and chsh
  chmod 4755 "${pkgdir}"/usr/bin/{newgrp,ch{sh,fn}}

  # install PAM files for login-utils
  install -Dm0644 pam-common "${pkgdir}/etc/pam.d/chfn"
  install -m0644 pam-common "${pkgdir}/etc/pam.d/chsh"
  install -m0644 pam-login "${pkgdir}/etc/pam.d/login"
  install -m0644 pam-runuser "${pkgdir}/etc/pam.d/runuser"
  install -m0644 pam-runuser "${pkgdir}/etc/pam.d/runuser-l"
  install -m0644 pam-su "${pkgdir}/etc/pam.d/su"
  install -m0644 pam-su "${pkgdir}/etc/pam.d/su-l"

  # runtime libs are shipped as part of util-linux-libs
  install -d -m0755 util-linux-libs/lib/
  mv "$pkgdir"/usr/lib/lib*.so* util-linux-libs/lib/
  mv "$pkgdir"/usr/lib/pkgconfig util-linux-libs/lib/pkgconfig
  mv "$pkgdir"/usr/include util-linux-libs/include
  mv "$pkgdir"/"${_python_stdlib}"/site-packages util-linux-libs/site-packages
  rmdir "$pkgdir"/"${_python_stdlib}"
  mv "$pkgdir"/usr/share/man/man3 util-linux-libs/man3

  # install sysusers
  install -Dm0644 util-linux.sysusers \
    "${pkgdir}/usr/lib/sysusers.d/util-linux.conf"

  install -Dm0644 60-rfkill.rules \
    "${pkgdir}/usr/lib/udev/rules.d/60-rfkill.rules"
}

package_util-linux-libs() {
  pkgdesc="util-linux runtime libraries"
  depends=('glibc')
  provides=('libutil-linux' 'libblkid.so' 'libfdisk.so' 'libmount.so' 'libsmartcols.so' 'libuuid.so')
  conflicts=('libutil-linux')
  replaces=('libutil-linux')
  optdepends=('python: python bindings to libmount')

  install -d -m0755 "$pkgdir"/{"${_python_stdlib}",usr/share/man/}
  mv util-linux-libs/lib/* "$pkgdir"/usr/lib/
  mv util-linux-libs/include "$pkgdir"/usr/include
  mv util-linux-libs/site-packages "$pkgdir"/"${_python_stdlib}"/site-packages
  mv util-linux-libs/man3 "$pkgdir"/usr/share/man/man3
}
