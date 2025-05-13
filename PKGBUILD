# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=138.0.3
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
  'skr         "Saraiki"'
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

#verify() {
#  cd "$SRCDEST"
#  sed -n "s|  linux-x86_64/xpi/|  firefox-i18n-$pkgver-|p" \
#    firefox-$pkgver-SHA512SUMS | sha512sum -c -
#}

_package() {
  pkgdesc="$2 language pack for Firefox"
  depends=("firefox>=$pkgver")
  install -Dm644 firefox-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/firefox/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

b2sums=('bfcabf01f6f85b3f7318103ef0c57f0df160f333188bdfbd6d4aa0819dc31f9d16031bc02882d5dbd95840b2024908e9cf46d0944f1675cd22c61f336853d025'
        'SKIP'
        '8e97694abccc3829be411c73400cb3a76029aa651ed6ffa4fee1b78d25cd763c34872488d23cff15c0c74585a792137330f3d52d112ee43403c9b515269fa5e1'
        '624ee2b5d22fb9cd56c3f00654fda0dae05b87ecb0809bd09a682780b74aee6c390c89c36381c9eab7f2c902f0ff0b0e92c19115d072d662caf927cd21a546a2'
        'e86040151edbcf73ecb3ed8bdafe3b93ea447c63189db9efda55a829e733482f2457669aab7c55cd7ca71b94202322218dc6cebda60d89dc6136f4aca95b91cc'
        'b7bdfe78d202fe1ac574f08c42f59e67b577538e89b4ea5f56cb51f8e80b526adc6553d4fb44be44df8ebfe0dc189525bc66ffb9fe8429f4f8d77b35e6c25127'
        '7324ed8f6589c6de100d930295942adda7e108db4e6160348382ad48565e4fc1c8dff49effd3e369dd3b7f29cd0048c0ffe33e6991465dc660a663364e76bd65'
        '10b83339675c4878c658f5244e723adea732f3cc049a35fc4eef575c66fecbcd58426a390f32e32411e6a0f38a7e24b30fe215336ded3720dc4ec5c6a7d262f4'
        '1794a74798d41a22d8d5045764f400d35567b3eaad0fb19833fe2a64e781947611cd6c2c2248fe86e35be43cfdbb11bcc7e1f4865d9bda12e446151255d144e0'
        '809e00084568adb2bb1ac5cec960f8a61e67dce13a539dcfe2f4c4cc6b0688e1820dfa1eb5d2cc9fb3689ee74b633698325d85e51144fb7296286b89dea13bba'
        'b6f897311285b05a519ec902a927d601f622c2f2aaf8daf6fb48567f2d0020786290c9a48bdfde5b3fc7199d1ed09ddeba5fec102cf86ae4fc84b853698cadb1'
        'b8b7a76e1ed3332d0cfc65c0cc36e8dbc400a9dc0b274b42c823d35ca3f5cea49c32018f8d41a34465e419ce8f9b02afd2a497aac1c7e6aab453396205d271b7'
        'ff70df2bc914e85192c524748f83ea879ed4d3777b74b7664503ca3c336b09ad63f59f8ca854afb6c2ba9f2ff6c19be2322f9cb08e2181e05177eeb8888eaadf'
        '67c2a72950165fa70a21295f1d76d931ae3d033c12871bba974daf0c2c98a7c82f30149a922aa92d14394dfad9302a8e7bf0015051a3ee4db196525d7ecbf97a'
        '66b87e17912b39d3690eea3c75eaa210af379ee9455601b1a8e3737cf76b336e7e38495e4f1842ae01168df687d09c9d73b4d70b3d984eae63b446f7ebf08d5a'
        '3e27fd7e2ac13eeb740acec2b8b70d618dfc27067f297bccfd73c9bee4c8915e65facd383ed6b5212effc3a851be9f9d6cbba05a1b3e1c644fb8fe8f91b3ef4e'
        '111aa354568cd2044fdc254803398a50ca7452d14c220b4715122925c02aa21548ee5793f9cf4c9c67ead6ccbb2c8de55268e47d0d947be8fa3821a2075a0dae'
        '61168d8cbd5c8a6e076a70e9fe757d31cf2b36d67aa2dde287b4ede8b51958c42cce18f74a8c2a3a6b93bb2fa5f828cb2d46623ffdc5cdd7d91a5655d46292ed'
        'c76cb1e738cb8c2d7600bbbe755e535a62e2a68b20ac719b9a6785d46339a355ec2f8074ffba8dc8de55edea58699b85bae798dbc5d973fd62177658437bbc22'
        '0cafbfb48ac9c4f67a6bde9a8fd2f7ece830c26d670e194a50968683b99572d688edd3249950082ef972d39e5a721282959b5d2bcc99b55570d2bdff10b00241'
        'e7ebde7c448d935571718174dd75eb1c7f58f5a64950dafcfc7d1e248cf5c5fd9a593418efeb901f2768393663fb737e8b0f4f38fb6b310edc92797939ee53de'
        'c83089522746810eb2583e531c755661c5f2d16d098ee78584355487da368e85aead29635c231d1bfdabfa8f70ebd2f1cee148f94a22cae678fc074c6c396bdb'
        '7dae60f580133f7050b2e79e56503b4eb4bcf1deeedadae50a13bea60a18d1a1a79a2036072068cea32e05a329dc530c919e77095c688ec1a44ad108c08bfafe'
        '6b7ae91b7a146e929b9627323d76086c6a1c7c28fc69dd1ca8faeae21289af924d412b148ebad462e602afac7d2f6c5ed669623ff16e088bce2ad268fbdea1e0'
        '0a289549e0c6970240d51847e44849882275af8a88d34ed944830bdcf85b216ae5744c8b640b0c260efa36f05a5ff15f58d067a6a764ba3438ba2f879527777e'
        '7a3863cff4f87287b48ffb4e8594e9425f4457f90f1b884c43a80678531c9c086a8d16fa9d0f3ffbd8725b9acfdf3598cb8957dcefd390fc1441bd07ee0a8125'
        'c0e5b41efd6c25f3f9eec04999dfdeb94d0cb7d8587d12febda46d2c7b2d41b8064d5e20ba1e0823001b4f7ddbbc69d91feae2233f8589f9cab0c5247a58ca62'
        '6655df4eb4f921cf0354bf596cf0e7aead0548fd0d58a8229ad246a6b1773fcf3820e0859d080816dc91eaa84a9882552f6de4bb406ced5dc4b75566ccca8382'
        'fd7fecedcf8e9ea2dd0348f814230e4b85c777f86b06fcb603469ec5a762f56e14a8643683c3b6f4ebf2c86d5cf7d909b69dc9d7117317c14f63adbdbee20c82'
        'fc032ef61f0882c14964c6210ce8ea16bc527f47292643019fd2795d1d22269160768b542a9e9fabae37ef173ed5b629cd9ad27c65b5df3d3db6444c435220ff'
        '4c35b3d2936b90ea0ab89ea0b2b0e4bf927582111b4cc08fe82e452976aa09d98885cb4400b4efe10bac539792f8d36ba0e6540a4613ed778558291521e0a4ec'
        '62422e6b34a8e826b208a64ac24a5994af854aaabe894ccdb38a713e2d1e4e105660a48614c9fbc6151767c8eda90ca0e97260ca4b580b5ea153c73c25a26d1f'
        'd031a3fdcd8c2c70e83bf2ffd99a25b3956a6d12f3803a51420dcac78eae50e4debcb792a935153e9146024d79ca4dbc3591916251f88fc37c7b1375ce8ad226'
        'ccdb478fba95a28bfbe344e604dcd1a30b6ba8e8d3ccfeb89fc2741308d18c78014c9f90948216e47d7036fffbdc63756ee5d45d5becc86525f7f352ed110dcb'
        '08696ad73f75f1a8f9ceca7d719e50a7b7e8336cdec7aba2f5217ee66d9a68896bfbc6a5f31b1f7c1cba4bce3f04c3013e4068bb004a42218999abdc6582939d'
        'f32ada3c183877b415a6ae4ffb9d9b3629298a10f69cb1301864f3167d8094edf6fe2d9bec3974d423d3702660c94b7015df02d9f814459540c8e5472d3bd936'
        '46b18b1abe8b6e8eb7973871c2965f4332de210370963e5c8a1a0bd3997ab39dd9865f5b1dc1a39863842a40604885be9191a807b0762c6f0e7f01a483f01f6e'
        '1e67e02cde2c20d75bdde3f81c2ba810ae3533fa9aa04a019d94c5bd474c06616b25cc10229a4d0114385e4e1b4ea8086a0a787afaf27137a91694610e59eff7'
        '5d7c5e76dd24ba0ca2dbb396fb491a5e429aeba7763f5dd832bbad7df37b55b8d09f04ab67e2f76b2c33df5fe9273f7fcc599123b0eff9eb7b7bc15963e509f7'
        'd0eb6d17a5ea739a2cc13e33fa4a5f2b5d8da99a4c35d692c24f572268e7e9c7b9fc9b858f474d7473a2555a2b30bd81cfd01871ce260dd8fa038c5530d908b4'
        '6fd64301f3b437bb349a8782fb8742b2f68adf4bd6ab7af933c5ebe02c8bd420f0480588657b4c03a54e0bdf3ca05aa2ba869f8a99645837da331c2176a6c93f'
        '79f009e4a736163a872e433bd7fc669aec56012bc52c895565e1008b835a5d0b0d9329161a173b25da3223a126df8278eb724ab68929e04b6eb52f70a4aaa9f8'
        '458ae5c42d63ea594febe2fd0e8628631205fe1b1a5dd6fb2f14c6aa10444e76e35d08c4f6b3ac850d25e0016b5fa18f27967d17d78cac3e82c9b4cb5b2f97b5'
        '79700e6bdffef9ab03e66b551f1f9a6c4f1bff2483c289e195e44edf3bd69e49ad236cffc18149c8b1392c61211b5638bb265dd94d5cfa6cab7ecf6fb19896c0'
        '1791f2b30cc088b80dcdd996f674cbe6eca4174f3ecd391e76910c7bf82b6d3c865878ee5def13693d6724bbfd41a0717ca6351ae4dda6e91b6c57a33c4cae79'
        'd531511bb4861d86591d5aead03f55edc08bedccde70d45efc55c30915533f0c17853c71f40883467fdd23da515b558dd222cfe9337cfb12059a0eca05c164f5'
        '52bd3c3c2c0607a64ce7a803df4e804c48383a284c83cd82c4a5f45795b04c53e95fe325b9991e0d4dcd3cec41e29855ef3c339b1f33f3199192acdc7d817a71'
        '02a79c87e7e22e02d479101b2c02d7a1482b660d941e91cea2a56e0db2a48424f5fc7dae11eeab8700b77ceaf94b2c296cf1dde05c242c58cd7e9ff9a407f2bc'
        'f57ba0cc7fc1cc07aa6e40d1421edd52aa1c6e5862d9f77cd1a9e356c419ee2b78ca1a8a6324bda934a1a3a228537eb98db693fbb25c6a1477c32f386322e1fb'
        'cd02e0ad92fd8170b732d5d822b72225e4f7b29a43f16c5e18bca481fb139650787bd722a791a0c116664665781f3ebded212b6b8a456f48decb549b8b967376'
        '7877de47aadd1e877bea92e35cb131aedd755ddbdd3a866fb8be2e3e9766ae41b8e58448c67fc08a094a7d2d173e439aab3dcfa057aeaa7e0d72f471fc0faf8a'
        'a2571b49cd84bb591668c844ed558ef4233a247efcf60cf3a2b97d79c02fbc522a167cc2674d284854e9e73a9945c2ea1c53c408be99af642b91cd92493c7050'
        '31386fec8f009f2d53665a7c0649f3480b19837bdf942c8b3cf2b6906d76c38b1761776ec49555c18ff419b654ff8ffa27c473cd40f1028f988b53013891bfa5'
        'd5024cbf59f45d935a80fa5bfc8421a76c349ce099990b526f9a1a49d12124b00803aca4200878c1921d29331ea23196e0725ddad56fc98d5cc3318d264ba59e'
        'a76e1dc06d9f3c3697f8a30a0ae8b6ffd55ab8e49c49592bbcfe4d3d27007e503c60f2d7983d04540598c85535f297447e738f9458783a4ece26982968afde25'
        '30e1594fb8dc10ebc033ea71c98b422ea8303b9c6ec6b5463119550e4ac775f60e7c79307d5a275bed9254b547d5fb95a20c7542eef029977f4cf9818c2d5b0c'
        '081f591613f54b993c6000bda0986f47c00b5b5cc280d2f9cf0319c2795a33194936b2ae1cd7ce81048915f0e738c7492e8fe47dcb2fa9269721a964e411ca16'
        '243f36ea6b58e45a194c07dce3e21519ac254abf77bc7ada30427565f0808d9c498c4b770da086a1edd2c0058caf078d48434a574fb7d7f2d50d64b48bf631ac'
        '93718bef027522a89c770bcfe50257ed7a4f35a7d7717118ba6dcf02d885f3c693b2ff9b50a75ac5055ddd91e592e7d3648d37e82af132db83f81884d52bf952'
        'a6ecad30ad47cb5b83754d6329b82b86fdd9d492e334c5d86fcc8d8663a015e99c50af9e9ab77453898b9aafab2e90ce019031b01a88b332925948d628e073bd'
        '785947bf6461bca00fb7c780fc0939883aad157fc5242ff768f41f3aceb78f1a9b7836b6c8d6b7688c7dbc44dfba0bd81e85d7fe878f83cf085e9ffbaf42b78b'
        '452a400c5d87b45d9e81679768991d7ec8752287f7500a48ebcc989f4e758151577414278a0fa3bcf7648a273d3703b4cebfa9af48d63501f9b27143f79380df'
        'af5ef675a7aadfe4067d1bf4ede4ee59f9c6b4f8803d244697e5296f85d0ecd492e707f72860cb68679a1897f63bc3b0f28576c6ec9f0d8397c78f0d1d501eec'
        '65a6a03c6697480292cd0a05fcd2beb43b32f1f5bd11eb9943e4b6c44afb7e464ff42b5fcb77256f90849f19db04ee477ce224ae2b18f4b4e3f52eda693fa8eb'
        '8f884303d1524fa6ada6a6523874ebadd09d2c402c249889066b4339ffb913231213f3ce3a582d4d7e2fe2793989b139c8223d13172a8db9eee5c9be15429e86'
        'ed1bf5daaf4f68a20295e85b9690200d786505cdbe59f7bc89c66c1bbabef96b907073d1d6f7fd64597d97ce02fd8291c1c2275dcab103aa7670ddb94792f151'
        'ef7dbb1646c2b1c38fce7d33119301401903d3c3f657ac939eafcec3770412012981e7242afd2f0715b9a6f1f6123d103a73ed3e41e5183af778dd5053edc7fb'
        '1e235e181f84ffce71345c6573d4a96508dfc419ae55815f2c67768075482130d123c3e45a56b7e05095f9664dd35c36ef4e034d1b6e47ccaffd47e617da7f6e'
        'e427ddc04e5901c709984d515a03dd0e071ee47d56bac3a7130de8c3af4d7557788961bb43d973084fc83726cec4d32daed2a05792b3397d4c7a48b7abb5b846'
        '0b941b7b71bac4c933b7f64d5ac423a3594bf453ddd9ce9fabb20e49e0fc04fc48a4d87ea35d7a2a6916cf0a4e921437fc7b0d765d781e5e52060bc6bdc665bb'
        '19c575dcce36436248dfdba8c11345810c9e12f575a2ccd07d1ff37e776e3a3459e0df73b6a04c11da12921e1c57c42f6fa67a17b154448b6ea56b75d1014bc1'
        '9327b06c3d0b7020c4ee4676ed5b21b83f46f7bac1406cff4934d612353218604fb1052ada56302a94c2867abe208bf863e7c48f323bedbef867aad5521b40ad'
        'b95358428859001f7c009dfc4857406389908a74ca5b7f6882e143e2008b925ac08a5aa5da8031302747ab09813662a551b7116fc72aa916df66ecc30128e1ef'
        '2b7c0408a459581a08452c13fe1f90b84092f57f46e3374c57f21ce987b1b2900e68f419070cf95d8402cf28c8f7c1785bba0448e96cb61a074345f3af009d90'
        '67e220264a6c07c6039b1ccb65c96bd0139c1433f8a210383fdf3c0db67245ebe612ebf59a8b5e9e367d65c8b8cca0b2e4e4ec97e65f612ed8c7dff386dbae74'
        '19f224f08016ed06ffc5c8e72b6739f6f509ff393b6870f20c868d4be0f0ed17f40e3f106dbbcc51df081b28475926984e2c8a677b91a970a8c567dc6a132057'
        'd26d1825e0a07bbac222a442cd8e4394ba89ba7f4c74958a6e3620e982cda18bfd15c3b0f84aa9b06d37d9f11c571afe33ec4ee575a215e3967de7412caa86d2'
        'faf83a0ca08b8ff7b1a8d9d591a93eb1e5410272932bb3a9ea150e7bb07c0a45a4017f1c8d48478cb00caf24224ba94d082292c622a81a3584a56b61be1f5296'
        '2870e005c5cc26d80de98a1fb8ba477eea929e2799203cc2c1924991f754ef044eaa2a642ecd1cc7d4f42753f68792c094cff07a0bb176e0025594d2d7fff884'
        '9536c0dac52af00ddfb816d4cf392abcd8f933ac69994e43768ea7e0c62c0305960f6d045b135a2c8802210bf1b27e1051aa5b77bde2fcef055d94f2a278a0a2'
        '6cd59bf18c9d91601c5c460b82069bb73d7c0f3d7b810aed4091ae8e1587fdc042443726e54b57da563ee550af46d4af65e63a88076d6ebcbfe3aed97dff42ad'
        'b44232f1267188735b2a261b6bf797f4248cd2542079cbccd587b01c9273e77cb6e7a2a40384306a575cb393d6a0515e77f2ea19aedf107f60e092d35ddc96ee'
        'bf039dbe71eec5ae112dba75a22981b7b4a549b406d4528fcd22ca707b4f6f9312f25d623a56aa71f395ffba590918db4278ba897bcee12d265684a2eb12c4e4'
        'ac4f13c6ce4d584a59504ab343de2d8a77724c2cbe46e516f5a3239c0aa19786e311d2521d6f830cdecbb9100feb01fea225879051ec5290a9beec405dc49d16'
        '26932631c6067c45a1d50012ad83e91eb9e64cfc598099f727f2f8038b8d39a30b95b3b2c4f18e6a4730366b2160e379700993fbb46dabbf4394ec1229fb8fc7'
        'f53c25b67f6add547c09f1d53afd9b880b821bd8414b7cf759705ce303cf7a7c790cdabcba4828c94451935081cd3d81dc8c323d09a1a574420f07be9b019e52'
        '6bc40fb85d95ebee78f2c11abcf847770f4f74d66427a44b31e2f1bcfd5c6ff0d25f9f9c2e43c31f965dbd69a3b84784ab22f7bb74ccd0f8ad3babd947414f79'
        'd28fc0059ea87bf5d02b0437fbf351930865087d3e662cd640a0d5e4dcf612541ee554137836e928a975aa01c47b59f94861fb53fbca45788926a6869fb67f38'
        'aa23e9a06df9051baa5a6724e0eef5830920d56eb44ae1845975380cf62562dee4f2d0124e616faa4c644d4470c174b4381e67c216973549f3df4bdc3e324fb4'
        'e32eaaeabddcc55146790b644186553e325397eed2292e65bf98fec3773444dc442277fe4438a0f1dcf62cb09fb4990d587031d1110a3ea052724ca4eaf707c7'
        'ae96f45a25d8cea4454388e5a9d106080784f61c17d512a3e15f88e0fd904417daca37f063a57e4c910250a7ef527558c5982e8b055a6a520768bf359bdc5873'
        '94b0f30428c057d0a6526e922c43bd2a9aa940a3b2b33fc31d48cc1664c3b1e7bdc23604d7cde0a7292ac8be78f24f8cad9f1aef5f7fc6b4965a5d7e73ba22d0'
        'd49fbf3b5fb489fb6dd1f22e0289528a9821766d811e7678465df5cf4a59feea2ab2c48ed047797be26dda60dbdd8ddd45459d2ae165b104714b6a64a4866ebe'
        '41f8c732fd7cc532664985cf6adf41b0ef10b807727e4092ac7301740799c4ec12f6fcb256daa8b1f05dd2874699649db38428ea8a6a90ee29cbf3f08c2269a8'
        '6d67d6038572816d2afd2639d0b0d0f5973036f2cce0daba5351f70dd10c9b71fd49d4b22f161f5e63790e45fa71f37db8d784c565a096403e3d21f6816d10a5'
        '8350f4cf1620ca75335573ae0e27e4b029474b51a76e64a6b348dd75f3f32e9fe4634216b250f0166e0429e7daf497ae48a44f70b89426e2e3f46964ce95c6f9'
        'e1ae61308009356dd1d477a881b1cbebc423cbf85745458f61c0202e9e25243ade3a3fdd3cbaeed2c249a5f0a7007173d9b6353b0f1d5063530dc48bfed5358f'
        '72326721a50a119691331e0f664f75c99e57f1a0879ae57fb837fbf020617b65f6a6282f425e73838896af9af9588660531c43f345699d3dde36fb9e523b9ce1'
        '97a0c5b32ea2d98af3d4481ea1d4cff3d2dff4169fd88e380f75150c0eb61a3c40cacc1b51b87a22c2e8f2815ffa698974f1191954c044eca4cdb2adc2257580'
        'fe7d78569bddeb344f4c992b35eafad3acf7ba23e73c0170652532b4c9f8108b7505c86e47238baf19603628e0350b421ff1e6d3f597f1f2e9685e72b7fb5e59'
        '923b4a8c7bbd5de2bff2e5180a6fa9841f8c11da0745579fd560532aae34be5ff98898f1e08d110801e83f2b5b9b3f868c98a8083cf5f1a879f808ae398c89aa'
        'c765ec399598f94082f5dcb28b2458fe6f61865df78144c2d093b4eb95d555a89b23fb17f10f053bafe216249428cd57363ea232168e5426d3fecdc90d41b281'
        'f16aaf398bf34c4da1afa207b4cacbd127010c91464291c97c1f46e7b6e6d0ac37f57fd181c7f1858ea84cb4b26a2d8afdb015ff3d9e6836a58a058a017f91e7'
        '39a7a7fd91fb772459f235e31f6f43a87f65c236a5f15bbe97405b9d8b587af3c0df4d746f387f43b829f60a701c7edeaf412af0d0a1056bbcc5b4e8d4fabdff'
        '6d59f5c8bf6d1c9dd4fe6eb01447f5afeb2f577ef4c747772aa0e4e3db2688153858e4479e66622177cdbdb30143f6e5d0a54c92f8d2d43f90d699a22378da3c')
