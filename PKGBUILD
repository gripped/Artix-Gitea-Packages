# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=sox
pkgver=14.7.0.8
pkgrel=1
pkgdesc='The Swiss Army knife of sound processing tools'
arch=(x86_64)
url='https://codeberg.org/sox_ng/sox_ng/'
license=(GPL-2.0-only)
depends=(
  glibc
  ffmpeg
  file
  gsm
  libao
  libid3tag
  libltdl
  libmad
  libgcc
  libgomp
  libpng
  opusfile
  twolame
  wavpack
  zlib
)
makedepends=(
  alsa-lib
  flac
  fftw
  git
  lame
  libpulse
  libsndfile
  libvorbis
  libogg
  opencore-amr
  speexdsp
)
checkdepends=(time)
optdepends=(
  'alsa-lib: alsa plugin'
  'flac: flac plugin'
  'fftw: fftw support'
  'lame: mp3 plugin'
  'libpulse: pulse plugin'
  'libsndfile: caf, fap, mat4, mat5, paf, pvf, sd2, sndfile, w64 and xi plugins'
  'libvorbis: vorbis plugin'
  'libogg: ogg plugin'
  'opencore-amr: amr_nb and amr_wb plugins'
  'speexdsp: speexdsp plugin/effect'
)
provides=(libsox.so libsox_ng.so)
source=("$pkgname::git+https://codeberg.org/sox_ng/sox_ng.git#tag=sox_ng-${pkgver}")
sha512sums=('e20ca2afb7e396be450e7f8d94ff3ee1cfd134576a4c3e7662b036e71e37aeaa8cec49f28c30d6b29d3707c8eb73dd70a84526b54e7e98d9dae6a09bc79243ac')
b2sums=('d81676aab259174386905cba39cd3c86635314de149bc646eb574712aa9f4cb9465c6f7d2e144e8686528bed1fbfd3cdd7841ff5e44e017e3dea185f248f849d')

prepare() {
  cd "$pkgname"

  autoreconf -vfi
}

build() {
  cd "$pkgname"

  local configure_flags=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --enable-replace
    --with-distro="Arch Linux"
    --with-ffmpeg
  )

  ./configure "${configure_flags[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make all README
}

check() (
  cd "$pkgname/src"

  export DESTDIR="${PWD}/tmp"
  mkdir -p "${DESTDIR}"

  export LD_LIBRARY_PATH="${DESTDIR}/usr/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

  make sox_sample_test
  make install
  make installcheck
)

package() {
  cd "$pkgname"

  make DESTDIR="${pkgdir}" install

  # documentation
  install -vDm644 \
    -t "$pkgdir/usr/share/doc/$pkgname" \
    AUTHORS ChangeLog README
}
