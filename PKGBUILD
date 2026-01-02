# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gnupg
pkgver=2.4.9
pkgrel=1
pkgdesc='Complete and free implementation of the OpenPGP standard'
arch=(x86_64)
url='https://www.gnupg.org/'
license=(
  BSD-2-Clause
  BSD-3-Clause
  BSD-4-Clause
  CC0-1.0
  GPL-2.0-or-later
  GPL-3.0-or-later
  LGPL-2.1-or-later
  'LGPL-3.0-or-later OR GPL-2.0-or-later'
  MIT
  Unicode-TOU
)
depends=(
  glibc
  gnutls
  libgcrypt
  libgpg-error
  libksba
  libldap
  libusb
  pinentry
  sh
  sqlite
  tpm2-tss
  zlib
)
makedepends=(
  bzip2
  fig2dev
  git
  imagemagick
  libassuan
  librsvg
  npth
  pcsclite
  readline
)
checkdepends=(openssh)
optdepends=(
  'pcsclite: for using scdaemon not with the gnupg internal card driver'
)
install=$pkgname.install
source=(
  git+https://dev.gnupg.org/source/gnupg.git?signed#tag=${pkgname}-${pkgver}
  keyboxd.8
  $pkgname-2.4-avoid_beta_warning.patch  # do not emit beta warnings (due to misbehaving build system)
  # patches maintained by freepg project: https://gitlab.com/freepg/gnupg/-/commits/gnupg-2.4.9-freepg
  0001-gpg-accept-subkeys-with-a-good-revocation-but-no-sel.patch
  0002-gpg-allow-import-of-previously-known-keys-even-witho.patch
  0003-tests-add-test-cases-for-import-without-uid.patch
  0004-gpg-drop-import-clean-from-default-keyserver-import-.patch
  0005-avoid-systemd-deprecation-warning.patch
  0006-Add-systemd-support-for-keyboxd.patch
  0007-Ship-sample-systemd-unit-files.patch
  0008-gpg-default-El-Gamal-to-3072-bit-keys.patch
  0009-gpg-Always-support-and-default-to-using-SHA-512.patch
  0010-gpg-Prefer-SHA-512-and-SHA-384-in-personal-digest-pr.patch
  0012-Disallow-compressed-signatures-and-certificates.patch
  0011-Avoid-simple-memory-dumps-via-ptrace.patch
  0013-ssh-agent-emulation-under-systemd-inject-SSH_AUTH_SO.patch
  0014-gpg-Sync-compliance-mode-cleanup-with-master.patch
  0015-gpg-emit-RSA-pubkey-algorithm-when-in-compatibility-.patch
  0016-gpg-Reintroduce-openpgp-as-distinct-from-rfc4880.patch
  0017-gpg-Emit-LibrePGP-material-only-in-compliance-gnupg.patch
  0018-gpg-gpgconf-list-report-actual-compliance-mode.patch
  0019-gpg-Default-to-compliance-openpgp.patch
  0020-gpg-Fix-newlines-in-Cleartext-Signature-Framework-CS.patch
  0021-Add-keyboxd-systemd-support.patch
  0022-Support-large-RSA-keygen-in-non-batch-mode.patch
  0023-gpg-Verify-Text-mode-Signatures-over-binary-Literal-.patch
  0024-gpg-Do-not-use-a-default-when-asking-for-another-out.patch
)
sha256sums=('383fd9720a966825b9d5e45a2b49b3b340ebed356252c73cca242b26dffec0ba'
            '38c66efbd3bffdfa9cb0f226a6db03ae4b226f705dc2d0266a555d8ace823b79'
            '243c3a79295519b3931f9d846cf2af5caa064a78de812ee336dc786c1567b4d0'
            '28ab30a6d4318db5fd43e0023dff4c1e14b52dc0d1a61e0f2fc2de580a5c2ed4'
            'af0dc5a99b692f702c1394939aced1b395074cfb77e85abc1d43427189c18d0b'
            '1ec1f49b7a268e632025ef8e19ba2ad9eddec8422e82fdff6c538166729b5383'
            'c7c2f274843ef4d2fedf8e2e11b3d48c12068763f382ee109f8f891bb77882e3'
            '1dafb121d03722b20ab11890c6fc21f3e17130ca7671ae1832e6c08fa79bfdd7'
            '66aeae7536a9ac665b4ffd4a5a8139c9f5d0937c0a36bdc2be1a78618d6778a8'
            'a6666def2d2d097466b06588c11f8284356427fc97a221a931c1660d6bfdd995'
            '6d394da4bed0775e4be2b491afefa12a6fd0c1aa728ffbab84478d81c82413db'
            'ee26d07ccbc3de76f864e0a1b2abc08a099a870325608a3f3d6bf27c48ee5e52'
            'c49eab41a56f51d95c874eaaf84fe8a813960063eee1b5d306ea3bc79bc3376e'
            '0bba286b75af29767a399ac42de7063d188a1c6ee1e7bb98156618b58561c8d0'
            '8bac80ddcfbd3462b308c8fcab285f38e321612723f63d176a8c7cba4c094400'
            'e661cbe070cc532fb4f030b3f7212b837b600202b8e87d5e8e6e07719f762438'
            '05650d9b8821f24ab24d6bf0e8b548015c8682dd3426a664e62b7d257fb1a1ca'
            '0ab309c49275b1752d8a9357e3aa99d0ce390cea719352459ba15f0ba7ad36cd'
            'd6e18412d04bb7a3c5c67ee0b58dec10d99ad7bed088d79a90087207bd42f918'
            '6933f46233134c20a9b2b157228075bd1e1dd7ff5dc4827fe69b6b1950f0e9f8'
            '1cede22601b8889a9c03b074a3672119ffd22584c7ad41fa770680bcfbf8f6f8'
            '94ca8efe9772985114bcffe3ca9518b414db5ee9e3336d61167f4f0481192a72'
            '843f5d2f0de250a594dd1be50aecd5dd0e86aae87bb0a12b043251beb7b0fcfd'
            '8a7737be5bc092b5034ca91a213946b1a3af0ff2c083b829eba751f0e4d1ad1f'
            'b81fd496950e26908cf6c2c2d91c80a486866180aef1432efdd244dfa3c76fc2'
            '741bb77575765aac6728f12b2ba83ded281ae5a591cc531054fe29a0b691e7f2'
            'a4fe401b274d22bbbea8c48caf40cee8e0a361b1bdb94019803120b4a9feeecd')
b2sums=('c6b16d797b13e91c4f3eb41d28a69a5854e1744eaac662058cc5332b69b90349a79b891895b7460027bd6234394a4caf36f800d20a74c696a049764112f00658'
        '5e4fed3c54785fc0140a1cfe970c6ed6a61c0041961999a9777dfcb0050d45e2b9231b3e5e97e025cefe1461614b599bc7129eea931d1996f4849cd83f546abc'
        '168855b598714abb27e01e52e0ed1e1a01ab14ffb2ee09d759308375359cd28c0a9f96c6b9dee0a2cc5713aec8ea831858d59f56a0a126bca3e1401b078fc7ab'
        '5154c189b160e7a5c03126b9dea02101ff4139d82693c0becb9f110150da04a5c4bd4729d4ef50777b767c8bff07eb8c395c64ead6b77f24a38de4b5a4a2e6a3'
        '8238f5d683ddd307de73be69b41acbb256587749585f5e6b2ef40e79a72298fba5c5ee651457572f6b9af1839707a1c931bb6e47a709b423819a8eb6dcdb917f'
        'c1d986a1ab351aaa17656a90114c341fb5ccaa3f22a34aebe365194f618fae6aa4b6f7a5abd7ee38f79f5729df108c32508131f9d380e3d42d20a2380ee91b64'
        'af0f413b5adf9ef6e85e70e018c83dd3b756f94be2c939277fa09644225269247e83447525b27b86fbc9c9561b645fce98a5d711b244ffb0826cbd1c6efc0265'
        'eef1b08ca80cb06399690223b05870da38b9b1cb6f64e6c19d749d8f3c019aebfe8e2cf75ee39177ffe21c12a9da69574f272155c3c59c46dfb18972a4d7ead5'
        '3d84f729d12ddf7102a9fb819d600a0f4c372d244b7f23fc13ae9ab0758c194bd471dd712b0db688fb727cdd31c9f12f38a7f3f1e7519b3de9501b69751bdc83'
        '5180eacec3d126795fdd90161f090aa52998017f8a07c427f46abaaf2ef8f5a60f20ffd7a07fd63ba2bf9af3ab7403a8fc6c6c1b79533a8cddaf4fd77eafadba'
        '12aa79ffa425ddf3bea9c97254ec34663764031784b0803a66264d336654ee68b14267d91de55c5b75f03e23e1ae503993db9741654fc5a866c630e54ad7d7e1'
        '9d17b1bd5dff53ed1afa3555d55a9bd6d36e97daec4e653bbf3d4ebcb7b5cd665c624f4ad765e622c563775e14213a56ae44156f1c9cbe6622d6a722da363559'
        'de7e7d3cf0d73c745dfd3ed2e683e8bd3ee0d92642ba4caa9f2215dc2bf959127af3871ba7d78c6a25f0cd69a95bb0683954c6399f37515fd42724b3c0d00be0'
        'a9c8c17f1d72cbbf8ccab41fb769dd3c984c63aa605e97f68c9142f0df67d37525a400c078b5f4c52234eeeefdeb84329970baa727a9499595f85140e706900a'
        '646484326f0a910360ef82ef53f03a9e2293ad69a7c6789720b78e544e8ea03cc66d7eed69706be80be61e85f29edddeb0f04a9df73fa49f9347c4e5dc010505'
        '53801cf0d7fcc7777412baf223c3bafdf8ff81bea303aef45ba266a481980eaca1e6b2a0d9c0ca45ab7ba01f438c6dc5c5390d5cf6e2f9bfaf6c1c66bce44718'
        'e5585ea221de14d5ba2ddb6c055f0eb0088114d08c835688c12348b988235910b4e3925f5ec0dddb298cbb16343d2747d8bdbe26d67c8ca8d5f5129906a3128e'
        '6e9a959812d3af5af98ed8b879dc917bb99dca39515e9e5cb531537f23f0cf510ff8da28431051f45233e46d20c31b492c80a35cda15f10cd8534a970e655659'
        '5f1296addff230519cc433429cf4107437e77810e19f66088b6037d251fb0bf4ad4e0d9bc1775154f8ab3a5d2e1c27f651da43a4ec5df3fd87d215f9aee627b0'
        'b650feae80ceccbb87fe2c88b567c726a071a9c5a88a5e35af32825e8451e737fc2964bf1e8e61261d13036700539412c09122415817dbe3f25b68ffd05e62c8'
        'e4a90e65691b3c9da9ffc91f5f97324e0d0e27e097dc93e6a706f5c18d3cdbd80793d98076093cc195ae6d00b08a2446a7ca86b161bc9bc14d8d7173fba664be'
        'ffa2413f688723be480d6485710a3a2ea9ed9126867d8c46c17cd9a660f21f881bf6130ec79dd2badfb3b0466114d0f9ca694b11366abbc5c701a510ea8d7f28'
        '23822586ba1e172d16f574d5ec6db2b2a77bff33b1d52bbe0769f0bf0cf75492d0e124610b78a4334d71afa5ef8612ae12764eea5b74ae645ef028dce0dd6e92'
        'ef33013e291c130ae29d72c165580e2b263449f3d82ef539c49a67cf43f82565e5e76c2419c15c622c9331a4f5cf1cc94a6c9902773ff767c68e30e8b20663aa'
        '1bcb94a4e8c02ca2fc68da530c691bbeccb82f06effcfe17f5e21db9c502677ea0478b381b124d078e9e9dc6056eab6f79d9b5e8ac91749958ce1784a50b7372'
        'f65c751d825c1589eadfec8a20b6cb534bf4c360a83741003b9445411398fa0967e6453103700190b664e8aae146e8e8395acc3af5a13001c048777aae044d6a'
        '818deb3cf7b6a0d2f951ab42dc86e79945c2045905b3bc6e94208a99c95c7ae9e404422444c6ba9582c152dabdbfca8ac37ef5a12923965c251973132b11d55f')
validpgpkeys=(
  '5B80C5754298F0CB55D8ED6ABCEF7E294B092E28' # Andre Heinecke (Release Signing Key)
  '6DAA6E64A76D2840571B4902528897B826403ADA' # Werner Koch (dist signing 2020)
  'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD' # Niibe Yutaka (GnuPG Release Key)
  '02F38DFF731FF97CB039A1DA549E695E905BA208' # GnuPG.com (Release Signing Key 2021)
)

prepare() {
  cd $pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    printf "Applying patch %s...\n" "$src"
    patch -Np1 < "../$src"
  done

  sed -n '5, 28 p' COPYING.other > MIT.txt
  sed -n '30, 60 p' COPYING.other > BSD-4-Clause.txt
  sed -n '62, 92 p' COPYING.other > BSD-3-Clause.txt
  sed -n '95, 125 p' COPYING.other > BSD-2-Clause.txt
  sed -n '128, 160 p' COPYING.other > Unicode-TOU.txt

  ./autogen.sh
}

build() {
  local configure_options=(
    --enable-g13
    --enable-large-secmem  # prerequisite for large RSA keys
    --enable-maintainer-mode
    --libexecdir=/usr/lib/gnupg
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir=/etc
  )

  cd $pkgname
  ./configure "${configure_options[@]}"
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  depends+=(
    bzip2 libbz2.so
    libassuan libassuan.so
    npth libnpth.so
    readline libreadline.so
  )

  cd $pkgname
  make DESTDIR="$pkgdir" install
  ln -s gpg "$pkgdir"/usr/bin/gpg2
  ln -s gpgv "$pkgdir"/usr/bin/gpgv2

  install -vDm 644 ../keyboxd.8 -t "$pkgdir/usr/share/man/man8/"
  install -vDm 644 {BSD-{2,3,4}-Clause,MIT,Unicode-TOU}.txt -t "$pkgdir/usr/share/licenses/$pkgname/"


}

# vim: ts=2 sw=2 et:
