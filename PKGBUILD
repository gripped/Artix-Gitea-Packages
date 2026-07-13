# Maintainer: artist for Artix Linux

pkgbase=evi
pkgname=('evi' 'evi-runtime' 'egvi')
pkgver=10.0
_commit=34df8a851b5a82521ba1a73829251cb3f094201a
_versiondir=100
pkgrel=65.6
pkgdesc='EVi, a hard-fork of Vim v9.1.0 (Jan 2024) before AI was used in the project.'
url='https://codeberg.org/evi-editor/evi'
arch=('x86_64')
license=('custom:vim')
makedepends=(
  gawk
  git
  glibc
  gpm
  gtk3
  libcanberra
  libgcrypt
  libxt
  lua
  perl
  python
  ruby
  tcl
  zlib
)
source=("git+${url}.git#commit=${_commit}"
        evirc
        artixlinux.evi
        evidoc.hook)
sha256sums=('82a30695969d007ee25eacd4fa381095fd7b9fdd050844aaee2a04d3a76ae81c'
            'cd887e2fd87c24b00d1123085ea2a27f1076a2c708a456d361da0b447c70533d'
            'cc3d931129854c298eb22e993ec14c2ad86cc1e70a08a64496f5e06559289972'
            'f230cf5feb2f24e4848f68d0555183c7b758b4e78635c40879abb761b6225d31')

prepare() {
  (cd $pkgbase/src
    # define the place for the global evirc file (set to /etc/evirc)
    sed -E 's|^.*(#define SYS_.*EVIRC_FILE.*").*$|\1|g' -i feature.h
    sed -E 's|^.*(#define EVIRC_FILE.*").*$|\1|g' -i feature.h
    autoconf
  )
  cp -a evi egvi
}

build() {
 export CFLAGS+=" -Wno-error=incompatible-pointer-types"
  msg2 "Building vim..."
  (cd $pkgbase
    ./configure \
      --prefix=/usr \
      --localstatedir=/var/lib/evi \
      --with-features=huge \
      --with-compiledby='Artix Linux' \
      --with-wayland=no \
      --enable-gpm \
      --enable-acl \
      --with-x=no \
      --disable-gui \
      --enable-multibyte \
      --enable-cscope \
      --enable-netbeans \
      --enable-perlinterp=dynamic \
      --enable-pythoninterp=no \
      --enable-python3interp=yes \
      --enable-rubyinterp=dynamic \
      --enable-luainterp=dynamic \
      --enable-tclinterp=dynamic \
      --disable-canberra
    make
  )

  msg2 "Building gvim..."
  (cd egvi
    ./configure \
      --prefix=/usr \
      --localstatedir=/var/lib/vim \
      --with-features=huge \
      --with-compiledby='Arch Linux' \
      --enable-gpm \
      --enable-acl \
      --with-x=yes \
      --enable-gui=gtk3 \
      --enable-multibyte \
      --enable-cscope \
      --enable-netbeans \
      --enable-perlinterp=dynamic \
      --enable-pythoninterp=no \
      --enable-python3interp=yes \
      --enable-rubyinterp=dynamic \
      --enable-luainterp=dynamic \
      --enable-tclinterp=dynamic \
      --enable-canberra
    make
  )
}

check() {
  cd $pkgbase
  #TERM=xterm make -j1 test
}

package_evi-runtime() {
  pkgdesc+=' (shared runtime)'
  optdepends=('sh: support for some tools and macros'
              'python: demoserver example tool'
              'gawk: mve tools upport')
  conflicts=('vim-runtime')
  backup=('etc/evirc')

  cd $pkgbase

  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install
  # man and bin files belong to 'evi'
  rm -r "${pkgdir}"/usr/share/man/ "${pkgdir}"/usr/bin/

  # Don't forget logtalk.dict
  install -Dm 644 runtime/ftplugin/logtalk.dict \
    "${pkgdir}"/usr/share/efi/evi${_versiondir}/ftplugin/logtalk.dict

  # rc files
  install -Dm 644 "${srcdir}"/evirc "${pkgdir}"/etc/evirc
  install -Dm 644 "${srcdir}"/artixlinux.evi \
    "${pkgdir}"/usr/share/evi/evifiles/artixlinux.evi

  # no desktop files and icons
  rm -r "${pkgdir}"/usr/share/{applications,icons}

  # license
  install -dm 755 "${pkgdir}"/usr/share/licenses/evi-runtime
  ln -s /usr/share/evi/evi${_versiondir}/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/evi-runtime/license.txt
}

package_evi() {
  depends=("evi-runtime=${pkgver}-${pkgrel}" 'gpm' 'acl' 'glibc' 'libgcrypt' 'zlib')
  optdepends=("ex-evi-compat: The ex and vi commands based on EVi's compatibility modes"
              'python: Python language support'
              'ruby: Ruby language support'
              'lua: Lua language support'
              'perl: Perl language support'
              'tcl: Tcl language support')
  conflicts=('vim' 'gvim' 'vim-minimal')
  provides=('vim' 'xxd' 'vim-minimal' 'vim-plugin-runtime')
  replaces=('vim-minimal')

  cd $pkgbase
  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  ln -sv /usr/bin/evi "${pkgdir}/usr/bin/vim"

  # provided by (n)vi in core
  rm "${pkgdir}"/usr/bin/{ex,view}

  # delete some manpages
  find "${pkgdir}"/usr/share/man -type d -name 'man1' 2>/dev/null | \
    while read _mandir; do
    cd "${_mandir}"
    rm -f ex.1 view.1 # provided by (n)vi
    rm -f evim.1    # this does not make sense if we have no GUI
  done

  # Runtime provided by runtime package
  rm -r "${pkgdir}"/usr/share/evi

  # NOT anymore: remove gvim.desktop as not included
  # rm "${pkgdir}"/usr/share/applications/gvim.desktop

  # license
  install -Dm 644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt

  # pacman hook for documentation helptags
  install -Dm 644 "${srcdir}"/evidoc.hook "${pkgdir}"/usr/share/libalpm/hooks/evidoc.hook
}

package_egvi() {
  pkgdesc+=' (with advanced features, such as a GUI)'
  depends=("evi-runtime=${pkgver}-${pkgrel}" 'gpm' 'libxt' 'gtk3' 'glibc' 'libgcrypt'
           'zlib' 'libcanberra')
  optdepends=('python: Python language support'
              'ruby: Ruby language support'
              'lua: Lua language support'
              'perl: Perl language support'
              'tcl: Tcl language support')
  provides=("evi=${pkgver}-${pkgrel}" "xxd" 'vim-plugin-runtime')
  conflicts=('vim-minimal' 'vim')

  cd egvi
  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  ln -sv /usr/bin/evi "${pkgdir}/usr/bin/gvim"
  ln -sv /usr/bin/evi "${pkgdir}/usr/bin/egvi"

  # provided by (n)vi in core
  rm "${pkgdir}"/usr/bin/{ex,view}

  # delete some manpages
  find "${pkgdir}"/usr/share/man -type d -name 'man1' 2>/dev/null | \
    while read _mandir; do
    cd "${_mandir}"
    rm -f ex.1 view.1 # provided by (n)vi
  done

  # need to remove since this is provided by evi-runtime
  rm -r "${pkgdir}"/usr/share/evi

  # license
   install -Dm 644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt

  # pacman hook for documentation helptags
  install -Dm 644 "${srcdir}"/evidoc.hook "${pkgdir}"/usr/share/libalpm/hooks/evidoc.hook
}

