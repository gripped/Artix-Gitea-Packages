# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Figue <ffigue@gmail.com>
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgbase=firefox-esr
pkgname=(firefox-esr)
pkgver=115.13.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/en-US/firefox/enterprise/"
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus-glib
  ffmpeg
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libpulse
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
  imake
  inetutils
  jack
  lld
  llvm
  mesa
  nasm
  nodejs
  python
  rustup
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
  https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz{,.asc}
  $pkgname.desktop identity-icons-brand.svg
  18d19413472f.patch
  6af7194e2778.patch
  b1cc62489fae.patch
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)

prepare() {
  mkdir -p mozbuild
  cd firefox-$pkgver

  # Unbreak distutils
  patch -Np1 -i ../18d19413472f.patch
  patch -Np1 -i ../6af7194e2778.patch
  patch -Np1 -i ../b1cc62489fae.patch

  echo "${noextract[@]}"

  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.artixlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
ac_add_options --with-app-name=$pkgname
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$pkgname
export MOZ_APP_PROFILE="mozilla/firefox-esr"

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
END
}

build() {
  cd firefox-$pkgver

  export RUSTUP_TOOLCHAIN=1.77

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_ENABLE_FULL_SYMBOLS=1
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip

  export MOZ_BUILD_DATE=$(head -1 sourcestamp.txt)
  export RUSTFLAGS="-C debuginfo=1"

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build

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
  ./mach clobber

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package_firefox-esr() {
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

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
about=Mozilla Firefox ESR for Artix Linux

[Preferences]
app.distributor=artixlinux
app.distributor.channel=$pkgname
app.partner.artixlinux=artixlinux
END

  local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dvm644 ../identity-icons-brand.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.svg"

  install -Dvm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/firefox-esr "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/firefox-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  export SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE="$startdir/.crash-stats-api.token"
  if [[ -f $SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE ]]; then
    make -C obj uploadsymbols
  else
    cp -fvt "$startdir" obj/dist/*crashreporter-symbols-full.tar.zst
  fi
}

_package_i18n() {
  pkgdesc="$2 language pack for Firefox ESR"
  depends=("firefox-esr>=$pkgver")
  install -Dm644 firefox-esr-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/firefox-esr/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

_languages=(
  'ach    "Acholi"'
  'af     "Afrikaans"'
  'an     "Aragonese"'
  'ar     "Arabic"'
  'ast    "Asturian"'
  'az     "Azerbaijani"'
  'be     "Belarusian"'
  'bg     "Bulgarian"'
  'bn     "Bengali"'
  'br     "Breton"'
  'bs     "Bosnian"'
  'ca-valencia "Catalan (Valencian)"'
  'ca     "Catalan"'
  'cak    "Maya Kaqchikel"'
  'cs     "Czech"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'dsb    "Lower Sorbian"'
  'el     "Greek"'
  'en-CA  "English (Canadian)"'
  'en-GB  "English (British)"'
  'en-US  "English (US)"'
  'eo     "Esperanto"'
  'es-AR  "Spanish (Argentina)"'
  'es-CL  "Spanish (Chile)"'
  'es-ES  "Spanish (Spain)"'
  'es-MX  "Spanish (Mexico)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fa     "Persian"'
  'ff     "Fulah"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'gn     "Guarani"'
  'gu-IN  "Gujarati (India)"'
  'he     "Hebrew"'
  'hi-IN  "Hindi (India)"'
  'hr     "Croatian"'
  'hsb    "Upper Sorbian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'ia     "Interlingua"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ka     "Georgian"'
  'kab    "Kabyle"'
  'kk     "Kazakh"'
  'km     "Khmer"'
  'kn     "Kannada"'
  'ko     "Korean"'
  'lij    "Ligurian"'
  'lt     "Lithuanian"'
  'lv     "Latvian"'
  'mk     "Macedonian"'
  'mr     "Marathi"'
  'ms     "Malay"'
  'my     "Burmese"'
  'nb-NO  "Norwegian (Bokmål)"'
  'ne-NP  "Nepali"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'oc     "Occitan"'
  'pa-IN  "Punjabi (India)"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'si     "Sinhala"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'son    "Songhai"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'ta     "Tamil"'
  'te     "Telugu"'
  'th     "Thai"'
  'tl     "Tagalog"'
  'tr     "Turkish"'
  'trs    "Chicahuaxtla Triqui"'
  'uk     "Ukrainian"'
  'ur     "Urdu"'
  'uz     "Uzbek"'
  'vi     "Vietnamese"'
  'xh     "Xhosa"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)
_url=https://archive.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}esr/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-esr-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("firefox-esr-i18n-$pkgver-$_locale.xpi::$_url/$_locale.xpi")
  eval "package_$_pkgname() {
    _package_i18n $_lang
  }"
done

# Don't extract languages
noextract=()
for _src in "${source[@]%%::*}"; do
    case "$_src" in
      *.xpi) noextract+=("$_src") ;;
    esac
done

sha512sums=('799cdf2d0494003a5addd0da703f53deb9c9d6bb6f6c95d40026363382803e2d086039c7798940a1f35f4cba111f2e8e21bde8ac2eac29fd9bd6876dd8d3a85f'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '0078598c69c232ff4ea7b4d9fec8e438b5d748b8ece993894859d90d3d4c179814a4f1e6fdcd7f709ca5e2273602001b2a03cccfbb105e7c8b401e1768c9efd0'
            '2f0871f46ec3c8e4b6aadf12c955ce85b2767f951b6a3e59ab01137ae318114d85012ed860ba3268257d9a1174ac5fa0b806d29f420ec75a7652eb3c69766b24'
            'e79af42d8118feca5b96a35b8d13aaf8fd88720fc425bc5476ee96854d420c7071949b3c752af8e30c3f154e2613aeb2785c2841ccade07b0fa2966d4b896029'
            '629bc6c9cbc00448467a1590588c04e6264713669e38f3b3162586c2bafec5908780b76d794b20dd8b511e6b0d652ab81b6a9d015b0637d2f63937d071797ccb'
            'c29eb1c6f2baab48a6a1908071ba42281662709f717b0cdd9fd54d5fdaf4f4e34c23a0c7a69daed957957f9b651b554a17c7573cc5a12d4676c7f97b0bf9d68a'
            '2a6f4da626d74cd2dc05e3ec42fc063c631bdb6b70413fbc66ce7b890118219501e6e237b53f51393d9b12fef81f39afac7cc4a3d4f4dcae927874f10e006701'
            'ec5da67bc4e210a9887eb503b1e27933e3cf63489f0c31290a7c949ec6299b2135e1e8ddacffd7220c2e16da4c3d001a2eec1d4cf80a8693d94eb71001fc8823'
            '3fc92b689f80672c0b5a97eaaabcc242aa42cf3e33aaf9c93e444c45a7e0dfd97baf139c937e11a50d35ee960bea91bbe53125942209bc1f9face75288beec3d'
            '380d055cb9b3919061a8e23f804d39ce24fbc135a0d963911b256ccebee57a2bf6af99f24b4acd7c70c44b7e3f9ca3718701968cd72b16c39f3afc225bd0b395'
            'fff6b8c7ea887208ec541822a1ab073f0303df6aaace84c6c0cfa682a538906d9a67ba103690adbda920dd0394d5ecc249765781f1304e6fc2ae266a9ea86ae3'
            '82b83fc0891fc3c4101fdcf046516f466c9d36227e54783e30252bc0f8d1647394f4c667d1c473c4f7568a0094a84c1216acaa32b9604704e7a0d4bcebab2d1e'
            '21110dada66d3dc26bfe92f771b487fc39374af0b17e6cb66dd68c0613471dacf1e04aa59fa0c3c6d870114b85d0232ac339143de561ddf346255182e83183ef'
            '0e58cfdfb3154caef8dfd3e4d826e58eac33cb8d296cd362c715bea383dcb74bd4c37363d23752a29614abd5542f76c3f78a6c5f31d0567393073f0d8f806532'
            'a85ddc738c814514615b9d9ec4c3671ffbdb6bc8885131305aa55ab592b1041fa5c22790204c1f79c788f8af5f1fa9235cf211c3df863e2217bc409b179443ad'
            '2c604454dde3d95c2b37aff51d80011d10bd6dd26b0055751239878d740596167ba48536289289e34a0384a7344c042b863aba4e204f631a995a9d39e4c99d47'
            '489a62c1a98e5729bfb5e76f5ca235c7afec3c20d3b973f3ef2d8760508f866e5ef377f3e5f7ce2fe2b573e4cff979bac7728968ea8c1765ab68fa2953ad29bc'
            '9861c6e7fb57b2bd3e24dbe56769de03c2ff0d41ddeb39ac81158b0942b11749faab41312c92688722ea58f054bd2d4a7d7a79199f7c3418ecb8c2ee1e786352'
            '65cd2a8c6ec128385c04e831bcfd91f4802838b164992dfdb568e2792c9308f49258f4ef8b8a13dafb1e313d369ac872628c04cad7ee69d9ae7820642c370627'
            '8b0ac22d9499f211f7cfd4e4ab4e6073ac6fe3f566cb9f500f036cfb66d40770b42bca8f71a1e491eab4a91674bbd1bda75c34a8c538de51c40d27456c207cc6'
            '8adf6d2a81712a5928eed7f2cc06e1fba86e7f69e10c7dafb337f5fd5fb29c7444b5db98f3585079015b98bc4ce6a3fd41d5233c2280375a77c934ed1d5f2481'
            'f21a1ec2622adabf3ecb3b8d0ae8b5744e1d17ff2b903293121f0454b28d18cbd90ee2d6b960805545141e2914daae1f6b17fce50c4a536a3cd56de234e2d8c5'
            'bb76262dd5265674f79b8a61064f056cb62259ebed55ea2e2e2e026ca9fc0f80dd0bdee9fa5884cf0650df26e625de448e3605366b374229b441a2cfa1b14293'
            '0ec261dbcd0ddfcc4bae0d404410f51684cbee3e80d1846b6c15e35e9accf56377b1263b120a0cf7fdfb23f1459731dd8e62ea90798169d1a767aca4dde6576e'
            '8ea328ff031092ed1c28f76d521fea12b665ef3fd31d7589b4aa0b2b3e92ab36998621ed5f9ebf1e64bcb8216cfd5659e45aeaf7234ea03ad7476268e93ccb7e'
            '5586a5e366b9e550c9e83a9916e7abe03d0dbbf78c48a95aa305d43371e7015bf35c14d7d14e2c5648f00b20f81050a86259ee55bf341136cfa0c6f4a5e4f2f6'
            'ec0eb6886023c290d82a022033cc52a1caf34b7fe99899dc7f34181484996e655da8798ed2650a3cfbc78b249de0567f5d257cf5085e8dcd39e60c85c497cdaa'
            'b039bab4f62624b5c8a8b3766e0f3fddeaa19391dca1af6d14385e496fae41b2d61785ecd84ece3ca97c8c8de290dca4a9b45763b45230c0e558ee9386ec5cf6'
            '6b1a16a93c2dad80391afa9f8fb469ccbc79312a6394f9dd4c00bf32a85dd2e41065a44b4344d7d501d73bfffbdaf8188e8d7345aa926e6e86e5c59ce99c6d4c'
            'fef906e8323b2c3a62010df983d3db4dab9fa7556ebc51a5109c11f040b11ba336c025c3b32d26f07d52b69f88195cc83141fc9965590d61ee70ba2f8447400f'
            'ff637b66e777e2df0c9fe0561dd464733960d38584081eaa07f74e3d46a0f040f670ef507f2180ab9b25a710e950f8f93cb3436a855b957ca092ecbd42f0f805'
            'bad7d867372f98c82edf61427116cfb9c09b121bbf43bb93c61fd60788c68cef7c97793f94c01f92f2db443bdf3d9d5edaeb3c47734c7d47ec4bd22e6a363a67'
            '50f0b61145127f511743371332311ba3a2b18e473226f45f193be46146a0c0af276914c59c3612236b6989a6699bcaa901437d3cfe5563f8cc579d4e36ddbd48'
            '4def2322424a4d61d44ab87e6076868b33a390006ee3a47233888de5e67d184c103b990eefce790628161a6585a63c023f702d7fefff41e06a0d4ed4647e9dd3'
            'd3931ecdc5bac7c3bef39420d5d9a3b81fafdc4cfd3eb7b798d78a7bc5dc3214bdb18bffd5f947cec858e1457c369f445e9336ea28f6d22b28bedf56e4bce6f6'
            'b0e323bda0bfee0925a150196b961d0030216882af68d9d66a8ffaeae56b679e79dde27fe4be8cab7ad60a48000847042f8b1274966f47d0a5035ec02e6584ad'
            '2beb3e0b7730bf3df85bfd9e62457b85119688a68b704f5e430264bc317eb7b0580b895a792d21057e799928a2a3d2f5f7aa0bc0dfe9ff8b6dc1933e82a6407a'
            '6ae30c58ad81b408188d5ac938f4d3c5fded4940eb3c2a02313670daa5992c029ad9cdd3b831cff4d06f51b73f06083e4765bcf329ba10ec596d2d18e25a58ab'
            '8bbc05ec34f5716aea3d10c370fe0bccf3e9d8fa64935ada974f5166edb393957be02ce0ac89bdf544fb1aa24c96152d6b06ca34c07c5369f8e7dfdc052044a3'
            '8f6b0e68c57d866315226783599422c6baf494b2dc7203132d95d5017ae84de925671361ff72db85d6b3aad42df832d35c5c30008db0956bda93a68b32062312'
            'fd5066007811fce84f800fb76acf5f02f6386e8fcc351a4b9ea153fba8811c1292e14ec778268255d818813309ee81e46151081c466aa0b85db6aafb8dd9571a'
            '8d89f1114e81cc216886cad85accf19fa6163cd9fdaba122f354785417982ab53046605728dc311f3091852407e9b687defbfca3cf4fec3fea30da643555e7a8'
            '60c8d66c1dabe613355d4277f163f5e35f5d9a89b5a2c9527d7eb0d0735fb3690b1b874c4920a6b165f29862736002038b9674a604f152ee0961bf5882185af7'
            '73862171a464a5a480308b614bb264ccfb51b96c4a3a02f145f76836c0cb8b0c0cfbc8f0b7d536f639ddbf43a0f56437cbd366319b64b3b7fbcf69e01ab58ce0'
            'b6fe3216adea48fa1fff8a5a564916f47b6e4c557f3df090064f3378b65ea8bfd99dc3c12db5e2a40cd868a7ca7b2e72fec77549b43696de4afcd7f644a161c8'
            'f461f8cd826967ec83556a2c2fe60c5f45ce194aaf632b85fd241c3442f6d16528256e6e3a6f9f7c8297daaea5b216fbb52d237012229c7cbac7dbf07f3f96e7'
            'e380014b905b1fcb92d6c4715eadc7777b011c7832144d27e6f462dd63c72d5bb3072b1ecf13fc9917c7f73602bccfa32133cb747b130307bbebffdee27a9948'
            'd91861b2880f3ddc1a76dc42d3d7813ec325aa6ccc6c6d725a93f71269aee0c8f6e7586380b1683c3741f29d8d5acf2ed119b7e0561d2679e92668a6442c0634'
            'fa3cac33a4bbda77a7f2e987f5b41c9746196b5165d83ac9072ef83ab54bba2768dd06d0d4fdb39ee8f5ae89644b67153a1f062c7c9ed0585e512646a6e56363'
            'fa6d691f57842d5c5de51bf6c5e3b30f979c048022ad352465bb324cc2fdd03afeeacd611d500f118bca6d516171f7476da8eab270f17eaa49a856f4fb73ae6f'
            'bff9484a9d06d1bc716ff4a78955cfc5c46449332be4ecda2ade02217b8a0c61ef46226999a60ef78fd9b796277cce7312476408ecee0a0ee30c8eb738f684ed'
            '88ac0af91f33f40f6290538c0735c1dd0ff02214c6a5d4ade78dee4f571838c7191f91e5da7f69c5da831856f13654290fb1d735cfa257769c812ad7165a3cf4'
            'a6ee6eb5cc54cf2cb86bcaf872bbef7932056a19e7089d6ddcfad4b9364f26960446463039108aee18677b12a0d55e5829146f1a9c877a279daf61bf63c12cdb'
            '5c013eb2a09b2f52157e99d64c4799cf075690b1081be432b77c438c10a462571b609410edb97c67b7bb584659c2c043124a3012a1643946da98c28956b662d6'
            '37b85ac5cac28a6ca144f5bc7bc49c8bb40fa03393d2eafcf690edd0c80251a85201bc2b673cc06a6f88c4caa5d05508e9935cdb8eb4953d31820e95765c88bf'
            '58bc1b2eabcd890a575dfa0c73b603e66b1a9bb66ce627aff73bf29998a65fcb098fba09ef02312fe9529d8028440e2c16dec0592c870254fff3cda9a22167d8'
            'fdbeb125f941748d05963059823d3f307fc019cf81cddbe686b4fb4533b8a68404cba557e2477be5d677f33aae5b461d48ffba6651111baa22c5f00fbf42cc2b'
            'f9de2a014b9b68a2bd6dd5c54e9cc44060330b2db60e24b071987cbaeb4b0d2a35cb828261362d7ea6a6f1f36e38a8491de3c59c42d5be9fcd93a636a85806e4'
            '8df61f23a7662f0f0714445088a6a2fe6b3a14d685300dcfc9c6f124e985c63a214cdb37863a35fa0689a7dfd63ce0b9823e318daeb1e7f5929582c06c7125f9'
            '27fb76a454bb6337b77361024db3b99a754af35caf33ee33556df422bf968da4422dc727450f4d3d93814a1c5a112edda6f6d1d289d3673e81c0ed5d7c04cc99'
            '3728938278006a3d77cfebc46643f0cc1e6d68a2deeb8fe68ed999daf2f9e3c0d343599c1292a8a5f35d97bdbbd88865f8f49937792bd84782770325f18f473a'
            'eddd6415b91d1e8f8683a8cca72dccca5dba7dab395eee279fb7950653f69e1f4776373b26d9221586b966e26b3ee7bca3de10785f6d2966cf2d85700a04f235'
            '946d6d680f02b68eed5c18019737c6913f5ac95ca10741da30c6d31658b4a0eeafb6789627d1aeff88ba49d9c6ecbcdd4ef6000553ae7571272b35bca98e35aa'
            'd4bf23bdb67c1dd26c3714e58386a63900c9d5e7457cb2d7828adc6563883fe621cce299e26825f71164258604e88d06711cb008c60d80d974c56e04eb54ac70'
            '849e505174770b9c778ed088b353149ca5506df2baa070ba940e57a62d0df0c9af4e7d6854148c979e7cbcaad0394f3a3b80bc0641f2ecedc1020adbdd9b6ef8'
            'a3e482b320a01684b5391fbbdad2a2e06fb30b023cd46dc449919b23a8f425070b7e58a91535e2b973d63f0d5af8e240dd13c12d52a6fa0342829ad5e328f703'
            'de14dbcfc4d7d7c8e23f08a45807c7ad7c3120e2bfaa0372b7bde17d4e25b27959946cbff0b855357de1756bddc5e70b35a003aca4883353b3be4a6ab5fd8b73'
            'c124401eda391d90eddef3bdc56d24ebe730292a1c14f3d8e9d3b61f72cc1485c9141ea2c21fbfc1b3b1aa295abe634c4191c436da24180f21ee0cdfbd5ccab0'
            '90f34d609a5d010fbfd0c02de3aac179f017c7233020a5d16235b9545404b4887e9efb4f61b570de1e22855a3312125aefb6bcdf8f6e118ddb31f004ac3bd83a'
            'f64c0ee5b11d2bd0926708fc45103c2fa6699d0563f2e37ec882e9f84fd4c2e5a2d01f1fd10e2bf9e3cfbe4f6ff00c4a3b0fe4ae4caf3dd3f50428ad03e91f7e'
            'ba72ddaf6d6cb2224f4bf0dfe56155a714b1a8eb496ff28a233425c9f8676391ef134364ed588a08e469d1de92a7c0321cf1be9aae7782df0ef15eca6afd87dd'
            '2c4f34b1426a64307d01553b726a5c55a1c1e087caec3536802864054d32d61eb5691b78e8a5f0bfe63f8f4539647e51a000ac549d9b23385ec7eabcf19ebaea'
            'f5ca41eca0ddf6d560bc07da87ca7c0da1624a3c4e2d527a604186138e55a5c0a30b7eb44f00f05998f07ba2278a31988cc528cf1d4b7f1a2f164c4fdc109ec9'
            'abda142513b7af1a9d5e156fd4598887435b0313b345e5786ca647465de31c553494cd7ac714fdae8b7b3ae40221fde749e03c83fbeee3534ccbc24860485fdf'
            '0f9d5423dc00e93b900b6f90997419d70975d6a07a39a6f2b1012ff7a0c4c2459c41214f05171fce61ffe4fbdd393f0bb906bbf8dbf71343895e463ff9517127'
            'e061106433be87e7b2d47bce894241f261f87a5cfce49415c2430417418e978876b45157eb3a3786e338a7b1ad359c672818274dc7e71465023eb10924a9d765'
            '7b51efa9217440b5938d4f484625d13562e65de57b6d4c9ac53441031977c6de52cb36fec5d98f0ff2d541b3e2fe2bc854968747bb09e4c5d17ae94b11bf5e5b'
            '3fd88deb77f0b85c92bc42b4641699a39fe63c73d89c4febdf0237da1c91f7d13b4646415df48e5c448b49fdd1400fbd817af068518055591d09d1ca39a7829e'
            'f64b2a7a0413b006244216d33d5d1ea68762af265417633898f1757aa62749581af103c9aaea6be807d3804c5c42cb44e2bf853d8cc8332a5dec4f46a6cff074'
            '8fc13b6b19545a512404c9c653c2515bd57f85a39305fcbc97dbabd20bcb61681ad74a8a0c3f1253333264c868746e45ef6de4d68ae5e921d824da8c790615a9'
            '6deb90c6b4404e54e53d08680b83d32ff2c0fc30621a927f195ca326731cc5a6588c68f73a3b4a7c2f9b6c56f6b11bc20b3484094a09246eab9429e7515e1d96'
            '66d359c11e4b03a7d948704e110b9a104e0ddd20269660d2222df759044419d797feaad6b5c2142e223d8f743411528cbd01aab1dd869b34aa5ef9fa19759b0c'
            '14b0475e8cba4c852d7437819cfe3157c5a0e2454b804c86fb95bf5d6f46fd2a853060d7247dd825d547d0d148277166130964934d600740c6ddeca23ffa0a74'
            '5df04e32c22f70be9ec9a7c417e56da210314a8aff0d4aad43d3670bc516d074e629a04ffde567f4fc12d8cdf3179a69099612263c8f8b5a84eddfa510213026'
            'fab2db1403e60595d8a6003d10cc564d618e8d08fffa613617150cea940a4ad3e28947ade5eb06a831d8830944ac8415185be6f7a40dace940347b533f9026a8'
            '5afd139113a720d45dd35621d57b77c12cb47f277a264b1b78cde6b24e8a596b44b7de77e6ffec197d68bc1eefebdfca101a3892e736d60abbdd21c8317acf09'
            'df200d8b132cd29ef433db0a4cbcd39af2e9426462272fac0435a407cf236531b2b589a6edfddfdf12fb4d446ba02ace0b43bc1c3844f93aaada1f131a0f294a'
            '458660b1267ae3077fea493cb04f8eaebd92ccbc07ed59ef18205b63eccc1598497d61d36a3de62d68fa6188eaf4251cbf54e3335cfd1cbb3a1aa320e937b92f'
            '2f5c455a7e02ba35761720481d261fa45f53bc87c9ad136014295088ef69e14e6d9048b1865c30183250d5c58cec5825e2705933edb4e85f84ea9c8f72739fe0'
            '25e6be57c7404f6d3c3597b2b42bebf86092b7a4884b7538eaba8859a883467894c4712ace0140ad02709a725f82ec24cd131fbee07fc95c553373cd417901ba'
            '39aead037b172ab8c7ce5a0a0d145c88a0ae527afb86486161418fbf66bfc69f91d7518cc9609139c1352eef35a6b91225bec4c1037cbd4c0d28161cc1e19d63'
            'f804f7ab4b75c478a1728bbd817c33440e4689a85b0c711a8c4406757830d8db951a33ca97808f53d46f58e51a565d3fb9a2619ab09d5daae098e90c1b7a3bd3'
            '99781758ca40e62f30a377395eb39f66bc555c87e930f5a971a26c54941a4117d1470aa95a11fa60dd81df293f94eda81221a40c5359320e5c8437bb5e410673'
            'd98b524d66ca6b79c15138e9005f3720fa12fa46411ec92d39e8f2a382257c491f0d2b3f2cad32e81e4f7ba12c4c14bc5039b90065261fd386019e652db3ba09'
            '24e59b1f18cbe9189578585889cdc01c707877ed0657e4c5b1cfcd06abdd0b3a0f51c1e919056685e5c3d69d899482cf2e5616fd8cfab2a83fdf74e994ce9096'
            'c610d5e417fc17d2e23a5f5ca5cb0c2dc0474d8eb6a9ed058fdd6b2c465998d6ad0488fa379b2d0ad8bd77aeca3c94f9c9f950a52f9cee9394e9a6437fd3c1cd'
            '268af1fb6863dfb280440a44ebabe3926871a85febf4f45a2bb1fdc126508a361d5cecdf326cfaead3257b962d559e0c47583d91355e966ac37ec9092ac9e71e'
            '3b95f8f7b0b5cda517f826bad938cb88457efe249a0e5225068493f2fe0d644a5802e8ff85c06ccf9660135de0330452474833e2a297bc97e48238152883d328'
            '6ca1d36a0faea8710c0dcf802391be1888ff6fdeb2d20af2970e63d982f551b64cd5ffbb2ebd187d0b2f4add2f5ab1f3ef9d82f149beaaf6d309da6425ef4b34'
            'c62f4dddc59f71d944d70250dd0337680c789000f4df188d71f3fae1cb272c34b85711218a53727324adf190e26e1667a192b612d9f1d3a437f24e1b27eb9ed0')


# vim:set sw=2 et:
