# Maintainer: artist for Artix Linux

pkgname=xorg-server-tearfree
pkgver=21.1.22
pkgrel=2.2
arch=('x86_64')
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
         'X11-distribute-modifications-variant'
)
groups=('xorg')
url="https://xorg.freedesktop.org"
makedepends=('xorgproto' 'pixman' 'libx11' 'mesa' 'mesa-libgl' 'xtrans'
             'libxkbfile' 'libxfont2' 'libpciaccess' 'libxv' 'libxcvt'
             'libxmu' 'libxrender' 'libxi' 'libxaw' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms'
             'libxshmfence' 'libunwind' 'elogind' 'meson' 'git')
source=(xorg-server::git+https://gitlab.freedesktop.org/xorg/xserver.git?signed#tag=xorg-server-${pkgver}
        xvfb-run # with updates from FC master
        xvfb-run.1
        1006.patch   # TearFree support for modesetting driver
        bb5158f962dc935e58ef8b4b5fcb31be201a6e07.patch
        f5abfb61994471023d8c6470428c8e30c411cc0b.patch
        543e108516428fc8c3bea91d6563ad266f9a801e.patch
        867b59b33bee669cb412f1314e47c52eacf6e00b.patch
        bdd7bf57af208b1ddf57d4683d67104443b44812.patch
        6d459e4daf715bea8abdafa8fb130be2f8a1d145.patch
        ecc634f1b2f7aa473d3a267eada98c4918bf9e05.patch
        339c279514326134b0878fc23ce6e9520440ce7f.patch
        b7aa65cc3bb11b792ce2a3f511ba9b863acb11c8.patch
)
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF'  # Peter Hutterer (Who-T) <office@who-t.net>
              '67DC86F2623FC5FD4BB5225D14706DBE1E4B4540'  # Olivier Fourdan <fourdan@xfce.org>
              'FD0004A26EADFE43A4C3F249C6F7AE200374452D'  # Povilas Kanapickas <povilas@radix.lt>
              '3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>

sha512sums=('81644a6a95b387fdd8e5582100d63cf4efbe6353e6a6b9bdd6435555018f6bae9318fb3f67c5a2f574b9b4b997917c077027162f37fc26f94b0745d6f531fba6'
            '672375cb5028ba9cda286e317d17bd8c9a9039483e7f79c21f223fd08ba07655729e9f59a082f4b8f5d8de45a77a9e9affce1002fb8c6657e26ef1a490654e49'
            'de5e2cb3c6825e6cf1f07ca0d52423e17f34d70ec7935e9dd24be5fb9883bf1e03b50ff584931bd3b41095c510ab2aa44d2573fd5feaebdcb59363b65607ff22'
            '16371960eae107543cc207e80991c842bc88f2f6fe95debb53f637986a8ac05e9c21a19ad7f6d6beb059ce6b2d8cae3b3fdea34bce560fa5fafd0087b980feb6'
            'f31b57e19470119d0d58cdc17cfabfffa9e8ec427941b38677c03102e3d01185979fe92b9a832f3659af4d06317b47bab599f645d5f618f28b4333fb96389788'
            'f66a8b3776f84c8222668658d11054faf3cca0c7879da18605e4cbf090c9bcd02fab22971daad974011606a7f9335164b79d97cc4ea215cb90206cb5f45199bd'
            'dd48b419198cbfe199cf851054eec35616eeb5019a78d28eacd0180fe2ce385bbe45f364f598c076fd07b96863ef15f2a772d473e4e3b0a344770437b8b8f047'
            '3a0fff89c9e70a882027b812cafa2cfa7a492e2888b33c1c7a13499c3519b8863ab9acfc9a11634bdcb936cf6ca71c5ab58850679acb9eeb45ebb792f669212a'
            '42e72cf68a29096d5067ee971f1c9f9f71730371f07ff49f86f1400766374cc1817740437ba902622a7dd5f69a8cefea8dd847532f7b646d80be62aa4776e71d'
            '569ab9f92494a0b15d9555f47f7f95fdb16bade03c7617bf41c7037dc9a0cb017a30517bf6eb560801bf23d19ebec140c7157d22dfbcd6ccd9164e749983f750'
            '68e3c8054baee64263e6156459d69f3d5b6af30cd7c3cb43fd20b11111efc53d790126c9809a950d6f0e09ee846106e8d87c0c47c0ca12cd9c76310ff01d95ae'
            '697fd38525c64448f13d8b3376ab97c68a218e10edb8d8f9b13ff2d63b8c5d929a0403be8d82dcee80540e914b2a9c8eba982885e317f7017b7dea952744a345'
            '7ede6e4fac5a8bc64e6b43b0f238dc131a561721cb5b8a680ff5820ee27145f154ede6b289d18e022820e80a9a2ba1f796f1456d0db6e5665776e1f33a31751f')

prepare() {
  cd "xorg-server"

  # TearFree support for modesetting driver
  # https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1006
  patch -Np1 -i "${srcdir}/1006.patch"

  # June 2026 CVE patches:
  patch -Np1 -i "${srcdir}/bb5158f962dc935e58ef8b4b5fcb31be201a6e07.patch"
  patch -Np1 -i "${srcdir}/f5abfb61994471023d8c6470428c8e30c411cc0b.patch"
  patch -Np1 -i "${srcdir}/543e108516428fc8c3bea91d6563ad266f9a801e.patch"
  patch -Np1 -i "${srcdir}/867b59b33bee669cb412f1314e47c52eacf6e00b.patch"
  patch -Np1 -i "${srcdir}/bdd7bf57af208b1ddf57d4683d67104443b44812.patch"
  patch -Np1 -i "${srcdir}/6d459e4daf715bea8abdafa8fb130be2f8a1d145.patch"
  patch -Np1 -i "${srcdir}/ecc634f1b2f7aa473d3a267eada98c4918bf9e05.patch"
  patch -Np1 -i "${srcdir}/339c279514326134b0878fc23ce6e9520440ce7f.patch"
  patch -Np1 -i "${srcdir}/b7aa65cc3bb11b792ce2a3f511ba9b863acb11c8.patch"
}

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, modules fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}

  artix-meson xorg-server build \
    -D ipv6=true \
    -D xvfb=true \
    -D xnest=true \
    -D xcsecurity=true \
    -D xorg=true \
    -D xephyr=true \
    -D glamor=true \
    -D udev=true \
    -D dtrace=false \
    -D systemd_logind=true \
    -D suid_wrapper=true \
    -D linux_acpi=false \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb \
    -D libunwind=true

  # Print config
  # meson configure build
  ninja -C build

  # fake installation to be seperated into packages
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

package_xorg-server-tearfree() {
  pkgdesc="Xorg X server with the tearfree patch for the modesetting driver (enabled by default)"
  depends=(libepoxy libxfont2 pixman "xorg-server-common=$pkgver" 'xf86-input-libinput<2.0.0'
           dbus libgl libunwind nettle libxdmcp sh glibc libxau libelogind libtirpc
           libpciaccess libdrm libxshmfence libxcvt)   # FS#52949
  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=('X-ABI-VIDEODRV_VERSION=25.2' 'X-ABI-XINPUT_VERSION=24.4' 'X-ABI-EXTENSION_VERSION=10.0' 'x-server' "xorg-server=$pkgver" "x11win-server")
  conflicts=('nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting' 'xorg-server')
  replaces=('glamor-egl' 'xf86-video-modesetting')

  _install fakeinstall/usr/bin/{X,Xorg,gtf}
  _install fakeinstall/usr/lib/Xorg{,.wrap}
  _install fakeinstall/usr/lib/xorg/modules/*
  _install fakeinstall/usr/share/X11/xorg.conf.d/10-quirks.conf
  _install fakeinstall/usr/share/man/man1/{Xorg,Xorg.wrap,gtf}.1
  _install fakeinstall/usr/share/man/man4/{exa,fbdevhw,inputtestdrv,modesetting}.4
  _install fakeinstall/usr/share/man/man5/{Xwrapper.config,xorg.conf,xorg.conf.d}.5

  # distro specific files must be installed in /usr/share/X11/xorg.conf.d
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "xorg-server/COPYING"
}

