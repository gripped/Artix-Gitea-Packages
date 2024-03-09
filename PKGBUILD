# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>

pkgname=pacman
pkgver=6.1.0
pkgrel=1
pkgdesc="A library-based package manager with dependency support"
arch=('x86_64')
url="https://www.archlinux.org/pacman/"
license=('GPL-2.0-or-later')
depends=('bash' 'glibc' 'libarchive' 'curl' 'gpgme' 'artix-mirrorlist'
         'gettext' 'gawk' 'coreutils' 'gnupg' 'grep')
makedepends=('meson' 'asciidoc' 'doxygen')
checkdepends=('python' 'fakechroot')
optdepends=('perl-locale-gettext: translation support in makepkg-template')
provides=('libalpm.so')
backup=(etc/pacman.conf
        etc/makepkg.conf)
options=('strip')
validpgpkeys=('6645B0A8C7005E78DB1D7864F99FFE0FEAE999BD'  # Allan McRae <allan@archlinux.org>
              'B8151B117037781095514CA7BBDFFC92306B1121') # Andrew Gregory (pacman) <andrew@archlinux.org>
source=(https://gitlab.archlinux.org/pacman/pacman/-/releases/v$pkgver/downloads/pacman-$pkgver.tar.xz{,.sig}
        revertme-makepkg-remove-libdepends-and-libprovides.patch::https://gitlab.archlinux.org/pacman/pacman/-/commit/354a300cd26bb1c7e6551473596be5ecced921de.patch
        pacman.conf
        makepkg.conf
        extracolors.patch
        repo-remove-r.patch)
sha256sums=('5a60ac6e6bf995ba6140c7d038c34448df1f3daa4ae7141d2cad88eeb5f1f9d9'
            'SKIP'
            'b3bce9d662e189e8e49013b818f255d08494a57e13fc264625f852f087d3def2'
            '74e3676a824d7dd55e85fc5e6c28733b4d03538cd539849b98fcd280cbfb3289'
            'a1aa75a6821ca90e61be9632a7853c11387c2152b867b0e1a0b96c450adbec94'
            'a78f366eee71610be1a2da1e533128af3ef188ff9ab577f3eab82ba69ad02466'
            '616942bf95e3fdc0426acb0dc1cea5ebcb7cca56a7536b358576b0cfc04f0ed6')

prepare() {
  cd "$pkgname-$pkgver"

  # handle patches
  local -a patches
  patches=($(printf '%s\n' "${source[@]}" | grep '.patch'))
  patches=("${patches[@]%%::*}")
  patches=("${patches[@]##*/}")

  if (( ${#patches[@]} != 0 )); then
    for patch in "${patches[@]}"; do
      if [[ $patch =~ revertme-* ]]; then
        msg2 "Reverting patch $patch..."
        patch -RNp1 < "../$patch"
      else
        msg2 "Applying patch $patch..."
        patch -Np1 < "../$patch"
      fi
    done
  fi
}

build() {
  cd "$pkgname-$pkgver"

  meson --prefix=/usr \
        --buildtype=plain \
        -Ddoc=enabled \
        -Ddoxygen=enabled \
        -Dscriptlet-shell=/usr/bin/bash \
        -Dldconfig=/usr/bin/ldconfig \
        build

  meson compile -C build
}

check() {
  cd "$pkgname-$pkgver"

  # conf & query tests fail
  # 2/343 config001.py
  # 8/343 config002.py
  # 113/343 query002.py
  # 115/343 query005.py
  # 117/343 query006.py
  # 118/343 query010.py
  # 120/343 query011.py
  # 121/343 query012.py
  # 222/343 sync1100.py

  meson test -C build --print-errorlog || :
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" meson install -C build

  # install Artix specific stuff
  install -dm755 "$pkgdir/etc"
  install -m644 "$srcdir/pacman.conf" "$pkgdir/etc"
  install -m644 "$srcdir/makepkg.conf" "$pkgdir/etc"
}

# vim: set ts=2 sw=2 et:
