# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Anders Bostrom <anders.bostrom@home.se>

pkgbase=thunderbird
pkgname=(thunderbird)
pkgver=131.0
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
  botan2
  libwebp libwebp.so libwebpdemux.so
  libevent
  libjpeg-turbo
  libffi libffi.so
  nspr
  gcc-libs
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
  icu libicui18n.so libicuuc.so
)
makedepends=(
  unzip zip diffutils python nasm mesa libpulse libice libsm
  rust clang llvm cbindgen nodejs lld
  gawk perl findutils libotr wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi
)
options=(!emptydirs !makeflags !lto)
source=(https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}/source/thunderbird-${pkgver}.source.tar.xz{,.asc}
        vendor-prefs.js
        distribution.ini
        mozconfig.cfg
        metainfo.patch
        org.mozilla.Thunderbird.desktop
        thunderbird-system-icu-74.patch # https://bugzilla.mozilla.org/show_bug.cgi?id=1862601
)
validpgpkeys=(
  14F26682D0916CDD81E37B6D61B7B526D98F0353 # Mozilla Software Releases <release@mozilla.com>
  4360FE2109C49763186F8E21EBE41E90F6F12F6D # Mozilla Software Releases <release@mozilla.com>
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

  # Make icon transparent
  sed -i '/^<rect/d' comm/mail/branding/thunderbird/TB-symbolic.svg

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

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  ./mach configure
  ./mach build
  ./mach buildsymbols
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

sha512sums=('5f0f36409c6cb12cd66b0722e04e44cb07d9c9bf5982db881d50087512a1bcb18cf13ebadb1ac35f8af02880d96832af4e61230ae5cf31e6179af55b822c8634'
            'SKIP'
            '6918c0de63deeddc6f53b9ba331390556c12e0d649cf54587dfaabb98b32d6a597b63cf02809c7c58b15501720455a724d527375a8fb9d757ccca57460320734'
            '5cd3ac4c94ef6dcce72fba02bc18b771a2f67906ff795e0e3d71ce7db6d8a41165bd5443908470915bdbdb98dddd9cf3f837c4ba3a36413f55ec570e6efdbb9f'
            'a34dd97954f415a5ffe956ca1f10718bd164950566ceba328805c2ccbb54ed9081df07f2e063479bf932c4a443bb5b7443cca2f82eea3914465ed6e4863e0c0e'
            '7e43b1f25827ddae615ad43fc1e11c6ba439d6c2049477dfe60e00188a70c0a76160c59a97cc01d1fd99c476f261c7cecb57628b5be48874be7cf991c22db290'
            'fffeb73e2055408c5598439b0214b3cb3bb4e53dac3090b880a55f64afcbc56ba5d32d1187829a08ef06d592513d158ced1fde2f20e2f01e967b5fbd3b2fafd4'
            '9897cb0ababc8e1a0001c4e1f70e0b39f5cdb9c08c69e3afd42088dfd001aa1fc6996cd83df0db1fb57ee0a80686c35c8df783108408dbe9191602cddd1e3c65'
            'bf14e331768e1bd4019b6856663a7dcf83d3983219100f8f785597286dff9482373d06c47ade864bd1f0d3f425de5a8db2e1b10839971d5b1551c1fa8f46261e'
            '198cb211aa9eb7cadf0bbd26922e4df4c44347d4a116cbc7e1606bf4e282a403ef50697114ccab693d16d6f0078044d5389ac2c7eb8b48aea01ce21faf2a212c'
            '5175cc0c214c30dd691ee5862c848bc4d43a33bebf363e867635757dcf65f9420759bd50126ff1fea12e6ef35692acef0e8d46020dccbb44b79d8600195bfd07'
            '19578453f763670b3e18ffcae6fd6030c3da852d8e4b69aff2a019d76486d2e311755415ba2619eb37148434ae02c978c26babf9ec0c465ca6e124d68020784e'
            '10ec1dac27abaa519a070236cc94a4c31c42bed0841b97afbd95b31791a5e80c1fcb3d5149b48a0ac0f54556ef8f0fa3c449da310d46a6d6b91fa113aa397ee4'
            '436232205e1ffe4ce50b0b582c113787c98b31f702ad2532bffbd358dce79d1160bf1522709b6591ce4d5ccf4234cee1ddf4418ceadb2484330547a984094993'
            '8e0ee28fa7f6e691fb7491a2ab7eb7a45e50d636b7d6ee73e2c519debfc0e3d8009b0280ee31d905ef73f2e1ec32331aa8445707e1ddd74e2318c24449294d40'
            'fbc95ba2c2245e81721a82db2fea255897b3e8631442950af62eed17a4653c593061ef8d8670d1976d0ce93277ef733ad6620edc0e95852afbf78b10c4db6100'
            '75f791eaab71d34fbf8dbb528c27cb93b8d5c54b5e9d2e27185ee968d91d80ed63890d98b6af88d55ecfebe12e30bf9eb547c3fc68b6b66505cc68721b8c679c'
            'dd9bae68ce08f185da3d49a503570a7ae28fccd77d80b1a906abf93a107ad14d7b8db2f8151b074e4f3a0dfc9e6f8c557097dc5c843b4ee53f03cd83a7b5d35b'
            'aeca368d5581004cf532be776132cf2979b334b0eb746806163ee39e3bbf219a9cc19da62e4a4627d963d48afe2109eb2edbbcb3b914022df8a67294740b45f3'
            'efd29f726e4149dcdf5840d764e97815bdab7dd71e5acc371327579ae55b38bf6b76afa3ed51ef160d24b3ab4f99db75ec383d7df4d5f0da0f9365c046a244db'
            '03b1174bb0c357cadde7f2275f49ff15904c81aab6d9a8b1ec43d42b215e081fb84821f2860f311494616e204b06e05d430c6210da4ff5b27b324f163ac041d2'
            '4c0dfe06d47a0090ca593bd45d61a43c4532321fbd33d55519b1b8b15e4859c74a7e16c33b3a578fabe192631566891344e1a39d6b0bf4795b7e2cb7457aac18'
            'af7594ec160f43bf0be8bc5dfd633a53c8171d79b77406d0c0ae1af34e9ca8920ef5749a0cb31f4a47217750c6f0275d3f28631905b0531403a241a00930aba9'
            'b996273d265e1aff1f5920f83602257d109459d4e666d43140543c938e68e9375e395f03e651dfa78e9ba3f5c6fe00976c469eea89251e448d4b3db8d9334556'
            '21712fe88cd5566ed422b721229ec1330eda0f1129040fcff221cdb651e659a916bbc6c6835c49872bc908b82b1fd71042d2340583bbe09d42044cc6e7cfdb1b'
            'a8ef6b2c317de71677c5290da1fdc7120ce6a7290ac650ac63ad0deaae0b858d05ad455791c9ce296d1fbcae318026b102c76588e378953ce0189a804311ec33'
            '217d646d5a05448714f5d3dfb6cef03199f3bf8df0959c7de7fc461a6adfad4337cfb76d07bd5b6429dbd8ec074ac664f3443a6e5512dc0db57457d1580f596f'
            '624bfdfa2ed54b510c3c12ea1043e8eef5d106b8fe9a814ba5f31eeb3865866271814b061f842f3e47f83838a66ddada50283eb2ffa4dbd3c7a5edfb6beae86c'
            'bdc5b55c616e8fc89a3d0a7023bae76cd5f64360cb195df98a72a2b9348a94210bc64abbb07990b4ba19b026614c820102cca3d35d79ef82e3e49b185aba0961'
            'd8e278764f66251e52a5c49bdf155d126eaa70165f26a90c8fc0d14df86ff909db3f21ea144541f57b425d40f49cfe4e73166301973996dd236c0ab3248d5ed7'
            '3dfaec40061ee839b309c457eecb6551a5f77584003ae6a6f07f99105e01420b49831f4d2f5daa4326ae1a5aba7ce145c56fa4016cb831bcea20ce7a2fc69bdc'
            'c7a9f050959f529fe0230aa40e91b922230cd50bbf648e9f114eba4006f17aa9385ec04d60ef571b5b410b2a97faa668aaa048d0862128ca88baa32a7c145990'
            '54da1087e1bf7c85a5830c2859c7364fd6c7fcacb13fca29b38d845e8cec3af5cd433f0648c588911fc9bee0b7819fe05f1d181ee6de44c06796f8383f448344'
            'c499d355134192a60685d6ce85410d4eb5d90f1a9a26bde704ae8358d5858d7fb60793513968473039f4064f0ebcaa6a5543a4a3f2ae6814a29fd80013d351c0'
            '682900313e5ae88955401c40bad4eaf0ef3ac415e4058916f872ba7de11ceaeed75e4584fc160519a2334f42f796553ae045c6f053bb1d13c41cf7bbedf927b3'
            'fe9d3ea05de6a5959378c982ea3c60f00fc7b0d3e3e8d59875ac67bba4e491b52607f24fcf92adf90872a60e7beac37ec6a31ccb3758a2eb78dcfde0b6a406b6'
            'ea8c918dcb4cf2a3c845f499a9f471d504759cc8330eea8e0f572b22697d6c4e80e1c527c05d31df7b1186d1400a85f090b47e4a9f29a1b02dac1a2c24c38bd9'
            '1b83015f0b746de318cf4080d9ca7071c645fd6db106ac7b68ac80a364e59683237dd8a66e0d4510a81efd345cd278c4d645013f52b2b910ba9da8ac51fb8e1b'
            '45637cbad96f5216de288ba27589672d29a2f5b7b82e76ef6931df3db4e8a7f1a58858ca85b4700845e48e93d34f064c17f145f254ad59d4185cb1d1fb4fa3f6'
            '50f320bd314a0869e2c5d48a44ea2beac05037da7e95efef1ea0aa087fb273b2735cb5a05d611bb0ae1d751b5c8ecc8563af88023dbd5aa987dc92019f95ad88'
            'c046c420c2764030f37b473e6ee573e716cc23155972487fb16eafeb13f1e0c450d5c3645684e5dddc6e034efeb451661de57b205f036274a4eff863684f30e5'
            '7fbe3e5fd14a1d141d5bb77aede84944f0f65e3b442ebfcf768e53a4f6ad536782a8245f4ded6e926f753604f555c45b00ad9e711ec779a303bfbb885d2cadea'
            '5fde8f7525f407b90ec23408b8abbffe7514d9386283ee27b69d6f1c75e9dbdd0db0ae08e15068e3cd20021a9ba0f51b71bbef0a594034687202736ea0b736db'
            '00ea388f46458649a992c428eac370832fcee25e34e1016a53ba0e0cbdcb79aaa1f10b1c80ca4a1600bcd0a84db1346912dbb7d7b5ea8fbe3905d97fb5d849e9'
            '50b61a07a3941ce4f9de9df885d1c3cbbab9b342aac3082147d69e262b9f842e4c8ae125f89c3c3d15cc914aff771ddcb8421283ff362d6d8c73caffcb0413c7'
            '4be1cd51b800e2c39c1d982441a4a803ffd8ad62d5be4a6ae25a10f05abf91de1ba84feb85077098ad68e916787aa534b5223b339f92bea1c625baad0778e1d8'
            '65e592426e58811b56db8282bb66e6bbee57f71998e2afd9f24cd663ae2c43137bc6e8c6729f3703c63753c1e62dab0fe1473e412f4f9f3589b14f8eec102b58'
            '945efccef7baeecfe951a2c55fc0de4a3b554bf261b133a8fc6f1762edbb5f73f07d83c83ae81021f49c7f00fd8abe8099940f7c174bd0c665cbb9d09a2f2370'
            '2906fec83088e70eea7d525297e2f3dfd6a1bed5db9fcac171950a6e247217f7e2f5635c54a9470a402d2622fb40c38ec27dbe7f4b8cba848e81a21207c00d12'
            'f15328b0aa27820999a51abecad4bb21b24038d4f44c80b9d8964cd65f77b01bd5e4f5f7bf8f0f62fbb8ce28d129054efb5386ee8177e2b01d7b654cb646a79c'
            '38b5cda7eaf62a314abc74861eb229721440eababf1e2b471b38c53882f2c43edd9456ba93cc39382460b01450dc99a58f7fbd52ff669102cc76ab74ed5481ad'
            'd8c474754b92c5f383cc75d2598d4f8cd84c3ab5a0a804b3d2891950f4cd9522c67fb0dbabd420888f2597b667e065aed7f36a8a55c74bc9eab88c39d1d0c5fe'
            '9f3e5dbfdb325d5793717d4886f8c63c551b342b8e6a829c287194926c20e19608e6e3b1c226f23af34865b69ebaa86e250d97d1d6d4e02dd986120befcc2b68'
            '324cc28864b9fe7bd8cbad61a262e042d191a09152e94cd9f9736227a0118452f5e5d418f7cfa37a9934fa4d83087d83f423e36a456a92028e4bdc4d3c517351'
            '03c2999c4dae5b565e707d8f5d9b5656572d6367daaf73b57c6d1496f83e3decc3c4cd77aca92f73b48c7fd0601a7531ba7d21521d8b3e161ceb060d31449c70'
            '313fa7d4868232ee396bb9fd1a841242974a76c8af37a7c29a2dea682d95b6808c4f4d9e962c5a5e326e17e0143b1a718586c8f71e56c80e609018011b9406c9'
            '0ffe84c043da9ee98999c0a97a253992ebbcb9d817be11b4c5a12c47f41bbfb41ec60d7cabec1dfe8a4c5ccb0ba9fac27846588b7ae12295da3116c0e09bc076'
            '4a4667b5095cf3872374705a611b6101f5fbfd1b10fa4c82920f703bb9baf76d0481d2441d40bc30993f7008bf035b433d5a4d757289a9342a654b6de2729a1c'
            'f0ff61a9e1d0eaafc1d858c5dfa447e66a5f989dbd23d4ab072034f0f7de5a0263c37df5a846c8bc46919b4d858dc1c14cf0946f0021f306099c9b5da774443d'
            '8335f85b3f158c08e91e644882901e5ac679b6880495eac286a4fc96a3298d8f3a5e1ea743357afcc9de1f45468847e1408cef3417db520e93f46e125731adaa'
            'b708bda8a78c5be85d7cdac6463bdf29a78046a803528f1c8e10a14e4d35f26a74b073a7de440218990e51dbc28d594af6aa5a4178a1621f7ae5ea3640a3c956'
            'd1ed5a19d70139d3104096290701b4291e846246f29b26d041c96bf90e712e03107199d0d1035eb43a8e1fd769b5ba2e72133edb7e4d72a85d53cadd2c7e77df'
            '92b38c5c62908c7a8d75f7303396d78584cb2c5d02856fe0e8c35c62fb442e4d4cf295eab9d6665f64b9fee20cec2a7811d4627338d55efa6bd7e01c0ef6bb59'
            'a79ba06b12a98113cf4d025ff7d349c0736428476595d70f3d50a2961441368c5162f712cf9194737b02b8b3f96a7870546631f946e27578d167e87614b43be6'
            'c16212c4082d8e111262cb72e847707a4da61a75dc7c5fa6968c20c6d89aea013767f48edd5443da75035b3756f1b988d67b47bb35ea21268103eff8e66808fe'
            '9678fca0131d3f17b707700bf0a32d79a39e0f38dc33ce7bdf444d099795331f9941ae70f0589ae3fcfde19e2c5c28a7b20ca2cb9343151c67a4f0dd9dd5748d'
            'bf834bbf583843bbabb992f150f4756b8e7d634a5a9bcb144ccd150e0602f8193dd5ab897d5eabcbf92f26c0f5fc70d687796c341405f7e0cd5e9f63f02777ed'
            '5719bf3ae8181b7dae51c1dfc7219f0629e8ea1899ee5266d9f38ad68a219a67fa7a5ef8d76a5f414e057c77467eeaa65401631a6cf8030a5055df016188e5c4'
            'ee297f57bf044cf7ea610db661e8fdab65dad3d66637bf708f75a53b6da99837f9e738631ffb9c019fece1294c3ee966d71120547c847849c3b0accd21813c72'
            'c79b07a54e2f3249d7372d86d9e1d5b57c09f05a1a1d1a9107084ae2eaaf9ba4d4c2c8a167c1d21978617805cf5b12f2d7449bf79ef2cc01459277468945d22f'
            '3b915095dbefba250588eec66df5eeaf303e93a8585120bf8fc731728ab777fe2a57bc5ec4f29ba6b7a476f916d9676903c2de49b362663bb3b5ee5b927fc663')

# vim:set sw=2 et:
