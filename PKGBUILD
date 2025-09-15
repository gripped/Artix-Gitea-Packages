# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=jami-daemon
pkgver=20250912
pkgrel=1
pkgdesc="Free and universal communication platform which preserves the users’ privacy and freedoms (daemon component)"
arch=(x86_64)
url="https://jami.net"
license=(GPL-3.0-or-later)
groups=(jami)
depends=(glibc opendht gnutls nettle libgit2 libsecp256k1 libsecp256k1.so ffmpeg speexdsp
         fmt yaml-cpp jsoncpp zlib alsa-lib libpulse jack libupnp libnatpmp
         openssl webrtc-audio-processing-0.3 libudev libarchive)
# portaudio needs a not-yet-upstream patch https://git.jami.net/savoirfairelinux/jami-daemon/-/issues/650
makedepends=(git cmake perl asio msgpack-c msgpack-cxx restinio udev meson)
checkdepends=(cppunit)
_commit=ce82bdbbf38e7f7ac9d675bfc959e4d7f7ac387
_pjprojectver=37130c943d59f25a71935803ea2d84515074a237
_dhtnetver=deee57b6dd8c32e3706a413a74733f2ed5c6de12
source=(git+https://git.jami.net/savoirfairelinux/${pkgname}.git#commit=${_commit}
        https://github.com/savoirfairelinux/pjproject/archive/${_pjprojectver}/pjproject-${_pjprojectver}.tar.gz
        dhtnet-$_dhtnetver.tar.gz::https://github.com/savoirfairelinux/opendht/archive/$_dhtnetver.tar.gz
        ffmpeg-7.patch)
noextract=(pjproject-${_pjprojectver}.tar.gz
           dhtnet-${_dhtnetver}.tar.gz)
sha512sums=('91d9ff98033f4fd889d1c68fcc1a7b59923627178576a831dde2ddcd5f588c74cab0fec8c3e4c6893e7ceedf66275dd7c50acef28fa8e63602895f689e34ced8'
            '2e9bf2bb6a87fde551723f6d1ba8c9f5f5545d5a11e78e2d2d8302c784c721b4b452cfe0b548000eb5913a1d9692839936e8ebc09ea156f5c2e6a6273d461642'
            'f8389ddf1aeee0db3ecad642918ae5ccc4135e39ad29a23a27d63868307bcf8749a5124d296374397a9f18ec192700e5d07f9d275fab2c2120d8729976853e64'
            '720c60053779e72273d7abf339008284f5473b4f9a101e21eae352e9663559c7591f8e3481d9b479d113f306da9d0b3ffa53d32091c8d795b3252afd7e39afec')

pkgver() {
  cd ${pkgname}
  TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD
}

prepare() {
  cd ${pkgname}
  mkdir -p contrib/tarballs
  cp ../pjproject-${_pjprojectver}.tar.gz contrib/tarballs/
  cp ../dhtnet-$_dhtnetver.tar.gz contrib/tarballs/
  mkdir -p contrib/native

  patch -p1 -i ../ffmpeg-7.patch # Fix build with ffmpeg 7
}

build() {
  cd ${pkgname}/contrib/native
  ../bootstrap \
      --disable-downloads \
      --disable-all \
      --enable-pjproject \
      --enable-dhtnet

  # fmt v11 compatibility
  make dhtnet
  sed -io 's/fmt::ptr(pimpl_)/fmt::ptr(pimpl_.get())/g' dhtnet/src/ice_transport.cpp

  make DEPS_pjproject= DEPS_dhtnet=pjproject

  cd "${srcdir}"
  artix-meson ${pkgname} build -D interfaces=library -D opensl=disabled -D portaudio=disabled \
                              $( ((CHECKFUNC)) && echo -D tests=true) \
                              -D pkg_config_path="${PWD}/${pkgname}/contrib/$(cc -dumpmachine)/lib/pkgconfig"
  meson compile -C build
}

#check() {
# https://git.jami.net/savoirfairelinux/jami-daemon/-/issues/649
#  meson test -C build --print-errorlogs
#}

package() {
  meson install -C build --destdir "${pkgdir}"
}
