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
pkgver=153.8.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL-2.0)
url="https://www.mozilla.org/en-US/firefox/enterprise/"
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
  imake
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
)
source=(
  firefox-esr-${pkgver}esr.source.tar.xz::https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz
  firefox-esr-${pkgver}esr.source.tar.xz.asc::https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz.asc
  $pkgname.desktop
  identity-icons-brand.svg
  # Make different channels installable in parallel
  0001-Install-under-remoting-name.patch
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)

prepare() {
  mkdir -p mozbuild
  cd firefox-$pkgver

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

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
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=esr
ac_add_options --with-distribution-id=org.artixlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
ac_add_options --with-app-name=$pkgname
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$pkgname

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
}

package_firefox-esr() {
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

  local appdir="$pkgdir/usr/lib/$pkgname"
  touch "$appdir/is-packaged-app"

  install -Dvm644 /dev/stdin "$appdir/browser/defaults/preferences/vendor.js" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Enable GNOME Shell search provider
pref("browser.gnome-search-provider.enabled", true);
END

  install -Dvm644 /dev/stdin "$appdir/distribution/distribution.ini" <<END
[Global]
id=artixlinux
version=1.0
about=Mozilla Firefox ESR for Artix Linux

[Preferences]
app.distributor=artixlinux
app.distributor.channel=$pkgname
app.partner.archlinux=artixlinux
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
  if [[ -e $appdir/libnss3.so ]]; then
    ln -sfv ../libnssckbi.so -t "$appdir"
  fi

  # Register GNOME search provider
  install -Dvm644 /dev/stdin "$pkgdir/usr/share/gnome-shell/search-providers/$pkgname.search-provider.ini" <<END
[Shell Search Provider]
DesktopId=$pkgname.desktop
BusName=org.mozilla.${pkgname//-/_}.SearchProvider
ObjectPath=/org/mozilla/${pkgname//-/_}/SearchProvider
Version=2
END
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

sha512sums=('b6991b55e4a0bff7320ac5f3db1330ce63e274a9f77c6e7e623713ec05aca8d7433a9acdf3f6e12aa1b2878cd2d2b81e6fe78100a68a5384a2f327e8de5a02ce'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '2b06a2398e862fa4e61ee5e41971930a9c50a90fad4ee99231fa9f8d94d07e3f31a044d2a306a73e28367f654ad5568bf4a64ea42898a5001969022e3bc8e992'
            '82ac0dd45c1bb78547ab227b90477e25cbf6f0aadcb21c0b0931441fb69f82306c55be2110360a6e2b400be3727a222c855b42ae590e1288ac847d14084c6a0e'
            '77f1c19eb167d3cb5faa46a0dee05a481788f8a7a314fd1267586149ded795686d4e75f669a8adc6b38dad89e46499a7465318ef771f2b7d4b8799acb7fe7267'
            '5e2febcaca6d52ac8984e885fbd9a8f860ee59128758a927df01c8198f929bc075e648e0d3ebe44e8461ab00d6e50f9c50e0ea74f93b5fd3ccb04f54e30793be'
            '92d903476133a7368e4b5ee0716bb9e34bac0011bd73135e8867e7d24ab96e4a84c3f33769493eda63b4be98778c176bb53bc46a2544648b4ce47b9af34d7a5a'
            'ca14eccd99edbe53bdb4fd6d2f0797f50e4ff1e57cf43cbc75f2d1c3c42a76ae08caab56fc411959050ad8756786e59ccf02c91d3d54077a270f4996fb6bbd46'
            '4ca4e408c5e3c5a68b259cf779acf812b80bb1d9c0eabbe1c40ed20e0a807b818c6a71ec6f2467a3ee71e123a762d72b693059f8dbfc7c44b52390a18d2e1953'
            '4c1bec0e3dcdf9a62de4dbacbc4f3cba06f8c6478d2bba2a147e09de0e9ab42e2f3f63466fa620dbe095044d812912651f833c53b1a07dfae400f6560f827ca5'
            '9bef611ccedd50bbe86520f50a36bcf76ed57db5496433f3a0f1801f05bbe7ad841f26845823a3b80506c6a76830b158c19b1c0538ba0901d54cba886d9da165'
            'c6be9b4c3014b9536ff146cf794fce9b373d9a1b9bbc4d7269dc4b85efe5f6e8a6f28b954ff671f7356577c4984ed64fe15141c7d944475ed18172d87128bbfc'
            'db7458d3871b5da6581de489f47833265bf77ef72496166dd304cf0269efe9d3c4900088eaf7adb4ad62283f8358ce273d07b0aa1906d49437747abc99a92f7e'
            'f7be70712413de0947abee2251c4ae241dc83b401f77c4f554213a1190cc5c2cece77e5e0502ce354054329d863061cf88620ca88f6f330659a0cbbe030c25dd'
            '2ee448910e0782f5735100af9b8a8c8c21a38b0b1729bda3296476c518f1a774edcd6892e7e6d3e1abd009859b8a43b2bb4b1ba650a813d864495d4173945103'
            '1d2e805cbc5dc3b6754cc70b7e26d24aa9f33b9d169b36a0b3d2898fa6c7dd87924b250e0d09c5cfcc28229a0d665a5eadc59a55c6fe50a6b31bcddada61bab9'
            '30d555e506072c9d4f1cc3c9f3de00216c4b7d5dd6acf06c4188dcb3c50a58b2ec78c4d3fca26bee843915def5de5172eef24ec6c0a6f42997926d5027937a88'
            '836bb875e8d0623f13f1271b58c17fb9a9310ff58f2e561459211e8fc969fd21d62e09f86257cd623fcf2fedcc622fbae52aa739f8cfe59ae4ed1d4be538b277'
            'b121234874db93512e7c586437c865d249f8266bc7012e5c58187819a6d0987f4a5647dbf20ee3156858c8eb215be84351db8d40c1e676eefcfc616cc3536e18'
            'bdcb493531764017b79777d3a795596986534e527351b0b5684d7f3f194df56eea9e48b0731a5c73918f98fca1957dfaafc6c8f0f9aad862a77b27fd29f0fd70'
            '70f2516ce36f6f86934523dab1bef1ff61d6f23c938d9fbe044c9457325d4d7981a109877c945d3dedad8c3cd769e6b9b09f7ad4705fcd55ceb99888585aa63d'
            'ee5250e6a249e3378b39dcd50fe6917b5e34a43043fdcd66bda38d35cd98aef43212300d9efa853f4ce6fe206eb51fbf2aff7a64f0f169e21a77ac41300c52b7'
            '067ce58fcf90269cdfafd85e2a733815ac8d445efa64bf70857c192258b4d69346d32368382a7bfeaca79daa93ec875638ab58096bb5445e0a71edcb159ad72c'
            '152e2f02323b5554a57e2173b3d76ff445307ba14173d36278dc4a9bca54ec89f196bd43a09a5f5f547e229ccc023da3ab22f2241ca5d0417a172b04eff6b891'
            'c892b8e6a501afdd5062113a41a5666b95b1e967ea61af2d099c0a851ce55814cca77bb86cf5c483fecae704f41e44f7abe27adb2317991afdeecc59ec2b4832'
            'db8c7213f6236339a558bea3fa6817eeeefb7242d7d3f73e2bf6a1055dd0a43cc11b17ced1f2584c066471bbe32e51eee51ee2e38aa4e35eb5283ab4bd1ca9eb'
            '6599fa0f4adaebb92407601248b3785f6fccde67dbd5b0af6a10453a64c58922041e12ac5b7940aec4e879f4517ab453393f9613880a631d894b9f354bd68559'
            '864a0091b5ef860f1fd86c28a56d559a216c46a41dba3572124473ffd0d4bb932af2f2b9d0728d12a194b6242a93248b41ea20cff7d384739bca9955b6d7b630'
            '134faa6ba530a691dfc084764facf60db79839d0fbb0ef5543550223aeeee1ebbfb754e5b38e2fc189a81e01de3cd43ba4799ef8441571548921da8a2676d1fd'
            '76f6f80d2bbdc5905ae558336bda1ea8d66f640ae09912a9bb610825b78a5e24022da55c8eb7080075c308c27fc1b27421d8f899210b215826ed659398e69ba1'
            '435c7504960e334b46dd539e18f2495f553a93add7db2901b6b348c0a249d6b52f51335690b4587a2f0562a8beace1d9039f43fd5726c00216f45b7e1002b6ba'
            'eb52c3fb3654787cbbf9ac0051c575a8270865c39824e7f48106f56d15cb0c10be082670675e129fcff38454857b8ec246df2f78e129707cd7e4695686b184f9'
            '5e0c0637d609156674b55d34785f226b72a05ed0981af28b406c0649a36557908c9092a708fd8382418ceeb6214bb28e1e05b26d6e4d50807ebdb22f353bd4cd'
            '5b115857816646a418719bacbbb112a9c0e4ffe64c40b95c0fe431dc83c4e7b06e79fa80436371633d1e3094d2280cf5a9c6b106a2a76508b35fea6a58f884fd'
            '24a4aad6889b8bade7b1cbf47aaf4213d4436f04d95f945efbbfd64deadbbc227f7591056343600a0dbc93e1ad4e104d41eae327ecd9eaa7c0883987e55399ec'
            '3a52c8bb51eb68297ee8ecb4947659cc809410957a5f813d26d2a098761e95976c8d16ac1ee55901ef9c9376aa2023335372be7de0e4be4ed503e027e23daf98'
            '9db9f0b2e89d642fd324160d1527cf719cc35d39c5a635176262b22ea65a2413ae6a5c3d00b40bc2223354febf5ed8a3ffec4e8f72b3e62bcf96ec13961e7c9c'
            '820238ffd1b6f695ce43708efd465a2f273ed92519d8133240f697f43467530309288d6a5ca1a2698daf824f451833f0f399ce717b323cca9693843fbc90d5d2'
            '5f21fb871c2cdb03ce56c910b72704a87d900f0816328a83a3df5548d0efbb5c73329b81f47af65baa834ab3c345ee958176827563675562ed2df197ceb8e6ea'
            'f58d9969cb96b72576849867f031736263f0e98281d501f1fed7b9cce71513b673274dd9bff56408e8279ba160c834c1a8cc1fff473d5b848e8cb65e3245a8a3'
            '092dcf72e7c53c5e0cbb474f7ef9a864ce1b817b84f7089a3ceede952761276abdda90c88e632c8517be4d6c37609c23b60fdcfc882dbef8dde5382dbda5cbc8'
            '342b9cce500fa9e81d8d3ca3bade5b26bc33d790972bf84e80eb7d7590b96877c94b324389e0a3b83d0c271cb46e691fd6db3f313cfb800d73af27e00286c588'
            '386a71622f5e1f04a20f609029939d34913d224e8bd5c8b391b440c4c10ed33e22d0394f7d8bd4517c6315098a6d52de1dfdd1eff9ff16f03616475932f93dda'
            '2175ffd9fa4431a3c4c35f2496ca98cf9c239a0fabdc0b3b0bd1291db09c6e3af35af484f69187849cb8c2677b76be0289b1ea69cc0bb7343d0cd3d7ace9649c'
            '6ac8bc889abf8a196ab6a525baf474df32011f4979a2ba86e1b7b515ec39527ac4fb382f6b8c7b31bcd2dc1229b9d092c302eb9a0377b7e78ef87aed41a1cff8'
            'ff8a84a7ee8e074b6fcacceaa1454396467a78dffac689e53def91de5b7cf417512e8562e2bfa1182f32827865b863b4a6f770039295db462d99bcb9d3fb3364'
            'f2a9b0d77a9cd433959ee211637c43bf8305da37766452cf48c4f95ba75356af3bab13ec5fc48d898e1e6da3f8ab23b89af5423355e18d5c5ebaff62eb4d1ebd'
            'd7911409fce79d05394ee7381cbd3960ab4ef42458009eeb191cc0ab9c817c74b48a36474bde913e0b37de69e36adcb4ee911636e44ff607f017c7900f89e90f'
            '0219682f01dc2b8397a5f727e4b7fd875f56850ae30cf178509a0e092bbe6e3ebd80497c20427cd3a8b47807274fbb4609add7b8a0fb232c042e5e909785898c'
            '5a6a3d756328f12f9bd96dbbe4fe8f019bf3d6053eee97d0bbdc9b69efa3c6ef68c11c1a19455c7c91caccdb8654a23e5019878e0ca183deed2b21e55b08c0f8'
            '81bdbfc2ac85b8baa7878d1a7b99f60ec0a18ef2549e6b81c7e4a84f521c140f3f7cb97146dc7afabfaee545e6e65b23edc102ff30c543f5b555f14a76bb1e46'
            '726fabe30c4c5d1bf02c0a100094cc117b233b2ee934f3ab88ce37ce6ce1c9748b1edd3c767b42bff27d04b06a0ea481cacb37a4454bf3a8fa6996d3860725a9'
            'b385fd704bbc6d4b100ae74db9cd5ea71051215f440ba56d1e24a86fd6a3a916f8c529b6106cda6daaf527d3f92b602135e5cc4f967e733766281c0a98ff5b60'
            '873991b29197126903be8211d85df13ef808cbcb6655fba0bb030e744a61801a34f060277165d0c43d69194d670a44a0300e3790a324f427fcbcb7c412424522'
            'b50739f4a19f775eda28dad00b2911a5797dd0bc96a5d48d7d4e0ad98662317f01cb7638dd0916e601d26fdbbe595da17204ce9dfd22721f6748c2fbc79711a9'
            'e6d53eef282f9b16ae0fc386195faedd189b9b9df7fe3710ae2f5430fe8510188aae1aba89cca57c6023ed0226f3ae4fdd3ded4e033d021744d41b6090af6271'
            'e39047e893455bb704d317f69acc2295c14803ca7fdf11ca9512242438342f18e6dd71a842bdd07dce739246c061b4f8a6d02ef0ab7799c2ea275dff7e95b7a6'
            'ba24fe8cf3cb732cdd524f7132c961a6f19eb6121ba465bc34f2745e50e11dd4a68b055cc474e0b485a7c30b762a6472dab151ed5beaf199c431d69993df9c40'
            'bfc7551ad1291b4d1907b8e2a85040b9d1808b89007a09af72ad14985f166fc36c9ef52cb57830314eb0bba4ef3a78069286532f7fe401236b4b22e69452196a'
            'c3070e983f624d0c1a6ad262625e6b48e70c1d6886e5b87bbc0daa6b6d2e40aee2a1e0179e0a498977040f5004fc0451bf08686de66ccf82c166d2d5edf9eba9'
            'd051d598e36f6ec9d8c25c85e1277ce6d3e403427de942b60fa11baf63529edcd3bc089cdcd9bfb931ecd4f5157dbef539406eb40ac5ec8271fc32c801a7b47a'
            'f65cdf178ed5645bc315986a1180eb8cd3502503351709af804133e248f498c7f506fae7037bbcb4ef07bcacdff4c38d27517228e1e35fe310059c5f1a0403f9'
            'e5fe13e506fcbb5188ad48a7a14a8589bd9189833d48aafc35a858cf8b7eec932f2243a2a715add95a640d8988b588d842c79e811103c02ffb834d8f65cb945a'
            '0659aa316c1f1f1c6f62d295e7edd83bf281cd50d37b3ef75d2b88629d5a01747afd34325522883f740b81f5f01e0cd67459e61a1591e5538185c777c8960f06'
            'aa44ff38eb5c830d9368ef4735cedd316201242b6cbdd3e01183896db25fdd2e2a2d4e4c5d5bbf135b29e65dc8b929244994da17169dfd0ebb9c1c0eee99ee23'
            'df6c027b9faec8c24e543e746f58ef2ed827a7aca1ee4e86a72f17865e4feacd7a581ebddda9662845314137af1de28ed33db881b602a8a26347dbe348881a31'
            '0c7f1326ea64fda86118388ca38c8efd3a9848861abb1cb804d5444e52f541c56a86762e07dabf5ae7d88d2f15c0c31377e18ab67f5635efdd00c9529a63c651'
            '6b1189db446ba4dfd2abad19a6499f66d766178dbebdd5b9e8a532c30e652400bde42d862dde2c7c52fd3d53851832ae257d7e20a68067d4795fc4ee0b4bf15d'
            '695f3439b803f40e42808a121d5bff718fc324be363447cf85d45548542fc1b7464cbe312407f33be21b45e0a46054b9ab25330cc6da5905590e3b525264e2fd'
            '36d5a356199c547adf0accd7571df8678f6c97765e51cef5de0e4f5d146f2037d404c4b93b85df92ed055768e869fc4d049fe3db4a114e346c67f87a4e31ac9f'
            '4c4e586ec7422db7cc8abe935f105535e6c054bd0c7e895d8a0c7307e8604e8b9185419cb650a845dc623fe4170f440f8110677b26482a74869e9e76eb983f6f'
            '67e80c96d0dc4ff7d770e9333da10e2bb4ea918f31699c108fe7499378ac905662bc2dcc6466cf4e88975744bdc8b5f206c794fc9842d5094485d51970e7eb93'
            '5b8474446d9613fe37e0df86187e9e528d681446a4f9c33d39d61e2b0db8fdaa3556fc26cd3b39ec4756b9d04f363b7bea318800ee954aad6d1717236d9360f6'
            '22ba3a9391d852ac879e0bd621d3e694c5af95ac876b78ec13567bda2ebc239ab70e8540c4fe1526f6842f586b4c98d43f5148e43a77a58a10ee513e6e902446'
            'bb98af140b0f87571753aa14cc25734e6ed5b3715cfdf51c2d622baaa6045b99d274209ed5d8650b9c3bda2a598cc27a875585989599aca9e7c470fe4f680a1a'
            '1c660415a5f1dda57fee52eab00762e921862aa5db08582829405b2b4b5c26f957ba20d094e0f59d3df581034b5ea9f6ac2c2e3530227bce029a065b7c46d9c9'
            '23fa4c16dd634c2f6fd7d236acd6e8c30975e9e0b4fcc964c957c79c4c4ec4e45c5a52992528b99ecea15a55d940eddc9a6fdbb84e444f9a331ec585015b7426'
            '8b19128d13cd7744e5679d8b73fa172b330f0281a11da92b2c1d56a9889eb994c0c62751e4d38b4437b400b0923053a558aa50bf45f42e728796ce18ece006a5'
            '4bb12402ad0494dd172c490f31d00475360dade32620383f89d4b2bce21e18127fde523f317b322a2bf5388f3012a8e3f82ee86e9c1e9221a6e32f79925e5eff'
            'a51ed39515f7ef03e41539b2c721889cbf6ba05d5a2605a959a3a1ad3d17bffc265a8fe92bc9e32fb92a1eb755638e07cb7a230fd6ccc0013cc4e957baa3fd64'
            'e61b91086047887988fe94dd201914ad130ae92fb3bb66bfb453f3cd4adc79329f2b01d013ea40e28cd927b772e31a50cfd933f27a31f51701bf9d6a1e63b3a6'
            'ef0b72ce62cc175ce926e9a98bfa8675ccdfd2f47d40685a8f7b02ffc644c4e2703e0e20e9097364fe72ad35439a4b65f557a744aa3b0ab6ac0bb7c37fa4af24'
            'd9e82e40b94dbae8e11516735defa4674d483bd3c16f40a1b57cb78110af55300abd17a120937dbab87b3dd64eb628dfed0993c10d1d9275058bab5f054a649f'
            'b807b9562451b59ac23178cb00c9ddfdb044ea5d53406a5b23a449393c154a04edb4bce127a52d141dcc0481125294f3d782dd54ea8fe3a70214f0db7db52e5b'
            '4fe30a411a280474e7ef42f2ef6401204dbe2f54c99d4b7ebd5609617edca840e4b24612bd9f56b40222984d4f3a655c13949cbb5fd328d79156962f3f79fa72'
            'f6b8f3404167b98e7ff00197b1076775e9fa86489e488890999992717bae3fe37d1a5af3b16fa01967de1299880cf613c209a30b6c1c22e40b2014e9ee14eda9'
            'e893e211bc8f70c50f03c933cd241e95fc3347c4abb860b95a7a743ed04051f8a28a2137f931f8cb9d9caa85acc3b63cb107a6059dde3e22d4c6207928b30ed9'
            'cb847d127d9793e5b8e4ac2425efd7b95f0e8463bf18cc66938c9c7fd0c6baa32947f309e7ac39ea45fd70194f62a9399bf308bfae54b8ecf398fceb6dee9b78'
            'b7bd7945c51d1b87b876683c23e953ae1013b47e4fa76e434b1df9b390942f183f8784e270f94fa5593c2d99a8693760b2692c51c8517943ad249eaf7412158e'
            '385e7ff3d4032a745367b253f16ffb633c2588ebb5eae5b8783b9b8f099e8c5173089df8fb2140dffbb8c283d5f317640a76d9cb68f47e75602e6a38a2592fd4'
            '2c3e64a1f85446c79d440618b0a449ac8a65f7888d38e25769dd62c818e4760b12b368a97c8b0e38fbce64214d44c854c100ac4e9b7a3f3e9b3320f66a0bd722'
            '7533bd4ed009b16dcd6fd7555fb0eaff56a8c6e1be82dc749ecd4963bfa8dbe042d8e20840c3930d6865c84fb04a52c15a89e27ffdb0cbb8287b74a3e3cb15cb'
            'f561180489515c439dc7d16573df380671a608d0f46a846cf141fa188b77cde20444f53ac7a470eb062a4a9bd05f56681bd9ec68a1f3f8b1e66eaccde6cb6152'
            '548341f373284fb21d37e26d3836590a9e23f8bf1744683ccdef35d58204b3350009f6dff3848bb237de2b5fedbf2ef3e242620d9b1b4948217776199949e05d'
            'e0a41fe20a174097ebcf62e80ef1f8b63171a186b7f471c13d48e5294783daf50e4d0a4fc2029f64cddeb53beb91f1c08615e7393a660c3f04d72244c8067670'
            'b6d11233badb650560b2882d0be98408da533af30ed7980ec9ce363e6bd975661a8ad9e5cf9a186e79d78fe3a29dfeb4cb6c18aadc6d6de97123ef1ceaf89b67'
            'f0a16b45d0767363eeb5fe320e4281df7b83ab77792e737c8602c0c6567bb7c2ff630a9c2dce8fcb2fc513c12442ed4151812e85ff30d5283299017c32c7836a'
            '2e3845481a0c8f6cfe337b156ef05e64c679e4255cd5b580abce615e73a69218381aa902dbb9bb46bf2cce8abe53b62c86e030849a0a66d9f8824cd0027a9fb4'
            'e3303762966af2b9caa2841f0ae81bfd0b238f1176c39da57d2953796d8f4f81d6a43e61832bd8208b7ca868f91817dba7bdd27947bca34294c8fc2fbdb2b3c7')


# vim:set sw=2 et:
