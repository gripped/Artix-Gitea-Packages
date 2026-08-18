# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Anders Bostrom <anders.bostrom@home.se>

pkgbase=thunderbird
pkgname=(thunderbird)
pkgver=153.0.3
pkgrel=1
pkgdesc='Standalone mail and news reader from mozilla.org'
url='https://www.thunderbird.net/'
arch=(x86_64)
license=('MPL-2.0' 'GPL-2.0-only' 'LGPL-2.1-only')
depends=(
  glibc
  gtk3 libgdk-3.so libgtk-3.so
  mime-types
  dbus libdbus-1.so
  dbus-glib
  alsa-lib
  nss
  hunspell
  sqlite
  ttf-font
  libvpx libvpx.so
  zlib
  bzip2 libbz2.so
  botan
  libwebp libwebp.so libwebpdemux.so
  libevent
  libjpeg-turbo
  libffi libffi.so
  nspr
  libgcc
  libstdc++
  libx11
  libxrender
  libxfixes
  libxext
  libxcomposite
  libxdamage
  pango libpango-1.0.so
  cairo
  gdk-pixbuf2
  freetype2 libfreetype.so
  fontconfig libfontconfig.so
  glib2 libglib-2.0.so
  pixman libpixman-1.so
  gnupg
  json-c
  libcanberra
  ffmpeg
  # icu libicui18n.so libicuuc.so
)
makedepends=(
  unzip zip diffutils python nasm mesa libpulse libice libsm
  rust clang llvm cbindgen nodejs lld
  gawk perl findutils libotr wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi
)
options=(!emptydirs !makeflags !lto)
source=(https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}/source/thunderbird-${pkgver}.source.tar.xz{,.asc}
        clang22-wasm32-wasip1.patch
        vendor-prefs.js
        distribution.ini
        mozconfig.cfg
        metainfo.patch
        org.mozilla.Thunderbird.desktop
)
validpgpkeys=(
  14F26682D0916CDD81E37B6D61B7B526D98F0353 # Mozilla Software Releases <release@mozilla.com>
)

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=16674381-f021-49de-8622-3021c5942aff

prepare() {
  cd $pkgname-$pkgver

  echo "${noextract[@]}"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
  sed -e 's|73114a5c28472e77082ad259113ffafb418ed602c1741f26da3e10278b0bf93e|a88d6cc10ec1322b53a8f4c782b5133135ace0fdfcf03d1624b768788e17be0f|' \
    -i third_party/rust/mp4parse/.cargo-checksum.json
  sed -e 's|880c982df0843cbdff38b9f9c3829a2d863a224e4de2260c41c3ac69e9148ad4|239b3e4d20498f69ed5f94481ed932340bd58cb485b26c35b09517f249d20d11|' \
    -i third_party/rust/bindgen/.cargo-checksum.json
  # Clear cargo checksums for glslopt - the glibc-2.43 patch modifies files in both
  # third_party and comm/third_party copies; clearing is simpler than computing exact hashes
  sed -i -e 's/\("files":{\)[^}]*/\1/' \
    third_party/rust/glslopt/.cargo-checksum.json
  sed -i -e 's/\("files":{\)[^}]*/\1/' \
    comm/third_party/rust/glslopt/.cargo-checksum.json
  # https://bugzilla.mozilla.org/show_bug.cgi?id=2041134
  sed -i 's/log\.warn(/log.warning(/' \
    comm/build/moz.configure/gecko_source.configure
  # Make icon transparent
  sed -i '/^<rect/d' comm/mail/branding/thunderbird/TB-symbolic.svg

  # Set BOTAN_VERSION from system-botan
  _botan_ver=$(pkg-config --modversion botan-3)
  sed -i "s|crypto_backend_version = CONFIG\[\"BOTAN_VERSION\"\]|crypto_backend_version = CONFIG[\"BOTAN_VERSION\"] or \"${_botan_ver}\"|" \
    comm/third_party/rnp/moz.build

  printf "%s" "$_google_api_key" >google-api-key
  printf "%s" "$_mozilla_api_key" >mozilla-api-key
  cp ../mozconfig.cfg .mozconfig
  sed "s|@PWD@|${PWD@Q}|g" -i .mozconfig
}

build() {
  cd $pkgname-$pkgver
  if [[ -n "${SOURCE_DATE_EPOCH}" ]]; then
    export MOZ_BUILD_DATE=$(date --date "@${SOURCE_DATE_EPOCH}" "+%Y%m%d%H%M%S")
  fi
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=none
  export MOZBUILD_STATE_PATH="${srcdir}/mozbuild"
  export MOZ_NOSPAM=1

  # Set remoting name to fix the missing wayland icon
  export MOZ_APP_REMOTINGNAME=org.mozilla.Thunderbird

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  ./mach configure
  ./mach build
}

package_thunderbird() {
  optdepends=(
    'hunspell-en_us: Spell checking, American English'
    'libotr: OTR support for active one-to-one chats'
    'libnotify: Notification integration'
  )

  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ./mach install

  install -Dm 644 ../vendor-prefs.js -t "$pkgdir/usr/lib/$pkgname/defaults/pref"
  install -Dm 644 ../distribution.ini -t "$pkgdir/usr/lib/$pkgname/distribution"
  install -Dm 644 ../org.mozilla.Thunderbird.desktop -t "$pkgdir/usr/share/applications"
  install -Dm 644 comm/mail/branding/thunderbird/net.thunderbird.Thunderbird.appdata.xml \
    "$pkgdir/usr/share/metainfo/net.thunderbird.Thunderbird.appdata.xml"

  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 comm/mail/branding/thunderbird/default${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/org.mozilla.Thunderbird.png"
  done
  install -Dm644 comm/mail/branding/thunderbird/TB-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/thunderbird-symbolic.svg"

  # Use system-provided dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/usr/lib/$pkgname/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/usr/lib/$pkgname/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/thunderbird "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/$pkgname" \
    "$pkgdir/usr/lib/$pkgname/thunderbird-bin"
}

_package_i18n() {
  pkgdesc="$2 language pack for Thunderbird"
  depends=("thunderbird>=$pkgver")
  install -Dm644 thunderbird-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/thunderbird/extensions/langpack-$1@thunderbird.mozilla.org.xpi"
}

_languages=(
  'af     "Afrikaans"'
  'ar     "Arabic"'
  'ast    "Asturian"'
  'be     "Belarusian"'
  'bg     "Bulgarian"'
  'br     "Breton"'
  'ca     "Catalan"'
  'cak    "Kaqchikel"'
  'cs     "Czech"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'dsb    "Lower Sorbian"'
  'el     "Greek"'
  'en-GB  "English (British)"'
  'en-US  "English (US)"'
  'es-AR  "Spanish (Argentina)"'
  'es-ES  "Spanish (Spain)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'he     "Hebrew"'
  'hr     "Croatian"'
  'hsb    "Upper Sorbian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ka     "Georgian"'
  'kab    "Kabyle"'
  'kk     "Kazakh"'
  'ko     "Korean"'
  'lt     "Lithuanian"'
  'ms     "Malay"'
  'nb-NO  "Norwegian (Bokmål)"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'pa-IN  "Punjabi (India)"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'th     "Thai"'
  'tr     "Turkish"'
  'uk     "Ukrainian"'
  'uz     "Uzbek"'
  'vi     "Vietnamese"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)
_url=https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=thunderbird-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("thunderbird-i18n-$pkgver-$_locale.xpi::$_url/$_locale.xpi")
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

sha512sums=('6a9271af8473fa6679d4943a35fab0a335e8eb736aebfab4d79e250578faf6090cda19e80708487bec7c2221242b059072dda9ca817478a6d76556594972202b'
            'SKIP'
            'b7097f0d620be87047f6f11f152bd096dc144b1745fe30dc75db7d7050242c4178382f7e504cc10ad3545a3455174ca17a83fa3113443dffe660f28de006cb0e'
            '6918c0de63deeddc6f53b9ba331390556c12e0d649cf54587dfaabb98b32d6a597b63cf02809c7c58b15501720455a724d527375a8fb9d757ccca57460320734'
            '5cd3ac4c94ef6dcce72fba02bc18b771a2f67906ff795e0e3d71ce7db6d8a41165bd5443908470915bdbdb98dddd9cf3f837c4ba3a36413f55ec570e6efdbb9f'
            'f528f2645c44648a8a42015923e51b8626616e2c66cc3ff870c27223002c802c15616e570d639f9c79b3affa4b7f9e9f2c42c780bbcb42a55bd87edafa8352c5'
            '8373d45b594edea2aafd00151468e5c9491b1baa078882fea76669352d64843d5bdaa8ad87b0a9549e452aef7f246a5919b4b1e4c0c1deaf6ea65bc2dd120a32'
            'fffeb73e2055408c5598439b0214b3cb3bb4e53dac3090b880a55f64afcbc56ba5d32d1187829a08ef06d592513d158ced1fde2f20e2f01e967b5fbd3b2fafd4'
            'bf6283c35cebe0aee2514412b51e7f2880d3366e9e4ac4cd18cc7af38b4a391157623a1da8885afe7e2d82362615bf6961b8ba1aff867064dbb8e7ec26f4a88f'
            '291d74f5d47a05350105e524d8931dbbf6a9556d3066af791d589489bfc816f390b47e5faedb294894acf7373e35cc65c1c3bf1ba048d0754f5e8daa75a32f31'
            '0b1137f138774d0174c9033f699624ab0ffa0ccb64d2a655deb1795a7807502b39fe51cb87e6a23bd5c6a5e37e9ad473c373cb7b5b9b68aa24a4924a02a0c310'
            '6d8690f8e8ae08e64a12b76c8874c00efb3b4bd274f2a83fa716c7626a83718994fa19852ba41872b7fde7aa58d108ab5c1d2b1b1e81ac56ee72190181ecdaed'
            '1728fac43d968d9a20db0199b5a51baacdee1078a339d227ba5e4c401da034dede6c2f1cc6f10dc52f97684220a0c9c62e91e85c3debbf730575edb0dd7ce3ed'
            '4ff88b6c143a950a3751ab5e1ab63d53a562b214755c4f19b27879255af6f1a05b8d2cb4a04d59f54273c4f54f83f779eec2f134276c8e7fc1d5dd7621a47797'
            '25ea4c86be52931b866841763cc49eb52197ca557969b7d08c6b37e02bb1d72cd61b8ac7e0d7ef3444fe9ecf1d6d3c7bb07fdf84d74e101defc3999add58d543'
            'a11e1dc5a9e3ffb8b31ba6b7844ae9e55cccd272776d92457a2e428584a68d4587dd8c3f15652efc8000f70b3c022e1f811723264df9dfb28e7cc307bac1cdc5'
            'ce3267bc2adb52d563a46428011bec6cb5e58227118b03aed87042f8ac1a836f82399a8530ada8e1e4d4b1ca706e69b547865acc3f7c8e0001375d5787844085'
            'e9f637dc2839972ed935bed39562ac9315074d5304bbfd081c15b4d343560abd2bcbd0a8b7a74937761a6798040cc1bfc9e946afc5fefb9b7bb1980c4c393a72'
            'f1289944961266841f697e16a7431c6163596c74eb10549df7e29ea3aa1988ae98be9119859c079314c7619b7cc175b2f4d11e8eb53f78623346671d82a5f2f7'
            '2f892e5b1671fcaf8741446a1fbafcbc5288f839c482f0eb118a99c854f2a54303efc630d5d43c5a88bed1c238d897fd6c44b3462516c5510a62b39f961dcde9'
            '6ba12012a8c10a246e37ff1f25eeb716c14a387d9d75eb1e54e8e8b68bd40b3c54187eb48faa2f263b50ba53ecec5e066701962e6b95cf02c8382043b57992f9'
            '1487237ec2294a1ece210fe1951cdd6614899f741701af1e974b1929f6e75b4d97aba6bf456cb494eaac6d73a41e56f9409dd10955bb4aa837c8aaeedf2d0d1c'
            '45ceb548bee8093dc1ddf68037004c1c6a57d620c1d843b9e059af5edcfa5452b47bd12170a82f122e48f6873e2d9593cf28ddfd43feb91fcc6905690a89ff46'
            '9a82ed7541750444ac5be804d472d52edc1275adc6dd95b67ea64967467799236035f3d5f92eed642a469d40ad84554e6b87b2b7346441c1417777520438bdf6'
            'e82ba4030f919b07c3c986c831f364e09bb3fcd1fe38422b0e7aae8cf091568dcbfd9a84801a633ea9c99b5d8d8263770d66795769e7ab0f29f89c2646ee70a3'
            '5d9a70a7c2990295e16b367ee93aefb85295880a6cf7d41953933d947a123231190749f899d9e778c57eb493960c822d70478ba31dc556720e33abca52031d8f'
            'dac1bcfe28627a8a91f622fb666e5dacf8c5acf8fce8e1d52854d2e09596d0088b7d2387b02d8e3b4e13dabb8d08288b94656e77ef2869a9dce03cda7f10e165'
            '0da59962f26bb56844ec39a62919959ca38cdc6c43f5d9a5bada9f19dd4a402530122f593b44b910ac052c9d491cb7d93ee3e7bf56bf6a45ddb046720f8f02e9'
            '0edccd7ac66588f5c419fd5dde9849ca83f071cea6cc9eca622325b93e2831b7551076ff745e72da7f11d22f3483b6afd62b1fbeef30cc4d13594a957a3552fb'
            '800c9c74fcde21bd0a345518a24f64baa94a2b0b7224f59eead5f228116a8e27015d0104f1dc03bde2f3605a58f39b97fe893c1819a457582fd156c27ba2d86d'
            'd6cf124e9dd48cd42cf28ae00c0f6849f1c85253c16253a96ef58e44f6abb05b083993ea8f3bcc33b61ae20817dd79182a7a1553f525976c927c941f00c7c652'
            '0fcf2b8cc3916dc1c8e10b8dba2477639b30b0006c2213e4ac4fb8e2fdeea4a95cb950c94d05600bed7a7ef6fd8a610fed143b685f3ac8dfcb907782a5b86b6d'
            '64277aa4d065e1a3cbfd56bf6e805bd1526f76b4816f33102117ba3c59930980f60b80d8f06b6425461b378e3e7ee240b367038472ad15a5a1dc2087b61b82d8'
            '63e2152cc8d95181a6dfbf21b1530180b0557fdfba1accd3863a2f861aa584b6d998f986869d273bf8e97ede3d0c70b8ad419668a78fe3476583aa17bc62302e'
            'fe33a7106f7a1c7c505ce3f7e15c5c863b5233677476691b7369d09eb9c4604534edbecd3095d04c20cb5a9210d14714d1184bc4ed15832d12c18501caa051c6'
            '19a805d558587f6eb5f3b8d3b480dbbaa86e90b42b9dfe732458bf61ff6144c634d75b161bc451b78a8d8df89f84254b429be83c28855476a768ab02fe7eae7e'
            '4f5011536e39facbea86c3a04868886faf4854439068f0adeb591535edaf9a8d26a4f3f167b177673905be1dd807985eb893ff75ec2870f5501c50221f1c8182'
            '6f57f55a59444928009ac38357fe2e48f7794e5546cd421077d18bdfe307df962da8cb82a7dd1ef06f253869c1f5b8009706ab438a3258a3471a12697b2999e6'
            '7a5752e4a13c9a6a58804bb31f67ef88ea97c668d23263d5c3b2ef1d3fb4cc9fe4e79dda79b9186499a57768b13d8b1563be1bbf46bba5441b5dce4513502c07'
            '54af6af7e74f83d9c4adb579d3d696bcac1611961ca544c89f2591bcc5092e8ecf9b255a92a47b4f400f84dda64abd189cc53114d4a1384b78172f6b51b4cf8c'
            '931e1ee95f58ff784128aa0289143a1cf8998f96277e4d6463b22eb975a11b62e9df1cc23097b590ad480df05ae428190f038d9bb1513bccf587df2e00186af7'
            '8ce15c6eb085455a9043d08445cce09fe0e5d93138fda7a21972553747f23b35957a51e5de8f6d2d2f32f4767c0ecda171d79843523ba3cd44e78fd38a133f98'
            '341a2ffe3a03a5df5182c06eebcf6c7d28e52f48913af96cd4ec679b83aa29288cb4d4b621756ea7d9f8557ae3749f22a08a88eff269b2cf5c29933ddcd4a2e6'
            'c5d91d38a804c5d2e03de312e6eae7dc5b5898090d0bcda433194acbcdd42ef41e28904a3e12b565e8a382d9a7b12be324ab46ecb20d181cdfe377d2678380a9'
            '2851ca608360d0b62a319f0bfba119446e2aaaedb9bc9435e6378f12081c23a2ecde0b699cba1de7066829ebbf487fc8a2ff392b5f2b7b326330e7f912650d6e'
            '4248bec5f15505fef3a8f8703c3caf411debe461b5a953ac77eefc0b70f806fc472b89031027b1631ade5e2e29acb0f472bf75603bcced4a16840b6c5dec7e1c'
            '33ed61074e5fc83ed02b31bec02f9e5423bef1bd6327e95e79e0ee9e41d3d999498881f2e3a5d25edaf9b2c62ce93f2b72968d46fb101395709201be2c5f89fd'
            '0dbd5e44535ebaea9035124939baba76cfc8f8dbe29c555adcda1babcea6e15b1294394273845330fb9ccd7be214f70b709de34cd1c63f03c154021d369fba08'
            '5d8391b2b2067ab3f78b4d5eb104436f2c73db8c0ed65e9f63f6a6a92433981dc86acd17dff0c243cdfe89e7a547db20a4e7fc33d799e7e6a75aa7605d99f7d3'
            'd928082981f972e922bc5688edad11e90d2663f10eb26fa57b1d04056bfc0c7c5610517c4c46d239e0edc4b9841afb55ad1091fcd43868ea4b622bac66515430'
            '9ef55b7dd77ade77e060b3c136ac9cf40a467b0a6a073b2d16e8044b6753c2a9d88b99d386cb2fe881345c4753aeb536305522552d7f359380e8ba9dfc2318cb'
            '3abb87270bd28e6d48ebbd2d6954f8ff050a0d16318a1b19e594ab01a84d7f19fdb967ae630fdc987c0cd55a2af810f70af4f42a2d3b676a05a98624bf6ddab0'
            'e52f017bcf50672d5f73fc1650678b26042206b0024aad42907ab66cf15eb3532e1cce0535cfa63d60b99d74d6310fb6a9e48b114f8ee7ce940e096e0fcfb967'
            '2dd010b6ea45a2991bf11b9ddc01864dbec3e28702067f5b81e2d6b45033fd55e00198a6c7818867afc4b83e6bc56169a1c95c077b9c808bc2754801abb6c6fb'
            'dd4b43eb5328c056b652f94598910c9a09d042e69914a6309541fb5f6ef102a2fa825583d204dfd1ec2764f7049b86e3bd3da206460fe410882871d091222527'
            '18235f547f256bc68b70c7033f55f93e2f005003c37cdb5642ded4dca11dd368a0149ec8d66c46abf9085ca669dead3a9c814b41eafd922b8a42b76dc891d401'
            '5479eabde74b6c99b419770f4cced25e2119df3b6809c97d9cbd186b19e49d732a18c845a80b5ec0267a488df713d06c678ae74d2d8237b70c97dcab5260bed4'
            '909d4a3e0a8b3eae672b8b53d08b9cddf4ab4536c004173f5d274d5403f11a75fe01f70518b284c343f245268ab14b25ff6daf2da843f986befc0c6143324824'
            '1b86a69978784d77c6c47998b3e99bd136ed51e21b3811ff692d8d068e9bf0812ee2a693b2dbf0e73184a3ee705791dcf6605e0fdf7b8cd62b392e7f8c5badfe'
            '0e84b0435a7091347d393b329475cd17c3d52ad6d79ff4c90e5880b6c8441ddab67bc7a4b1a06c36218a60168fe752bf708e5330b225eb36960ac965e0c5c986'
            '50742d968ff0b4ac4ddc7f94e5dfd85632a4fdb7e4886b466179bf8765b937507ca254c408dbf545535e6f88fcfce3a03aebb793437b3fe7db59f4df83818551'
            '2deaf8115d05fed22d71dad3cd61c2b8ab0ef357597852c821d8486170013b3b3a6c5b33100fc37bd4673005b5d79e006873dadeafa2f5a3400f168e70f8d817'
            '001db079c765dd818ea353b285f68fc8b11c9ed7a19adee99e60cd29418b783a92cf59c57789c7722aa8a5af96d03af7f0ae5e1e2a72dcf49e76dc815b884caf'
            '5b7b67c780cdec46f23294a104d405301c04049a6d3bbfbb4f2bac10460c9513eed0b7f8abf74960046a5e0289eaa3d7eab98d2626205834a21c6274082652b0'
            '93439dcaae132bf9e2dc968ab717ac8ffc8a124aae3bcedb0162957967550ea05ae04b9872a1bae464822409ba873d3d47f162cd47268433989d8c98394e09c5'
            'c694072b9344ca426fbc4855ffe85c8d6d9defe02c4a37f0f7ad4cd38ce9f5c4c317f421f69fb7583fae69add702ff490b2f99b13571d792ad2f46416db3af62'
            'ea8466704bfe18465f37ff6e7e34b44bd8b9aa391bbee6bdd884e849068bfe4436cad545db3f9ef7fd5075a7f4adda110a31b864cf1164230bbc62ee519a9883'
            '2567a0624c146367be2e0b70025eb20cfbab5fcc17ffe1e5104b14705dabd0be77dcc13cb60cb212df6bbd3b9960ce0f895167bc66a35a7306a9bf39a8760044'
            'd9adc218114826030eb6a2c946cfb7ab5cb48c96dbea70a117c53cb6ca4767289c27c7fff2765f6e80702419514136b08baf8cfccd243e1b189dd75f1865f6b5'
            '9bfa486b6a55c55fcdf23357e38bf16cab83954976779f11994bcde67272753b5aa88479c7dcdb00a2d6c6f0c2d311be358bf2376dc072373d0f1a7ff0bdbad3'
            'cd1e635c5e0be23c1162d278a783384d86a57bdf6561263eaa2a8281e2039fb6b6ef6bfe2b2e370abbb8e5395452214c709bf7c356359e54f0cbfd30f4b1ade9')

# vim:set sw=2 et:
