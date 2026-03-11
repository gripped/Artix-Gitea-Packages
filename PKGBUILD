# Maintainer: artist for Artix Linux

pkgname=(waterfox)
pkgver=6.6.9
pkgrel=1.8
pkgdesc='Fork of Mozilla Firefox featuring some privacy, usability, and speed enhancements.'
arch=(x86_64)
license=('MPL-2.0')
url='https://www.waterfox.net/'
_url='https://github.com/BrowserWorks'
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libgcc
  libpulse
  libstdc++
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
makedepends=(
  cbindgen
  clang
  diffutils
  dump_syms
  git
  imake
  inetutils
  jack
  lld
  llvm
  mesa
  nasm
  nodejs
  python
  rust
  unzip
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  xorg-server-xvfb
  yasm
  zip
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=(
  !debug
  !emptydirs
  !lto
  !makeflags
  !strip
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${_url}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
  "git+${_url}/l10n.git"
  "$pkgname.desktop"
  policies.json
  remove-organization-policy-banner.patch
  0001-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch
  0002-Fix-sandbox-to-build-with-glibc-2.43.patch
  9002.enable_reader_mode_hotkey.patch
  9003.rebind_screenshot_key_to_ctrl_alt_s.patch 
)

prepare() {
  cd $pkgname-$pkgver

  rm -rf waterfox/browser/locales/*
  mv -v ../l10n/* waterfox/browser/locales/

  #mkdir -p mozbuild

  sed -i -e "s/%DISPLAY_VERSION%/$pkgver/" waterfox/browser/branding/pref/firefox-branding.js
  sed -i -e "s/^/$pkgver-/" browser/config/version_display.txt

  patch -Np1 -i ../remove-organization-policy-banner.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1999625
  patch -Np1 -i ../0001-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch
  # https://bugzilla.mozilla.org/show_bug.cgi?id=2016618
  patch -Np1 -i ../0002-Fix-sandbox-to-build-with-glibc-2.43.patch

  patch -Np1 -i ../9002.enable_reader_mode_hotkey.patch
  patch -Np1 -i ../9003.rebind_screenshot_key_to_ctrl_alt_s.patch

  cat >../mozconfig <<END
ac_add_options --enable-application=browser

mk_add_options MOZ_OBJDIR=./obj-"$(uname -s)"-"$(uname -m)"

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize="-O2 -w"
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

mk_add_options AUTOCLOBBER=1

export MOZ_INCLUDE_SOURCE_INFO=1
export MOZ_REQUIRE_SIGNING=
export MOZ_TELEMETRY_REPORTING=
export RUSTC_OPT_LEVEL=2
export MOZILLA_OFFICIAL=1
export RUSTFLAGS="$RUSTFLAGS -Ctarget-cpu=x86-64"

# Branding
ac_add_options --with-app-name=waterfox
ac_add_options --with-app-basename=Waterfox
ac_add_options --with-branding=waterfox/browser/branding
ac_add_options --with-distribution-id=org.artixlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
ac_add_options --with-app-name=$pkgname
export MOZ_APP_REMOTINGNAME=$pkgname

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-pulseaudio
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-debug
ac_add_options --disable-tests
END
}

build() {
  cd waterfox-$pkgver

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END

  ./mach build --priority normal

  echo "Profiling instrumented browser..."
  ./mach package
  LLVM_PROFDATA=llvm-profdata \
    JARLOG_FILE="$PWD/jarlog" \
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    ./mach python build/pgo/profileserver.py

  stat -c "Profile data found (%s bytes)" merged.profdata
  test -s merged.profdata

  stat -c "Jar log found (%s bytes)" jarlog
  test -s jarlog

  echo "Removing instrumented browser..."
  ./mach clobber objdir

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build --priority normal

  echo "Building symbol archive..."
  ./mach buildsymbols

  ./mach package
  ./mach package-multi-locale \
    --locales ar cs da de el en-US en-GB es-ES fr hu id it ja ko lt nl nn-NO pl pt-BR pt-PT ru sv-SE th tr uk zh-CN zh-TW
}

package () {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ./mach install

  rm $pkgdir/usr/lib/$pkgname/{platform.ini,removed-files}

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/waterfox-bin"

  local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=artixlinux
version=1.0
about=Waterfox for Artix Linux

[Preferences]
app.distributor=artixlinux
app.distributor.channel=$pkgname
app.partner.$pkgname=$pkgname
startup.homepage_welcome_url.additional=""
startup.homepage_override_url=""
startup.homepage_welcome_url=""
END

  local p
  for p in 16 32 48 64 128 256; do
    install -Dvm644 waterfox/browser/branding/default$p.png \
      "$pkgdir/usr/share/icons/hicolor/${p}x${p}/apps/$pkgname.png"
  done
  install -Dvm644 waterfox/browser/branding/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"
  install -Dvm644 waterfox/browser/branding/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$pkgname.png"
  install -Dvm644 waterfox/browser/branding/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

  install -Dvm644 ../policies.json \
    "$pkgdir/usr/lib/$pkgname/distribution/policies.json"

  install -Dvm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 waterfox/browser/branding/license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOT
#!/usr/bin/env sh
exec /usr/lib/$pkgname/waterfox "\$@"
EOT
  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/waterfox-bin"
  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi
}

sha256sums=('b491a4009b949abf09d352052e9e1b9d26bf5c05f3dbe5ee8c55ffa0a41c5af0'
            'SKIP'
            '1edf74423d201cbfd4162353c2fa040bb29da9db1d3f46d7fd2eff0209140e85'
            'c970c95820226210f60083b28d79db0477d7c290b03e263118971191dc616e86'
            '21dfd320408ffd57239eabf13df493fe7d575be6b12b07554f8454c233750ab2'
            '157976ec4be8d723cd6240988b310bc8e1779b2272a258d886bc08389ceba852'
            '404e780b1488625989c6dd8e2234e50ed01401b7cb1e99e79dee87f4f4f584f8'
            '0abdfbbf6040f694507c5e33bc3d2d06ddffdf309ce6f6da9484ae268382f731'
            '8626d64e0250e8121255029097ba5f67e47a9d427e0143b8b8d1df3460a03be6')

