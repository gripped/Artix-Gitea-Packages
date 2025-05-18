# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gnupg
pkgver=2.4.7
pkgrel=2
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
  $pkgname-2.4-avoid_beta_warning.patch  # do not emit beta warnings (due to misbehaving build system)
  # patches maintained by freepg project: https://gitlab.com/freepg/gnupg/-/commits/gnupg-2.4.7-freepg-3
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
  0011-Avoid-simple-memory-dumps-via-ptrace.patch
  0012-Disallow-compressed-signatures-and-certificates.patch  # CVE-2022-3219
  0013-ssh-agent-emulation-under-systemd-inject-SSH_AUTH_SO.patch
  0014-gpg-Sync-compliance-mode-cleanup-with-master.patch
  0015-gpg-emit-RSA-pubkey-algorithm-when-in-compatibility-.patch
  0016-gpg-Reintroduce-openpgp-as-distinct-from-rfc4880.patch
  0017-gpg-Emit-LibrePGP-material-only-in-compliance-gnupg.patch
  0018-gpg-gpgconf-list-report-actual-compliance-mode.patch
  0019-gpg-Default-to-compliance-openpgp.patch
  0020-gpg-Fix-newlines-in-Cleartext-Signature-Framework-CS.patch
  0021-Add-keyboxd-systemd-support.patch
)
sha256sums=('4e946396a8a3cf8e0b997c5ea87e5732efdc7fee2037d96b0eeb911cd350dab0'
            '243c3a79295519b3931f9d846cf2af5caa064a78de812ee336dc786c1567b4d0'
            'b9b9f711a0eb4517102f5b5205afec0978dbaeeebd192e66f3bb0190a3f86035'
            '9ac259d6ea0d58de502b1b2e42a8fe8fe47080c90b690b5b090d7109be17a7d7'
            '9998511e218fe5997bb4fa3c35f3e8e026ac074c44e0167fe2eaabaa06b63fcc'
            '179e05764b1dafd098e591db460db95c18c833dc76678a6582580bf5708cfde6'
            '89260ff1337530582ca2f8b003510ed2c4d961f5503cb18eef38c37189b08d2f'
            'b98c72d337a4530ab1100b56e9a32b88a22b18da4a6bf7b2e35ba5e0638ba545'
            '86f3a4cb3748048073efc2e941a9dff13cf92e4eecdb946182a3889a574378d5'
            'c7e728661e9d2d2d380ea9ac420b20fc36021b9ca96c4db24e0ad7149049e22a'
            '35bd9dd7a40ad83243a67ec40eace49c2110b255c96684f3b43a2352df36ecdb'
            '98c03e2177bebe3b8a4d6850047e626d1261f37eed9cfb711a53fbaa982de9b3'
            '73a36e34eadf7edf1d8e645cc07c50b8ea708dc33dacc8dcb8a9a55985b94f4f'
            'f02b9629c03f5b6a56ab5e9a4c3f6a425487fcd34aeccfa6059e1d714422e410'
            'a825ac1a04a20d50ddb4e91ff93a0187a65baa2e54063a292cff4c1ad350c255'
            'fdfb12f1b834b3dd03aff41bb0f394b281abc8379332a3ca71f77c46e55e1566'
            '039c6bc91e63a80af53a5bd3e727d4ac386ce114468074fb2350d71f313df791'
            'c102990a726b4041c66723042fbedc21530ad5cff26703f0ae8c56c451f5e6c2'
            'cabe5392b8155157ddfb6e880b057c2ac09591cc5cea4966e9b6857026c40cd9'
            '75b65db663963ec3e44274a299aa07fbd2757f041f257609b1d3ea701f04bd51'
            '395e61d8f6ed37e884f28cd36618e6391bb4eeaf2421b93f76f2a40f781008d7'
            '8901ead8817cccb10bb9720549718bf0bc3cd0b9a315c04fdaa605311c2f69be'
            '7a57c9a5b75fbd70acd565f8db6a816bc85ea18fe1121543758d933e777d6538')
b2sums=('2c53de51bdde9c7107b6cad253ee552987c43a1f8969e7888fb7017811260b62ad7e06fd470693a8a768bf690b596d514b50795add3a27f3587d5fe439e7518e'
        '168855b598714abb27e01e52e0ed1e1a01ab14ffb2ee09d759308375359cd28c0a9f96c6b9dee0a2cc5713aec8ea831858d59f56a0a126bca3e1401b078fc7ab'
        '40d67730a471be90765cae47e85d3d845a2ed8f6be21f87a784b01d979a2761eaca5e84290a6411e583de908e7f17fa5506d32261df0643e7735e8e422e52140'
        'dd8dea0c5928271be2d3b08fd6af48af4525ec081219f15aa2e5d872361092d1fecee18e1a8f2907d46811bd75b88cbd6738f49f3deef4fd895bac8c3eabcf76'
        'e3db5ca5aa6938679940b9b5e208b7bfcc5976a46f1231d619c6c37b717a0bee1ddae068c39894f5de3a1bc5ca935592c365a770737e5555e20d04d231aa4b90'
        '4e1fcfb7a8aa30e581a17fe896b29382ff2cfe914396384c7f75e985e8cba81397b1e671eb15201ad82983ebfd984b443755dc86aef004e2d003b396180682b7'
        '37a96a96c906e76040b27b127d9c3e5d719396db153d1ce46ecf7a676c0696b25bdb5692bbbaef9816fd4671ef618c1df243196b283af5415c2f23c9fd847772'
        '66ad22201f8d9a7bf583abbf5b75a555a1996f3d3132a4837a7110e55348af8aed75ae141cd147011ae8deb6142f198a8b888e36438060394c985ff1fc16be7c'
        '60483b3665918a0f79f68707289add93ccfd1110dc55a268712710e55034c926a73be58ef98f90f5150ae02c5dd5b5c1792e3e3c578965c09bcb0f6427eeaacc'
        '45eab99cb89bac2e058cebb16a2fe0323fcbe2d0095947c2df405cf195389b00e62c9a3d65072b114ed40722d9ced7ee2eaaf713411f1420f6d486723999fb8c'
        '465c20b1ce65966a63ac60c5178a21424f38da9e8e7a23b377e0be339fb6c00cc41532a84ca57c2823dad00059687d29001cb48448baa2462b13423a466d184b'
        '3c1d1b0eceb2da26f1afb42084b6b6e3932324e91b091b70badbc84422b04f135104e008233389c15d7f38156b1942c2ac1c325e5c0dd9d4a1a591f815869d37'
        '824cd34b6d62b0d75b5ed960adcd8986aeb5a7213cd16942ed1576326352627261bbf3afa0da4e880da5a088cd9ea8a72b9287b4fa2800f2d9bd0f487b24ce79'
        'ac699ec4fee5fbc79dab9d9cf2f6fe7321cc9f954964c8b0a7b4507fbe3f7271516cbd05c430a37d7f8a0bda86e79ce269e2f7b2ea7a86872ac441a66f1d0ac1'
        '8dceab2e4f3fa1b4dfeacafe238e35fbb09f215f081e46044bf903dfb25bb6f201cb0b74617b1beb682a2be2ea9cf9f04c40e0b36b2dee602233df2b42899056'
        'b5ecf18315d6b491299af999369d3991d4d54f2220ee9728ac877382caffa5b04dabe04a62b0ecfdc4b4add7efe3e97b37a8bb3b6a315fc85fd552e01d708187'
        'a73c9f4fe93afde304760b649ff7fdabcb430ccc34e5446a0cedc93509c61328cf6c8a830d2b351f20401c83a6c03e720147cab81ebf402c2b26127f9b6571c8'
        '5c748b8546f957c20b042db41b67e39cf2349167c42fbb267e95d4ef62389519e9bd9010f0cda4f63f6f5f434817997ded8b7fa0eb99b5f2d502cabf11fbcfc7'
        '3137338eaa5c27ea7342b511e4d0ad22932e8e88a64c9eedbe5df56f9ef3672a7784bbea710e9c01d9bb95a7944c91cfcad82cac0ae6261a4ad22387c2b0b095'
        '8638b6cab393335358c3ef139683c40849045d2769f72e34cfae4694410f3315f186e93d02158baf09c00ec71758aa71bdc028142ca4426eedbf59ceb5a640ae'
        '8d9d234815cfeffca7afe29969c3543e8b406c83088d303499b2abd4885af9ceb1529a1e2dbab838c588fd4194aec58ee0af389f2ff2a89a35180fb93fe1c2ea'
        'fde9ebf28edf5ecbd191c60bd73579204279fb313935234dd2541981dd1859ba92091ff76b1fa2877ef3752a543a4c73113dbd176f391b444e0d25d5682788a6'
        'b8ec2df18e8f18818d6def275284ea1a10f1a610a98a3091392af06c2cdef3292805443636c867f6c2c4bc526d9a0a81485aa5ba87afd6ba102f2eb93eed0984')
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
    msg2 "Applying patch $src..."
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

  install -vDm 644 {BSD-{2,3,4}-Clause,MIT,Unicode-TOU}.txt -t "$pkgdir/usr/share/licenses/$pkgname/"


}

# vim: ts=2 sw=2 et:
