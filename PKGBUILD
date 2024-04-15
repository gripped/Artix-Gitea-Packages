# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=125.0
pkgrel=1
pkgdesc="Language pack for Firefox"
url="https://www.mozilla.org/firefox/"
arch=(any)
license=(MPL-2.0)

_url=https://archive.mozilla.org/pub/firefox/releases/$pkgver
source=(
  "firefox-$pkgver-SHA512SUMS::$_url/SHA512SUMS"
  "firefox-$pkgver-SHA512SUMS.asc::$_url/SHA512SUMS.asc"
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)

_languages=(
  'ach         "Acholi"'
  'af          "Afrikaans"'
  'an          "Aragonese"'
  'ar          "Arabic"'
  'ast         "Asturian"'
  'az          "Azerbaijani"'
  'be          "Belarusian"'
  'bg          "Bulgarian"'
  'bn          "Bengali"'
  'br          "Breton"'
  'bs          "Bosnian"'
  'ca          "Catalan"'
  'ca-valencia "Catalan (Valencian)"'
  'cak         "Maya Kaqchikel"'
  'cs          "Czech"'
  'cy          "Welsh"'
  'da          "Danish"'
  'de          "German"'
  'dsb         "Lower Sorbian"'
  'el          "Greek"'
  'en-CA       "English (Canadian)"'
  'en-GB       "English (British)"'
  'en-US       "English (US)"'
  'eo          "Esperanto"'
  'es-AR       "Spanish (Argentina)"'
  'es-CL       "Spanish (Chile)"'
  'es-ES       "Spanish (Spain)"'
  'es-MX       "Spanish (Mexico)"'
  'et          "Estonian"'
  'eu          "Basque"'
  'fa          "Persian"'
  'ff          "Fulah"'
  'fi          "Finnish"'
  'fr          "French"'
  'fur         "Friulian"'
  'fy-NL       "Frisian"'
  'ga-IE       "Irish"'
  'gd          "Gaelic (Scotland)"'
  'gl          "Galician"'
  'gn          "Guarani"'
  'gu-IN       "Gujarati (India)"'
  'he          "Hebrew"'
  'hi-IN       "Hindi (India)"'
  'hr          "Croatian"'
  'hsb         "Upper Sorbian"'
  'hu          "Hungarian"'
  'hy-AM       "Armenian"'
  'ia          "Interlingua"'
  'id          "Indonesian"'
  'is          "Icelandic"'
  'it          "Italian"'
  'ja          "Japanese"'
  'ka          "Georgian"'
  'kab         "Kabyle"'
  'kk          "Kazakh"'
  'km          "Khmer"'
  'kn          "Kannada"'
  'ko          "Korean"'
  'lij         "Ligurian"'
  'lt          "Lithuanian"'
  'lv          "Latvian"'
  'mk          "Macedonian"'
  'mr          "Marathi"'
  'ms          "Malay"'
  'my          "Burmese"'
  'nb-NO       "Norwegian (Bokmål)"'
  'ne-NP       "Nepali"'
  'nl          "Dutch"'
  'nn-NO       "Norwegian (Nynorsk)"'
  'oc          "Occitan"'
  'pa-IN       "Punjabi (India)"'
  'pl          "Polish"'
  'pt-BR       "Portuguese (Brazilian)"'
  'pt-PT       "Portuguese (Portugal)"'
  'rm          "Romansh"'
  'ro          "Romanian"'
  'ru          "Russian"'
  'sat         "Santali"'
  'sc          "Sardinian"'
  'sco         "Scots"'
  'si          "Sinhala"'
  'sk          "Slovak"'
  'sl          "Slovenian"'
  'son         "Songhai"'
  'sq          "Albanian"'
  'sr          "Serbian"'
  'sv-SE       "Swedish"'
  'szl         "Silesian"'
  'ta          "Tamil"'
  'te          "Telugu"'
  'tg          "Tajik"'
  'th          "Thai"'
  'tl          "Tagalog"'
  'tr          "Turkish"'
  'trs         "Chicahuaxtla Triqui"'
  'uk          "Ukrainian"'
  'ur          "Urdu"'
  'uz          "Uzbek"'
  'vi          "Vietnamese"'
  'xh          "Xhosa"'
  'zh-CN       "Chinese (Simplified)"'
  'zh-TW       "Chinese (Traditional)"'
)

pkgname=()
noextract=()

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-i18n-${_locale,,}
  _pkg=firefox-i18n-$pkgver-$_locale.xpi

  pkgname+=($_pkgname)
  source+=("$_pkg::$_url/linux-x86_64/xpi/$_locale.xpi")
  noextract+=($_pkg)
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

prepare() {
  sed -n "s|  linux-x86_64/xpi/|  firefox-i18n-$pkgver-|p" \
    firefox-$pkgver-SHA512SUMS | sha512sum -c -
}

_package() {
  pkgdesc="$2 language pack for Firefox"
  depends=("firefox>=$pkgver")
  install -Dm644 firefox-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/firefox/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

b2sums=('4238eee987cdd7b8370e712bceaa0e1b8d9aebffa6436570a16c1f2b9e0211a2b3456d5953228ca6db1041df3c54d8aa6b95004b6390459dd7355e180d496b06'
        'SKIP'
        'ae39b978f12f5538deb39ace231aa825cd6b5d8fc8f621389a708941d3e53b867520e57c012850b467c74200fb4ffa0f029bfef7d3e7dd332b7b90a77cc9ce8d'
        'ad53d601468ba9634cc831509708959906f5aab243f30d689bb676e2954a14deb5b09273ce4c662ce64853215dadfb63727511d4db471a8a4db975eee122ad1c'
        'b0679db8ff40d3d34bfd7569da985099465bceb096d831c3b4d80b03d9ae25696d27a1da6291851b089b824c8c2c4402dfbd5399adf54e93b7bab3b86fea0e5e'
        'af1b8d5b7a306d4df6009a946b1db19c8ef84a3c2ab4d1a2f0ca3a291d8ca88132a4c0e0976c353b67b0611ddb8d724f8370e9957ed71c402add4b26da94b25a'
        '4731dd013068fd4ad158d4c9be70f0c049cc9b07622381d16d6cdae1b0d50655035bcb2f24b6d6fd4d6d3a99382f5fc550d7a715f24fa062728c3fad9dd209b2'
        '558fc4ea1783f7f35fe330392d156f467954a05a1b3e999a71ace96eacb2b2dc12e48a18972d138436417b7807322ea8a255303c94dfe6a851196fe1ab3deb32'
        'b3b538acf929cb878e0cc71c7a5c6e4bb55237c695baf0135046ade50b98ba6a470b4d7813087d9df020496cc2ed48b14371fdd0face84aa2cedfdb59532a6e4'
        'f360227340a2b7e41e59fdd474a08ceda0705007dc599706bcf306a04600ee0542b7a960f02beb78c1c7bfb6ce1415ebbfff99321646734e5bebcfe5235ccc9b'
        '2977caf5ebb9141f0e7c1c60b52e565e2e5ffe457b20e4f9dc7f89ac0bf875546d0f0fb65dfd0f935747608a96e89af1b724b3d6a7abb62b6289f48169570784'
        '6923e75771de0154e98645900e40998cd0f591efe7080330a9c734c1043a3299b144e38618322dc3528f732ce259bae511dcbe0715d2dc1f53ce46c8df58d2af'
        'd60bf97b43b75e7a55f2bd5420890878ee572daa2270f89ce8be42ad904f35b0060ba03202771fea33aa28394e3fbda2bcee2e99af50458fe0b40ea09726dcbf'
        'e466b0e22c5f7d72efdbff6e9289cb341e17f2c89536ea60792820c6b8cbace3cdd900a362199c458097a7b2e6ad850657f9aa38a8b277d78bdb765ffc195d22'
        '5b039c5b5e5b8c2bc8e8bdbadf3d66411d56bd22fcfd23406f136fb36ff3a2fb07dcce3a09e007f572bb9396d6d47fac25c0543cc77216a86111f2ada4dfe505'
        '5da96d9823dda4e550ff02d8e656df3dd6e57dc83502db20b04d54bc5611df8c00af199b81745d27eef182ee196297055c45260d31144b96aeac7990a01ad5d3'
        'fbc811f55a56076c485f9bc35e0b2fcd32c3ef0a9c2a8ffcca78a22687b3111c116da1da608e4eb1e99f8efff53433dbc758b255259e51bf566c26e0492cd68d'
        '2a9904babb2dc7c8cbf9ee65508d5d10b3a9dffb0feb15554998db5d9e88ff548e4bbb3e8858646f36e6bca711fc2a51e20ab32f3f4ba05932014d3ee9a67385'
        'cfd25b297c87a6ac30cfe1f9361bb0943aa725046d4d8398de6c0db9855f3761da6cc01abc9583de3124bdf757431b0e2ee1121f711d6c8733a75289e50fc137'
        '2432bfcf13e326c40905dca72062916058a6b18d7e6e8625f6c441901fcb0737a9c66a35587c8c7f6962b4a58054102cbd3f5a62223923a82d302c6c1c381fe1'
        'ae94354ec4d3a76c91d68bda6cb693de70b7bdc3d1a7a3aea3b5e24cc19174bb189006876e0409f69241dd2235b9579d851e2e9d66eff88c0a5b115d0e55ac44'
        'affb5f0ab4ea49b05edbbd3c11d259ff1b7a85bbfe03dadffac4c13a457c71aa8519012d17cacc982f575c6fa81b2732626b729f83a40f554d3e3c3fe4a9dbf2'
        '253ea6007622cdc370f91408cc00bb55fdf5709b0def66dc6d5cd55f10e9fe27830110f15032c2a26592444110d863b020c31958a25baa0650c1d4fcfc21c985'
        '9e1fa79476435911e0b41f71ff05e875c10e1658b97ab381a007f2e26095a427c141e48c600d8878f46ba44dde7db6722b3e04df619c49214c3e789225641fe2'
        '4de0e08f16a27b7d73617689ac6528ff6f353fc95313de3e225ce6cd344c6a1dae3b2b833ea8a590f30b32de60c087ba78879a415c56cfcfaad8776cf90fd657'
        '5520f71b11155d7bb8047712183de741b8468c0cbfeeaa1b968a6c80e5a5b282f5520e054a2b7ae4699fecd6f866d0bad5ac009717db4ba2053664e13f824950'
        '06e28291e379e839bd929b0fb32768cb3120305630b79fce749278da3f9130459ef03803e266400684a07d5e276eedbd685d35c34b54524df5269e559ca0f681'
        '8c54f170de75cdd24e7e16c72c19010ceef1942c4ab53fe6e31d74c916e48a2a17f58254d32f0bf1ed84ee1d824cf18054256d0ce9ed6cee3ec9003c4123bf4e'
        'a27df540ad3071367e2d0b00d0d1eb02fb2436aea715c7cd20aff521719da52f0e9072bb94fef838f0e5bb96804833308e8df495c041f47000bf15306ab6a48b'
        'a786c89baa5e5db9741e00bce5ed171aa8e9d1860c9b12018c080f394d5cd47166b1c743061831b2997892f33408bec8745f958638f895a7d2fb4a3c7555776c'
        '3c6f2ac13bcfd35aa43b7f57fb0d09538bcf6f9bc52ff41e94d71f5b1227f14e28d4a45e7de15bd47c6c48e536de030d305cd3c8184bb7a4511a0d697b3d0b1e'
        '810021eee3a16fef58f854b6d375e64d0f7f1141de66b4646c0a718a8717226df58528684f1c5d64a792172952ea322269f6afde6dfa3f46951e8dd401a0c03f'
        'c0d0e8dbf20045e7c280dbb32796122de486ad9730339f82cb81c04f545681629ecbc22590b759e1b159c817985dadbee6f2efaaeb36e92128a6494dcc8c4210'
        '39e27e693653975d2603c84c67e05888d1cf029a41b3e80914441271e660ebc11050fbf787c137daedc2da11913455986ce3a39c60d37ba8a1b90795eafaeb7d'
        'fa17262c9a56758454efbd85a244b5c0ee29331ddddcaa33b7d2fe6ed6e399f70d623afe484fbb204ca50568a4849eb25728f202dc56aef6448ac554873a301d'
        'ef51b9942d678da26a1f853196460dfae186f653628a79d8dfa29ac9ec68ff0fb2b9056b344c3d21d91ab3888abbd2c54f2ecc716fbd882960aa111da3fffa64'
        '77c28676a06df15e8126e47383ae623ddcf1ef1e91648029c4ee00225cb366506fefa07119a4dd3eb86957c6a0324b994c6e279150a4ed09b150be2ca03677a6'
        'a61601255ff1c99ba8880a0e38496a62a0af1782ff6faa776e96f13e6ca9baef4c5db68e7fb1fc0089b7f0c5fd7370c72d761c9299835425c30233a2815ccfca'
        'f6b244a369611ad598b61c97f3e09381e7fc65baf5dc453a0498f6705f6bc6c359ead6ec3737e733d9dea093d0a241adbdf132800146324b023af43b4b6ce126'
        'c695e530c8c426eabfe0704524f866442dc1fb79c72fd1ddd725073c9920817d47608ad051361232e1ca9bf2d843ab11503bbc9a397c0345a35e726a849f3aec'
        '10eca22ce2f8dc1cf2e09e828f4b02b5c010d0f391191621685c69e4f70d9eba292f2b20088737458e609be13e814965907bb214a4acc1512e4ffce21ead8dd5'
        '1875490956798dc6171649a119d05dac03e885d25fd375e0d700af45c422bcdefd60a8353207c014abd59523f4528c41d44b65df81cc8dde599c23b6d4ee1908'
        '6babf6aa5820585615fc1f5d4c672edad1e182fa01ad6bd1e5b27bc2cc94ef7eaf3be514dfb568ba666d76b951bba9ac653cf37b2f0f7c2027a0eaea3b7f2d87'
        '9103360e11e326e44b05069a8df474139f3faf13accd91ff4e4191cda70f1cb4e0515f3e6ecd152b6e6ed1242419784e81e359179a36235268cc40126c08de64'
        '378b01ed9bc15da366ca546454de759e579cbdb910d688a1cee233fa97267d1794c4e1b1d88cf2dda08466c230251f213c275b1f206a25445dfd0add5ccf239b'
        'ca8a3a6a5946127f8ff1ce362f6afefdb628bd9f8649c18bf56734f4f1f374d506fcf7ae9f304db24ff41b19be4e86e02d07111004a01dbb1d9b143aea7d2a36'
        'bf477d91c784082286a9c79eb5d019edfab4cd59452076e0f423fee5c9de16bcf056993299ad4f783d10c57f1e7c265a0d56fd7986329a0f5769f677c59f6662'
        '9f79b70e5ba4cfc516e4a6d7dd224810c099080f854a25d72747331ad203c3b4bec3608a2d596ed75d8e3a7647d091470f9d56cb11e8e4d099795324470d5191'
        'fa6e67311a2f94ec8d985d1c8c44836c5024023450f603f54e707122542cb73222ddc4e73b2b088c49cd0cf8ccbc29699dbf781f8892365ad67f8b74d8919f73'
        '8af8669c55ac7188b2767a014cb690e01ba4ccd67d3171c3e75500c8310f477ecf207dc863ff53e8737910f6715926c9c0924f7e99f9cf99e95f33f875b4fe86'
        '0d1a310ad4702bef91ccb3b09cda77d1adeecfe2ed34db5500df5360a66837fb2bdcab3bdbbb4998d948f74bc4876409d54410effe52cc8a870619c0156b361c'
        '606ea1069166bfa30eefe586a6729ee26f501a84d7c35a7382c87da14f13d203b2c0d8a9c79c320af8c9bb91c07a812fc95581c09597e2ab5fc09c9cb3445594'
        '4502b2d2724496df67cea80d5eecbafcbda46986fb34bcec36d113daae1672f5ff3e864a239a007773918229245cb8829a9148266b38002883e97bff50f1268e'
        'fa4ad3bf8a55cd1c2c8720e1d545632f07b60d7b9418d5f59dc65b393980065290f5a4ed5095f4cb590d4a5024be6431a177f08eac76e1e07472185af44b9926'
        'ef85a1b4e305054a2c9f8e6905fbb801dc68dfd8c957b4695f86986d2054f1d568943d7e5b75f2509e4fd8c1b4fce083757d642962a54b761938dab55099a8f8'
        '5553460334dfcc51361805229a4d7501a3beb852428a67cf06fdcbfc93053f963ae3393a8ecc6f08875c3a8ef6a29a8ff3130baad72093147efe0b44f1dcffb8'
        '0ca92dd3d853b41a44ae5b9f8aedede87130cee4bb2cdf0073678eeb14b36dbfa600a09186d2fc119fa995b1e7f4ea7ffc3f89bc0da0a778441e4d5d1b6fdd8d'
        'b91f28f6c9c614631734fcef8cff7a3a55fd0b70bfb136b2e971daf04b8ad297c4f4f161e7e57631669f1382dd88046b380550ccdb3babbe1496c9033b2c8574'
        '939f34a475b914813218d03cbd5a91040f8ccebf3669eaac464c8072dec409afa0084a09f7384e797f850fc098d788fcc10250ef2cfd347f4a0d86ec2f38dec5'
        'c3f58e4724febfa0701d5ada5be9cff117114b2bf5d09122f605f9d144892a4aecc0ea31ffd9721778bf31d149245ccc3aae014a9013226702ee925057286a69'
        '4bb492602091e1a4cf816f99cb3c4521a1d3639403ae4e82c503b7c58c84d320b757028149c61bfb652520bb34c9809e28ca1f84d9ced608cb844dcbddf90ce8'
        '885469652d0d1ba0223f653718420f27a94a4786ad6c71a86ad59465f53a444e7974fc67f65eaed04ece4b034c3eb9c8ac37ccd2635765db21c2b2fa17e555c5'
        '3b0e453c355ba78a05963a430893e84819fbf460dec992c542bbe4481224a00b815fc65d60c6965bd821a8f685202871b7a7d0ab39dcdcac624ccf53226bc0b4'
        '96dd419f486a80245894bf2e26198860079deb4c5bf40c3629d5c261135f1e2c4d30813df5533e91a7df6afe3c4c857fbb4cc2033b05835aa2663d167e86b1ff'
        '5fee0a13bb748f0232b116726299cb70e52dddf2e1ac53915b855b71aa97901361d90edb6f71af8f53547a16c9250b047aa3f2faa2f3235791cb69bb8a05d2da'
        '549696003c74789090e591079966679e3e4dcf8fbbe169103f1f5ce56edba34c9065c30769aa66d45cb21a83c09eb2d6c3ef145346faca9ff9b232763d6b88cd'
        '6a7f37b2dad829e6bc06a5c420e1773e9b61f36b777c39ce3019186b7dd52789dbea6631ce1490efe26c52fb5dacf29e1ee1f397f12ace27f81b079318126dc4'
        '89a5808d42f01a1be6b45ed464458efbac5507692d808ffc7be34c771419363449119e0757aa8b29451a42970a82686daee905c30843017a372e43d458fe2b30'
        '6e294fa0b55c450305ddaf82e832c1fafc0d4ddf5af98e152b55f37186ed7e6efda3019821d09ec1d40dab094e822c2d82e72b4d87a52d0cdd913a8e28ec09be'
        'a7dce03a7cf6d80772e035319a4a5c0b856106b3ba8f2e53cb1f92a531cc58f1a138ba61c1ed596c90395cccae4eef0700c1223f5d8eea0cb9acb06711839050'
        '7f8182066b540946f10a1bb9f6058e2da44ca69738c14e3dc727bbe657686d6eae34e73f07be4ebe6d88ec008d41b7c18ac541db02b66ddbbbebadbccb697b48'
        '48e2653a81f4514e1257b71e6e2c669ed6452051981c8cfd71cdbf02b9f677745c06c209c474e2b69ef75e1ae7c461987ab142726b9b9f6f44701c57aa8a8213'
        '92d32610b4cd520643d14e13c1011e9e597f6f293dcc2da3862d2b5042d69a79c24f19385aeae62944f1643a9f0ad39f1dc47234fb199f82b851d68a0d8da1aa'
        '34426c8271aedae333c59e9246d19ab65c021a0c09ad8a4c32ee7f58ec1d2ba9c4cb33dd5f385c335b50da8ffda566b09ff9e047cc55420c3296b99d0a18ee83'
        '8774c4fcda29e851c072edd8d4a33e04e1fae72ac67bc5319ac4e769e59d791492663960903692faac14677ecd4dba7e99fa4bf5d182cbe2e881ce813f7b5114'
        '2e4de1a4f60ac1e4009bb1808b0cfc2e860c2c217abddc4b79c6f4f6c2b44b12b6610e8db99bde2e8b738c0ce79e68579b868803439db6cb55345d1bef163542'
        '6364a7fde82f355092e403a5522895d14da7a11d2da8bfe97588124ab62446d1c0b748d560ee1322dc33bd0a455e8fdbff67be4214b6514a6be302bf7f170bbd'
        '29e63dbaa23a2d4a7eb9701a8c0119a74cbfd811f7bd44f8432d3271baff204b4cad404f8ae0c62970019525c5da6f886c59af7e39d88d4814916e7b375c86d5'
        'be29152d4b53f2d4ae67f0633a070da0bb63611ee885b1f83638a08d54bacb46a36ed90376e577146a985625b2dbf23294d81f639e77cb71e6942a4e94558f41'
        '6924b169718b3b02902d44125576b7316cf6b71cd6b53d097e46e71e0a0ba5fadd0f9fc10c3a580c8ab1e0fcaccf61c949bad9fdfcdb7f53eaacf84c2db302f0'
        '57ca4ba924ff590335dfbb68c3905793ca437f6c45cc437e3e50c559c0955af20507898bb399fb5050652b28633c6b0e3680ecc4111e74524b4a80573e721d57'
        '4c125b51d3e84f052053d5c3a6a3a1529935c414a1c1062269dd812bad0794922cc07738a4c14019ed61485e095a683e1123f4c2e30746ce297f4d8e6c5ea745'
        '34dac1a0ec3a99fdf7087dcd4611f3bee4efe98055dad4cff651a4be5433ddc3413e81b0bc7954c339b98548f3d545e4c5753b8da7a0749e0b6ce6b13d8dbf7a'
        '656b8c7d6057461a2365fba098dcb482324b701fb08a03f96c887372fea461c65f70b6347d472d18b21fd2b90a28631d31ec5973571aeb5b4280fa6ddf28aa52'
        '05d0ddc38f6141e34159b9ff3e9354f41a740a9fd3f73c747077eeb20344755a26cf7b98afb7ce3e2ec8a4a8a08fa58474c389af3af1ae4b97227f013243f563'
        '54a77b882bafcfb2722ca7c4d618a54ef48182978dc655bbc0f11c726ececa34e024f3b76fd3eac617c662e0a5c780c0f747cd294690bf53d676a4c83e94f916'
        '24adeffe2e47808e90723c07773d35406a7131f4d3b3d97b609c49c218ebc49d89252a7176e9e21ab1d20c31468ca04336bc40113e085a368d723f52090220b1'
        'e9d3128c9b12a38b40346a2fc3871697d58de69446588d6a88a4ecc80d1545b9dc8340d470952a95a8963b831ed41f19bc9c88392a9a6e6d269c30c3153cb903'
        'a16460459a2a511c8bd9a1abfbcbc81723d2ad707c1d7231ec7638bca65bd8883727f7cdbfae3daa4c5ec6eb73ead7d9f0c8ebbcc86547e74eff26f9d25e3c8a'
        'b38e642006e69254745f6551e02b9321cf4357f4fbe481c1a0459fe600ed5c20776c311c336880d3f0f7f2a4e3765682fa462fd99beb4bebb0b2b2bf7d3eccab'
        'f7ff4e6ea956f4e790f06a51c0245f44fdbe9370a5fdffb16864e7092edd8bbcbdea1ca058bb9044b0287ddfde203ddce246efac75a84d5b994e4c6d9770d94d'
        '598b9a5def73066133882ec6d8815b8f7cda2f0201388cdd872109599d110479a4a677270772557fb942dc3739b0386847ff24b296fcf58c27612bd9e2fe195b'
        'f93f174540b6e651c985bc4adf9ef98dcabcd5dc4c75d7ebcfda62829e11c2cd899f6d7992b3774f929bb002db928901178f0a00596b15762faa56ec3967bbe0'
        'b8979b0101b5e8aad77c4abda124b24d55f34839b4cb02b1259f9a22e11db5bfc604b40ff777cbbf95d99e4c87be75039191c59d52544d2b60c7a783bb171ed1'
        '7479e55b151dbd8a5e2ad391f144cf54f8a538be53723927e6c48e214696c394d5ec72e8bb22584ee66218dc0af939da7127995e12094ae1a71aa3cc42933593'
        '3033ec08ddd3515aaeabe9c00f90bb2b338655987a70442ab1e961dd98a307e831157df48cadb71569754438d70745ea66880dbd6722e130bc7f9645aa277c56'
        'e0cb91f4fa1b17847aba48375784f89972253eb81f8121d4461fdae99a45e6dfef13bf7afc2d2b771f1f9904cc5383531d4956e5b4a52d166b2e0bffc4da2b27'
        'b694f433bc8e9d13b2640ef7e175d14d9d81962ed32622a2f1b18d18f1a8916116925117f689ae0e2acc81e5be3844aaf432d7233806cbe205804bcd4da04bd5'
        'd93cbf5e59ecd01a0cf43022e8fdc45c3a33414a4e2d551551962bb6bde85c67fdc481c835bc99e71168298716ed16e063e4a5406c511a6658a986ff25a2a942'
        'b09228333eeaef8c431a9108bc97aea69c71916222f514dd2c1d7d98926420eb0b96844e44156e3274fc6640c9079f4dde6925b66f9a02ee04654f6daad8213e'
        '22cffe1a778b15439f6b14f36f88765ffa6c8eac6b68f4e4e1fa8a92348a5007b9daca08904d1eb524440e88ebaced594cce4f714dd357c16b66c3fab98393e9'
        '5848ef46729232c75a18997d4a79e4f1d3517fac7cee20e97638bd51dca64deb1fd6f3cde4337fa2c1a2da4ced73a15c166806a4d3a4cb2a0d488d1429461b95'
        '88ba1fa9bd0c32b15d55e440be9ef03810cbe6c7e1bb1c168933ccdacfa99aa0e18e56d798f983e555435af61bf00dc5b54562e11c2887f19dc790d3e7c99867'
        'a545b595ee84414a9bb1479f4a3331c9eecd3572afabdda3b3e8570d181dcb6abc0766e6633188e0a30ad08ca4c7dbcb6949d98c7c3ec20d30c14c061aedad01')
