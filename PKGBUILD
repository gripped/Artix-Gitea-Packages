# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgbase=alsa-plugins
pkgname=(alsa-plugins pulseaudio-alsa)
pkgver=1.2.7.1
pkgrel=3
epoch=1
pkgdesc="Additional ALSA plugins"
arch=(x86_64)
url="https://www.alsa-project.org"
license=(LGPL2.1)
makedepends=(
  alsa-lib
  dbus
  ffmpeg
  jack
  libavtp
  libpulse
  libsamplerate
  speexdsp
)
source=(
  https://www.alsa-project.org/files/pub/plugins/$pkgbase-$pkgver.tar.bz2{,.sig}
  pulse-sysdefault.diff
  ffmpeg7.patch
)
sha512sums=('437c05a7e0175594768fd6a9a6d1a158bb4a01a7de6a42c2bd468d9381e01b64d385ddfac7d87baf84fe13cb4e65dc24da643940f416d4b191c528728822d964'
            'SKIP'
            'b8c8e55f4da0ae87cc44d75a906d00b4f1e2304e6bc10419c6e0913c8f7d29599a3f3d41733decbe412a4669ea0d5af2a57f85b1655fba3625fbbd33c956f3f9'
            '36237408a6bef34ce580a6492bba0ede1cb6832218c9c3d33b70ee856616be44a5c9b78d12a4d724308d195ad930f9f596cd5115dd5c696826b4ae32865293b8')
b2sums=('6f7aa503eda879cd273f36a16eec702b4da9267a60835cb5acbbfe355a83b7ffa3e93eb6483c9946c1d0bcd845a8f574470e7b84c66f793d0d0c6c9883ad52ee'
        'SKIP'
        '83c16b77c1737b2b59b60302be22b63e53026a366799fd97fe3c03b86756063d1b9689d5ffc7c793b40db55bdb79a5b6d72a17e0c8aa32364d6e639cf7ad3ce0'
        '3dbc0ef33959fbf4975a1e62cedeb3aa8dcbd5565dfbaafd1b5a221648f545c50e2bb2cc22c42a09ac628961ae647eeca81282d777c89dce04fa9c35ccf57277')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

prepare() {
  cd $pkgbase-$pkgver

  # Make use of the pulse plugin's "fallback" feature
  # Keeps parity with our old config from pulseaudio-alsa
  patch -Np1 -i ../pulse-sysdefault.diff
  
  patch -p1 -i ../ffmpeg7.patch # Fix build with FFmpeg 7

  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --enable-maemo-plugin
    --enable-maemo-resource-manager
  )

  cd $pkgbase-$pkgver
  ./configure "${configure_options[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_alsa-plugins() {
  depends=(
    alsa-lib libasound.so
    glibc
  )
  optdepends=(
    'dbus: for maemo plugin'
    'ffmpeg: for pcm_a52 plugin'
    'jack: for pcm_jack plugin'
    'libavtp: for pcm_aaf plugin'
    'libsamplerate: for rate_samplerate plugin'
    'libpulse: for conf_pulse, ctl_pulse and pcm_pulse plugins'
    'speexdsp: for pcm_speex and rate_speexrate plugins'
  )

  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm 644 doc/README* doc/*.txt -t "$pkgdir/usr/share/doc/$pkgbase"

  # remove maemo plugin configuration (it overrides defaults for pcm and ctl),
  # until a better way is found to package default overrides:
  # https://bugs.archlinux.org/task/65440
  rm -v "$pkgdir/etc/alsa/conf.d/98-maemo.conf"

  # make a proper off-by-default config template out of the example file
  mv -v "$pkgdir/etc/alsa/conf.d/99-pulseaudio-default.conf.example" "$pkgdir/usr/share/alsa/alsa.conf.d/99-pulseaudio-default.conf"
}

package_pulseaudio-alsa() {
  pkgdesc="ALSA Configuration for PulseAudio"
  depends=(
    'alsa-plugins>=1.2.2-2'
    pulseaudio
  )

  install -vdm 755 "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" /usr/share/alsa/alsa.conf.d/99-pulseaudio-default.conf
}

# vim:set sw=2 et:
