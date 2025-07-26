# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Kristian Mosegaard <kristian@mosen.me>
# Contributor: Max Liebkies <mail@maxliebkies.de>
# Contributor: Krzysztof Bogacki <krzysztof.bogacki@leancode.pl>

pkgbase=dotnet-core-8.0
pkgname=(
 dotnet-runtime-8.0
 aspnet-runtime-8.0
 dotnet-sdk-8.0
 dotnet-targeting-pack-8.0
 aspnet-targeting-pack-8.0
 dotnet-source-built-artifacts-8.0
)
pkgver=8.0.18.sdk118
pkgrel=0.1
arch=(x86_64)
url=https://dotnet.microsoft.com
license=(MIT)
makedepends=(
  tar
  zstd
  bash
  clang18
  cmake
  git
  icu
  krb5
  libgit2
  libunwind
  libxml2
  lldb
  llvm18
  lttng-ust2.12
  nodejs
  openssl
  udev
  zlib
)
optdepends=('bash-completion: Bash completion support')
options=(
  !buildflags
  !lto
  staticlibs
)
_tag=e78e8a64f20e61e1fea4f24afca66ad1dc56285f
source=(
  https://mirror.sanin.dev/arch-linux/extra/os/x86_64/aspnet-runtime-8.0-8.0.18.sdk118-1-x86_64.pkg.tar.zst
  https://mirror.sanin.dev/arch-linux/extra/os/x86_64/aspnet-targeting-pack-8.0-8.0.18.sdk118-1-x86_64.pkg.tar.zst
  https://mirror.sanin.dev/arch-linux/extra/os/x86_64/dotnet-runtime-8.0-8.0.18.sdk118-1-x86_64.pkg.tar.zst
  https://mirror.sanin.dev/arch-linux/extra/os/x86_64/dotnet-sdk-8.0-8.0.18.sdk118-1-x86_64.pkg.tar.zst
  dotnet-source-built-artifacts-retry-8.0-8.0.18.sdk118-1-x86_64.pkg.tar.zst::https://america.mirror.pkgbuild.com/extra/os/x86_64/dotnet-source-built-artifacts-8.0-8.0.18.sdk118-1-x86_64.pkg.tar.zst
  https://mirror.sanin.dev/arch-linux/extra/os/x86_64/dotnet-targeting-pack-8.0-8.0.18.sdk118-1-x86_64.pkg.tar.zst
  )
b2sums=('01f81462c018b135503454a92084a417643640fdfdc02518ea39931e52edc56c98e91b1a69c1a9a62b4fc021f92be625704e7e64ca8c6ba47876d5f04a0aa0b3'
        '4ca1214595c472de39b1459063e14a5c7c20b45f82e6976ee4828d4e17c574ac664ab47be3589d28c7afd8fdd9a45ec2e7f61e96206167e3150cee72c381de50'
        'e511f18c4d793b7c1823b6fb2427e98044efd54a43a3a998cd448e2e81ea7aedcaceb04cb21ec4fff6409d8dd3d5d9ae4e35499d1918e641a4f5456395d8c3e6'
        '42ad5b61c0514e13feea92cd1f4207f2e55b5fcd5e818f66c98844437cc9fa95ec604538cbde3b1ada33cd80627494eb705db22b6a2ee4ce493d3e2d0ad0d413'
        '58ff8c684ffbb32763ac97b68483c6063532d658924321a8c4bbb79be06489fd7ec85148a4530f846cd9e353d6b0e31d4bf585ef6372c71417be8bcf29286654'
        'ef0285b6ada80cf38fb9c09cc55d04372bad25e296ef3ecfd273a79b5a0873aae7eccb52e9c3614a8da9dc2b029da042cf4aa6963fe50c4ba049351c9ae429f6')
noextract=("${source[@]##*/}")

build() {
  cd .
}

package_dotnet-runtime-8.0() {
  pkgdesc='The .NET Core runtime'
  depends=(
    dotnet-host
    gcc-libs
    glibc
    icu
    krb5
    libunwind
    zlib
    openssl
  )
  optdepends=('lttng-ust2.12: CoreCLR tracing')

  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/dotnet-runtime-8.0-8.0.18.sdk118-1-x86_64.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}


package_aspnet-runtime-8.0() {
  pkgdesc='The ASP.NET Core runtime'
  depends=(dotnet-runtime-8.0)

  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/aspnet-runtime-8.0-8.0.18.sdk118-1-x86_64.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}

package_dotnet-sdk-8.0() {
  pkgdesc='The .NET Core SDK'
  depends=(
    dotnet-runtime-8.0
    dotnet-targeting-pack-8.0
    glibc
    gcc-libs
    netstandard-targeting-pack
  )
  optdepends=('aspnet-targeting-pack: Build ASP.NET Core applications')

  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/dotnet-sdk-8.0-8.0.18.sdk118-1-x86_64.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}

package_dotnet-targeting-pack-8.0() {
  pkgdesc='The .NET Core targeting pack'
  depends=(netstandard-targeting-pack)

  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/dotnet-targeting-pack-8.0-8.0.18.sdk118-1-x86_64.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}

package_aspnet-targeting-pack-8.0() {
  pkgdesc='The ASP.NET Core targeting pack'
  depends=(dotnet-targeting-pack-8.0)

  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/aspnet-targeting-pack-8.0-8.0.18.sdk118-1-x86_64.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}

package_dotnet-source-built-artifacts-8.0() {
  pkgdesc='Internal package for building the .NET Core SDK'

  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/dotnet-source-built-artifacts-retry-8.0-8.0.18.sdk118-1-x86_64.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}

# vim: ts=2 sw=2 et:
