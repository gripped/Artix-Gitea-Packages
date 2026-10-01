# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Anders Bostrom <anders.bostrom@home.se>

pkgbase=thunderbird
pkgname=(thunderbird)
pkgver=157.0
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
        mozpkix-x11-success-macro.patch
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

sha512sums=('4213e8584f42cc6e518f1cde4bbb919a1431950340fea51c5dc1e6423c04d68ff57747937ba125f3d7ef704d3bf0516d03760a14d3246aae9b69cbeccbf09598'
            'SKIP'
            'b7097f0d620be87047f6f11f152bd096dc144b1745fe30dc75db7d7050242c4178382f7e504cc10ad3545a3455174ca17a83fa3113443dffe660f28de006cb0e'
            '6918c0de63deeddc6f53b9ba331390556c12e0d649cf54587dfaabb98b32d6a597b63cf02809c7c58b15501720455a724d527375a8fb9d757ccca57460320734'
            '5cd3ac4c94ef6dcce72fba02bc18b771a2f67906ff795e0e3d71ce7db6d8a41165bd5443908470915bdbdb98dddd9cf3f837c4ba3a36413f55ec570e6efdbb9f'
            'f528f2645c44648a8a42015923e51b8626616e2c66cc3ff870c27223002c802c15616e570d639f9c79b3affa4b7f9e9f2c42c780bbcb42a55bd87edafa8352c5'
            '8373d45b594edea2aafd00151468e5c9491b1baa078882fea76669352d64843d5bdaa8ad87b0a9549e452aef7f246a5919b4b1e4c0c1deaf6ea65bc2dd120a32'
            '06334e2ec70d56bea8ad2690cba23769758892c543b26a7108ee05771c431bae784e526ae1e62728879fd8037c6d12b66c65994f8029286724cf6235b80a9ac0'
            'fffeb73e2055408c5598439b0214b3cb3bb4e53dac3090b880a55f64afcbc56ba5d32d1187829a08ef06d592513d158ced1fde2f20e2f01e967b5fbd3b2fafd4'
            '52452d2b3ecb4846295385d8db1061215ab15c93d0ae8d8f715e722861794e475cf6d7fbd8fa6d20c8a7ab8db0dde5c2b9aa72db0b98a40f204cab0dcd75931a'
            '81c68bf65e479778bc79fd6c58ea44d722fa688312c001f84f14e2c5c2cd2917c2efbcde23ba3d463b7d936c4cae024e2059246cc215a73f9df704d8a4e21d6d'
            'a2f2035043630d058db3b5804518c292665c7322b83400e646f1cc147584bc1551187081b356f48bba5d3c0bd424aae76efab6282a6528375d4ede4ac6357cfe'
            '5cdbdeb4e27af11b54b8cfdf2d2a08a20ab7a98a64ea671c9074f7995d64f03bc0c42180aff3c15825bec541b32902422e569c47fe7905758cb6f1c32bcaff7e'
            'f201e6587cf854ce47eee29b795dcf3ba22717814cbc158f7942f59106a89f5b75e1a9c776264c8f5cd82f124aa4ae1028c0b0cc257c3b7c17f5bd2ce1a5c54d'
            '72873ea4c62a7031430228b2dbb72b8d5666d2edcf7e4cce67fa35664ccb11ff7e896638b70ae191ef6ba2c99b5316514c49a0e3f506bd1e649dec0e83fb5cdb'
            '370ec88eeb8045266645e8fb47f7d53752be6b5b2b10beb05e6d515238af13ba40c04a24761b0327c934201de4c69aaa1ca2c0f7fad8e32e186d46e720f3e502'
            'e2ba30a87fc4101e642f6861d783abc379dc7136b67c5d396a147d334c402d71a1c1f7f7033be2654659b3f6662c4cf48ab7f4e351761e2c5f75e9f46f383bb3'
            '09c85138d4f2b60f8c7c0dfacc427af9260323ea63a4587af6aca53d8bd3787555733e29024924fc217ff7637f3bfe64e2e566f82fd69b436b2eb55d8d1fd559'
            '77dd2c52ec2af63c3a1674a9a42065f835cfcb91cc422749804ac5baed97c93034d3e960c202e5b40140129762f2adde31e59fa4194c685309cd1cd16840ae2e'
            'c18eef81d6f97d7a86d33499df05727e3a32578af594ff3eeffbd771c7ada4e6a2c3e3cdc7a3bb04c8eed43c196816686a011fc568cf1d4b6af9c353c302d65b'
            'a2225e28b0d6926614abac8cfb0963ad4d4631f96486626064fb787898ba2c4b8597d9e49d4340c9ea9f0b75b9db5d99958dec7050e75be90f0dc9bc61735b01'
            'aa55bddc4ad039546e7400b358995bb2a12de442bdca69ee0f9850d171e614f1036ac816a822f8382a8bf5db996cb7d5076b42e0a9179817030ed87afe7ee6dc'
            'e24990e8546af6a939aa071f9e98f1860e2efe0348aaa0d3be17b1f20764cb494a12e16522dc6d27322e06d7a52667db8e126379c043a0ff8929a4069ea62f74'
            'ad8463ee400457a65ad681ce8f502b83e6aa943fe993a1569078720998e26f143ca68affd7c25036ead5345df4139ab250e157b9c233d2329ea79a59f3ca244c'
            '338a2f52b19497189f16fe9f865c31fb35b3a7ae7359e03f1657a7479f24e67443f7966dd989e13de03f64244bc55714c71940dce19916b72a4981d2d9a2f333'
            '6396c66f84c3a579a73c04dacbfbcea13206713b62407b7b1865f7e57531c1124c489e6cabeb0e2728b291d2f6b2ee60837e66c2c5fa74114aa3d256145864d7'
            '78eb960aac69ab416b459213c4d049dd871c68fbf0f3b5c0090e562737eeecd6354dd23f5b7470985ead40978e2cb611dec23e93a391ffae453a590a108bfb53'
            'f111018c7bd96626beb7fdf88620ffa8cdb8ad4d76523af9f38e7eacae5723925e40094943146c5c0411c8f465ceb21e22546fc55a4a18b480b30ea640e9dafa'
            '4a661113ddcb1ab90f256e57e84580d149b29e9495f655fe67960d8db66126e77a7c80fc84178eb545e674836f25961ac4dc5f5292a68b2e8e242c07676d8ce6'
            '1833459f11f9984f25708044ef5fd8f8a4bae880658b17e85837d12986c7119ba5be969206011f721edd56d0aa4c80c7ce9215992e1b200bc69cc5924454d99f'
            '60d784b9ea67f9ab83f5589ab7ece83f7281426a3041887d83a9e0a14909302431cde238a400f428f37dc08778a93552fdac873fbd7b9c0f0cfb24a8ed64431a'
            '7a68d6cd0a8c5672824c5bb6bca49397379a326859bc85990a3db88c2c50e969fd9dd3cbd93ef6d5cc1925b43fcb5c1413dbca02c339fc933c8cec3c684616aa'
            '42c60498f6f155bef4a8747cdcb3dce836754183166a471d10983fe1645c62396ef8d185ae7f07e59657e17e4c9c0d09cf97a42439359748ef8a297a8f438744'
            '41b0b6cf0fa37e7b7f8b7f077621dc65a4260829142eeb368bd225007703a6a71f976396b378f2e4c4750bbf284c58ffa9f90b8fa164a5342ef0be19d3461af4'
            '890708891bccc055383290cc3b904138b5141d7a8ac574244990d99b5a292ee40462e063d59d9f4a3f3fe5d4d2a25955a2f4659d11e35594c24c5a985c255899'
            '28fbb508bc9c032718b8905e25bd75d9ffb454333eb669d8bc59cd740ed1553d3150325fc51502dc046fa3532091b620f2f17c9eb5d69bb19c5927b50c3b92a4'
            'a41c938975dd9d7ee3ddd2d3c67c4d95b25442e7b155f112afa862512ddf5ed83788d7a9e546d9aabece5e430be394ba1504ef4b759a4c9c40d7567e2b70f192'
            '0180cc734976c21bfd549a3c76993f609f9894ac5b918bbea37f6ca793907184f8bb0282ea9179d863d0cc7b5f207853b96aa4ea215c9c92b97d4b0e504aa5c6'
            'f7081a8601b3a35f160717be3a3e9a36ff059ee3f8504c7b6d0b24989c75bb836f8f4a9b921f54bef2438c60c371e7365b49f95c220e25ff84b79f809fdf3ef0'
            '91e06a47bc5116db0e094618d670c99f6128b250b80f8fede24bda7dcd3cec926b7f3f0e457ed7cf112295cf2bdc1c97cf16f0b8935eb2de4470b0e02184f0a6'
            '352cc1af392f1d6ab95e1493368ed294ca71ae30c053d282c881679b9cd90f7499a1dcf5a91173263e645fcc36922846c227b3fff2da25dc4bab4e849b24b308'
            '9cf182a5e826c6bc296009ccbdeb77953269b4461919e9097213f763ed450846aada18a2666355d250693eb6a3920fdc3d7ba756efbbede6203f89d1333a6fe4'
            'bc3acfaad5ec305a4910e6cbfdb8b0829b497a119e7601efdcf23e80a278057eed70e7c9db7f8a0410f089c271c9e9cb2e34a0f2776fdcfe12e880cc618620b4'
            'b3d487dae61067d3b3b641ea7e8c9ac7904792b2262937fb7b660298555ca86ddf527fd20ce1d026312a78d9e779310b5041cbe0bfbf2ceb58ff7cf229699222'
            '66dcd98d7b72f0219ebe77dd1a79b438343ea9c07cff99ef59a0e1d8c5c0f11e2326963877a43cf0c9807a6f04b1f33fe7792f739421d2ff778e343252e140e2'
            '20933450913422444fbc00426037ef29900756f6162379ac0e3465f93cb07afe12bdb28728c1475b510fe4478c1f380edbe00280f8f3de6ff12866b8af76b82f'
            '578ae913ca63e8b64c54219a718548b65b8cfbe81117981d5f4fa108295a785fbb7092cfb053cb32ad98b5e1969960fe8e815bcf626753efce7820f8f58a8893'
            '2b6afb69c4224d8e14f0067995b16e046860fbef91df30306910a5ed8ca288f348e8269f6af8a60adfc3176e6f71efa711e670a47002fecaeaaffe1e4bb78444'
            '4e68487657e58257492f681fdf71d3c229706d993f478d9fe38edee7ba16775d88423aae2c97c75e49683d92d182411d51fcafe7bc978a91e113aa774632f499'
            '8fcc01ed2c18a56e5b4d5095aaf88fe17bce68d2dae5cadeb09770a9beaa451763c790e7dde59b88348480dfc41af2abe393f653732442692625de1d1b48793c'
            '7d6860c1f1d5f911c5a1534669f12490b80b5f5ee7d54527614ed1b9f25d8891ce86d2d0edc9f0b281d3854eaa5d6dfbe8bb69a72ac4fd67529bd4bfd4e854a9'
            '4f2df54cdbceab859eddc174fb4a3baf1e8b361662ff87ce449b47b5ab63facf41555cb5bd7c40039131790033651df5a1272d1d8050ba4dbc1b5a18d25d176f'
            '47c9438e6cf4f7462da21dea8b0588bf85dbb537987d07d86e85c965c818f32ec1755906fff1dd83a8c540bbd93e941bbafc68854695e27fd5e9d9db589d716c'
            'e63b127737f868bf3691682ca951f1ed002e00a87e2cff117517f73199da63b1fb2a5197830a808922fff9e36c7e1f0ddf6b8303a681f1d7943e623a36523b89'
            '5009b5b5878cfaee77eccef32c7178ea9a9ea90b639d249702f18ca4886ee9a2ae73f1260c66550ebdf1e254ddbf01c5b5d1e065d5a80f8baae1793e3d8c8e1b'
            '74acd20d0a4a5c42434bfa20417c6f0d98b76260d273ec204c01ba892be2fac77373eff7f5ed19904f0843577672eca9f45aee454fd2fe44e0505533c0bc45e9'
            '664f10d46d375746827ae137a9e35f27494fe685438d6903ed1ae3ddba466ce1cbf0d031f082d551a72acd7e8fd1419316ca154b74335bf22217c7239975c12b'
            'cc0d91a83f7a33f2d439d075fe97cd99de0a7efa4f407f6899ce8ce7ce8dfda9a3a5d4f16dfd90a0b206f9abc189f1cafc4f8f0bc609213ab20deb6054d3b6d4'
            '08075d8ba1521a47217ff56556f8e7689c750d3ad4f6483fbb6ae152b34b70097dc8a1247b7c4d636f6b69f8a65c0b649276686bd09c6d47416574c235a6bf8b'
            'e9c62b6b58a482b12a4b7ddd9a2040454f27308dfe6a6ff4803abe64b71405ea1f8b14eeb8a37505db5882acffa1295896f9220a3afe9aadce39cbb80e3e83ec'
            '0359f196e3570ea700cc8686235aaedf502f4b0b51ffbe976eeec1a6192e226c738b4626094ad4d3d997e8e5fb2f77be029bcfeef82c422ee6c05100ee9edcc1'
            '86aefd0c6a822d0565ece339b709b0c4449d88e40cd734a2ea58ef5eac67cf14251e8fe1bf1e3689c29d4c7dfbf713aed598c855874691d115414201bae9fa27'
            'a4d60b0d1df0e886f14273dd336c037f69870a2bf2730d779081aa50f401f7fe24ed65553a06569d206684bec86ed8897876e58508c7c0783863347f7196e541'
            '1a332e296c30c9b7c818f648363bc312d62f9d87d7814223bb23473dc27e20ce7a6bea398e74fa70a399841a220df892ec7bd719d88d517aa14ec2606e8a50fb'
            'e3ad4efb369e35c7ba328bc06ba79948a78ab2ea7ce4e912c7d7a5b87d8dbbe57a2a5a9e9bc3b4ceeddc582743d78733da949d6b4e60656a62b257fa24add094'
            '9271f86322e7462ad29d907c097c95ac366d52eecf85c7753099a8d988f0cc5edf9389b1b9eb13b51b41b6ddba88b634fac67206af68c56c079b15a671d3ed1a'
            'd44857dae362149563950207a608d1a13e28706b6906f6ac1d20a63243c207535f6593a3555140f303568aa1691ba612eddee15f86d60a39157295c22fb38e17'
            '9b32d86a096bfa4c4f2187aace682ca73e48978cb03dad76df24682de9e4beca2ac3c7306724d54bf1c7f4fd1fc717570bf43b477295e195e9d11ba30625a46b'
            'fd81a10ae9ddc4a95f6fa1ad24e5e500e231160ea56496ee2ba9443f26d60984177a07988846766aa5ed211ec80fbb60058ff13185f76f7d2efba48cb9d0a0b0'
            '11a30b8e3a98228c91ff07fde5ec79e95bf4eeba61cba4f3c1299c876fce646cc521e1fa16db84a92c7719a6f63470078bbc474d311c3e0ef8380b07faa166e1'
            'a77a149903cfc2945ec35fe38172f1932c366c290bf111ae73ac089635a55b0421fe2bc70e3ebbf8ac242b3d1b7b845f6e381a3041dabc55660a096644ec85d2'
            'b54083fb9a340f855cdac9265f509746146569ffd3fcee8e758f4e4f7864ea06bf2b78edb46a7e1968024103de9b179463efa889c81641d2cbac10571735dae1')

# vim:set sw=2 et:
