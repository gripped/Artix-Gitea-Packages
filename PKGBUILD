# Maintainer: artist for Artix Linux and XLibre <artist@artixlinux.org> 

pkgbase=xlibre-xserver-beta
_pkgbase=xlibre-xserver
pkgname=($_pkgbase-beta $_pkgbase-xephyr-beta $_pkgbase-xvfb-beta $_pkgbase-xnest-beta $_pkgbase-common-beta $_pkgbase-devel-beta $_pkgbase-src-beta)
pkgver=25.1.5
pkgrel=3
arch=(x86_64 aarch64)
license=('LicenseRef-Adobe-Display-PostScript'
         'BSD-3-Clause' 
         'LicenseRef-DEC-3-Clause' 
         'HPND'
         'LicenseRef-HPND-sell-MIT-disclaimer-xserver'
         'HPND-sell-variant' 
         'ICU'
         'ISC'
         'MIT'
         'MIT-open-group'
         'NTP'
         'SGI-B-2.0'
         'SMLNJ'
         'X11'
         'X11-distribute-modifications-variant')
groups=('xlibre')
url="https://github.com/X11Libre/xserver"
makedepends=('xorgproto' 'pixman' 'libx11' 'mesa' 'mesa-libgl'
             'libxkbfile' 'libxfont2' 'libpciaccess' 'libxv' 'libxcvt'
             'libxmu' 'libxrender' 'libxi' 'libxaw' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms'
             'libxshmfence' 'libunwind' 'meson' 'dbus')
source=("${url}/archive/refs/tags/${_pkgbase}-${pkgver}.tar.gz"
        xvfb-run # with updates from FC master
        xvfb-run.1)

build() {
  case "$CARCH" in
    "x86_64")
      CFLAGS=" -march=x86-64"
      ;;
    "aarch64")
      CFLAGS=" -march=armv8-a"
      ;;
    *)
      CFLAGS=" -march=native"
      ;;
  esac
  CFLAGS+=" -mtune=generic -O2 -pipe -fexceptions -Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security"
  CFLAGS+=" -fstack-clash-protection -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer"
  LDFLAGS=" -Wl,-O1 -Wl,--sort-common -Wl,--as-needed -Wl,-z,lazy -Wl,-z,relro -Wl,-z,pack-relative-relocs"
  if [[ $CARCH != 'aarch64' ]]; then
    CFLAGS+=" -fcf-protection"
  fi
  if [[ "$_pkgname" == *"xf86-input"* ]]; then
    CFLAGS+=" -fno-plt"
    LDFLAGS+=" -Wl,-z,now"
  fi
  if [[ "$_pkgname" == *"xf86-video-intel"* ]]; then
    CFLAGS+=" -fno-lto"
    LDFLAGS+=" -fno-lto"
  fi
  CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
  export CFLAGS="${CFLAGS}"
  export CXXFLAGS="${CXXFLAGS}"
  export LDFLAGS="${LDFLAGS}"

  artix-meson xserver-${_pkgbase}-${pkgver} build \
    --buildtype=release \
    -D ipv6=true \
    -D xvfb=true \
    -D xnest=true \
    -D xcsecurity=true \
    -D xorg=true \
    -D xephyr=true \
    -D xfbdev=true \
    -D glamor=true \
    -D udev=true \
    -D udev_kms=true \
    -D dtrace=false \
    -D systemd_logind=true \
    -D suid_wrapper=true \
    -D linux_acpi=false \
    -D legacy_nvidia_padding=true \
    -D legacy_nvidia_340x=true \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb \
    -D libunwind=true 

  meson configure build
  ninja -C build

  DESTDIR="${srcdir}/fakeinstall" ninja -C build install
}

_install() {
  local src f dir
  for src; do
    f="${src#fakeinstall/}"
    dir="${pkgdir}/${f%/*}"
    install -m755 -d "${dir}"
    # use copy so a new file is created and fakeroot can track properties such as setuid
    cp -av "${src}" "${dir}/"
    rm -rf "${src}"
  done
}

package_xlibre-xserver-common-beta() {
  pkgdesc="XLibre fork of X.Org Xorg server common files"
  depends=(xkeyboard-config xorg-xkbcomp xorg-setxkbmap)
  provides=('xlibre-xserver-common' 'xorg-server-common')
  conflicts=('xlibre-xserver-common' 'xorg-server-common')

  _install fakeinstall/usr/lib/xorg/protocol.txt
  _install fakeinstall/usr/share/man/man1/Xserver.1

  install -m644 -Dt "${pkgdir}/var/lib/xkb/" "xserver-${_pkgbase}-${pkgver}"/xkb/README.compiled
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${_pkgbase}-${pkgver}"/COPYING
}

package_xlibre-xserver-beta() {
  pkgdesc="XLibre fork of X.Org X server"
  depends=("xlibre-xserver-common=${pkgver}" xlibre-input-libinput libepoxy libxfont2 pixman libunwind
           dbus libgl nettle libxdmcp sh glibc libxau libtirpc libbsd
           libpciaccess libdrm libxshmfence libxcvt) # FS#52949
  provides=('xlibre-xserver' 'xorg-server' 'X-ABI-VIDEODRV_VERSION=28.0' 'X-ABI-XINPUT_VERSION=26.0' 'X-ABI-EXTENSION_VERSION=11.0' 'x-server' 'x11win-server')
  conflicts=('xlibre-xserver' 'xorg-server' 'nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting')
  replaces=('glamor-egl' 'xf86-video-modesetting')

  _install fakeinstall/usr/bin/{X,Xorg,gtf,Xfbdev}
  _install fakeinstall/usr/lib/Xorg{,.wrap}
  _install fakeinstall/usr/lib/xorg/modules/*
  _install fakeinstall/usr/share/X11/xorg.conf.d/10-{nvidia,quirks}.conf
  _install fakeinstall/usr/share/man/man1/{Xorg,Xorg.wrap,gtf,Xfbdev}.1
  _install fakeinstall/usr/share/man/man4/{exa,fbdevhw,inputtestdrv,modesetting}.4
  _install fakeinstall/usr/share/man/man5/{Xwrapper.config,xorg.conf,xorg.conf.d}.5

  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${_pkgbase}-${pkgver}"/COPYING
}

package_xlibre-xserver-xephyr-beta() {
  pkgdesc="XLibre fork of X.Org nested X server that runs as an X application"
  depends=(xlibre-xserver-common=${pkgver} libxfont2 libgl libepoxy libunwind
           xcb-util-image xcb-util-renderutil xcb-util-wm xcb-util-keysyms pixman
           nettle libtirpc xcb-util libxdmcp libx11 libxau libxshmfence glibc)
  provides=('xlibre-xserver-xephyr' 'xorg-server-xephyr')
  conflicts=('xlibre-xserver-xephyr' 'xorg-server-xephyr')

  _install fakeinstall/usr/bin/Xephyr
  _install fakeinstall/usr/share/man/man1/Xephyr.1

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${_pkgbase}-${pkgver}"/COPYING
}

package_xlibre-xserver-xvfb-beta() {
  pkgdesc="XLibre fork of X.Org virtual framebuffer X server"
  # xvfb-run is GPLv2, rest is MIT
  license=('MIT' 'GPL-2.0-only')
  depends=("xlibre-xserver-common=${pkgver}" libxfont2 libunwind pixman xorg-xauth 
           libgl nettle libtirpc
           libxdmcp sh glibc libxau)
  provides=('xlibre-xserver-xvfb' 'xorg-server-xvfb')
  conflicts=('xlibre-xserver-xvfb' 'xorg-server-xvfb')

  _install fakeinstall/usr/bin/Xvfb
  _install fakeinstall/usr/share/man/man1/Xvfb.1

  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/" # outda

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${_pkgbase}-${pkgver}"/COPYING
}

package_xlibre-xserver-xnest-beta() {
  pkgdesc="XLibre fork of X.Org nested X server that runs as an X application"
  depends=("xlibre-xserver-common=${pkgver}" libxfont2 libunwind libxext pixman nettle
           libtirpc
           libxdmcp glibc libx11 libxau)
  provides=('xlibre-xserver-xnest' 'xorg-server-xnest')
  conflicts=('xlibre-xserver-xnest' 'xorg-server-xnest')

  _install fakeinstall/usr/bin/Xnest
  _install fakeinstall/usr/share/man/man1/Xnest.1

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${_pkgbase}-${pkgver}"/COPYING
}

package_xlibre-xserver-devel-beta() {
  pkgdesc="XLibre fork of X.Org development files for the X.Org X server"
  depends=("xlibre-xserver=${pkgver}" 'xorgproto' 'mesa' 'libpciaccess' 'pixman'
           # not technically required but almost every Xorg pkg needs it to build
           'xorg-util-macros')
  provides=('xlibre-xserver-devel' 'xorg-server-devel')
  conflicts=('xlibre-xserver-devel' 'xorg-server-devel')

  _install fakeinstall/usr/include/xorg/*
  _install fakeinstall/usr/lib/pkgconfig/{xorg,xlibre}-server.pc
  _install fakeinstall/usr/share/aclocal/xorg-server.m4

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xserver-${_pkgbase}-${pkgver}"/COPYING

  find fakeinstall -depth -print0 | xargs -0 rmdir
}

package_xlibre-xserver-src-beta() {
  pkgdesc="Source files of the XLibre X server"
  provides=('xlibre-xserver-src')
  conflicts=('xlibre-xserver-src')

  install -d "${pkgdir}"/usr/src/
  cd "${pkgdir}"/usr/src/
  tar xf "${srcdir}/${_pkgbase}-${pkgver}.tar.gz"
  mv "xserver-${_pkgbase}-${pkgver}" ${_pkgbase}
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}"/COPYING
  rm -rf ${_pkgbase}/{.*,*.md,COPYING,NEWS,usr/share}
}

sha256sums=('7ee3612e7674595d7cef337d6955fddf02e63719cbc2607b29d80a17891eca0e'
            '27ce50f4432e5549e662db857118761fa9cd74c6900aac52c4db768c956838db'
            '2460adccd3362fefd4cdc5f1c70f332d7b578091fb9167bf88b5f91265bbd776')
 
