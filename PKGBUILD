# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Kristian Mosegaard <kristian@mosen.me>
# Contributor: Max Liebkies <mail@maxliebkies.de>
# Contributor: Krzysztof Bogacki <krzysztof.bogacki@leancode.pl>

pkgbase=dotnet-core
pkgname=(
 dotnet-host
 dotnet-runtime
 aspnet-runtime
 dotnet-sdk
 netstandard-targeting-pack
 dotnet-targeting-pack
 aspnet-targeting-pack
 dotnet-source-built-artifacts
)
pkgver=8.0.8.sdk108
pkgrel=0
arch=(x86_64)
url=https://dotnet.microsoft.com
license=(MIT)
makedepends=(
  tar
  zstd
  bash
  clang
  cmake
  git
  icu
  krb5
  libgit2
  libunwind
  libxml2
  llvm
  nodejs
  openssl
  zlib
)
optdepends=('bash-completion: Bash completion support')
options=(
  !lto
  staticlibs
)
_tag=e78e8a64f20e61e1fea4f24afca66ad1dc56285f
source=(
  https://mirror.sanin.dev/arch-linux/extra/os/x86_64/aspnet-runtime-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  https://mirror.sanin.dev/arch-linux/extra/os/x86_64/aspnet-targeting-pack-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  https://mirror.sanin.dev/arch-linux/extra/os/x86_64/dotnet-host-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  https://mirror.sanin.dev/arch-linux/extra/os/x86_64/dotnet-runtime-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  https://mirror.sanin.dev/arch-linux/extra/os/x86_64/dotnet-sdk-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  https://mirror.sanin.dev/arch-linux/extra/os/x86_64/dotnet-source-built-artifacts-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  https://mirror.sanin.dev/arch-linux/extra/os/x86_64/dotnet-targeting-pack-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  https://mirror.sanin.dev/arch-linux/extra/os/x86_64/netstandard-targeting-pack-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  )
b2sums=('3fcdfe89c6b2fa07799aba8cdc8282649c75b0a48a93a4c5d72b4766a74003c9ca8b307d8fa82dc6ea9fe94cb89b5a6780c5df8becea4f5f903ac40257c03b9f'
        'e85b7f2a3e410132b9210823b7c37bf727f9f1cd3d92235c24da2e78e0811af952f297086f12932a7095c154ab887ec81970e278d169bd63945303e2c8067290'
        'af7ad9cc28761370e870dae6f743367f27a5ac690626721db38d55f5f1c6d859db2a670fcb868da9c4d340929d895b40948c0c53d18769734131665269669d62'
        'dee5f9b99c85cd9aa66c0ac31d33f75a13a7a9c736e39a7ec35080a78f42a6c0abb7d0aa0c2b8a384ba8514d25b4a80913af4342f211b57ef5c8bf8381c92e1d'
        '304ef1811047139bec7e11936dedb6c18a8a4628a08e883c7ce845fb34032a8275838aa6b034b33baaf53c0c3d5bd0a07b10b0eeae18bdffff8c69ed858050e7'
        '59d3ca0830ba7129f203385ec316636b4382cb135f5af1499229afe182068f189ce7c960d949ef04e754e38fa03c8682052febd7b3253b2865cc38c90f70bb67'
        '14525e019204cb1b8b3ef0dcbe7e14e6c6931e290af0ae60dd0d6d1c248141920eb537b6de39a2631d88661c596d2c6534174f5708b04c1fd79b461e0a553c81'
        '7fdabf66148b7d9dc07dc9b7fc8328c46dd9f64f08cef8d53b97a586f5bc97c11a35094999a12a4018c91264a76dc9c7ce84ec4d20fab8b49d89f8861f17d73e')
noextract=("${source[@]##*/}")

build() {
  cd .
}

package_dotnet-host() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface'
  depends=(
    gcc-libs
    glibc
  )
  optdepends=('bash-completion: Bash completion support')
  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/dotnet-host-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}

package_dotnet-runtime() {
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
  provides=(dotnet-runtime-${pkgver%.*.sdk*})
  conflicts=(dotnet-runtime-${pkgver%.*.sdk*})

  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/dotnet-runtime-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}

package_aspnet-runtime() {
  pkgdesc='The ASP.NET Core runtime'
  depends=(dotnet-runtime)
  provides=(aspnet-runtime-${pkgver%.*.sdk*})
  conflicts=(aspnet-runtime-${pkgver%.*.sdk*})

  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/aspnet-runtime-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}

package_dotnet-sdk() {
  pkgdesc='The .NET Core SDK'
  depends=(
    dotnet-runtime
    dotnet-targeting-pack
    glibc
    gcc-libs
    netstandard-targeting-pack
  )
  optdepends=('aspnet-targeting-pack: Build ASP.NET Core applications')
  provides=(dotnet-sdk-${pkgver%.*.sdk*})
  conflicts=(dotnet-sdk-${pkgver%.*.sdk*})

  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/dotnet-sdk-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}

package_netstandard-targeting-pack() {
  pkgdesc='The .NET Standard targeting pack'
  provides=(netstandard-targeting-pack-2.1)
  conflicts=(netstandard-targeting-pack-2.1)

  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/netstandard-targeting-pack-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}

package_dotnet-targeting-pack() {
  pkgdesc='The .NET Core targeting pack'
  depends=(netstandard-targeting-pack)
  provides=(dotnet-targeting-pack-${pkgver%.*.sdk*})
  conflicts=(dotnet-targeting-pack-${pkgver%.*.sdk*})

  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/dotnet-targeting-pack-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}

package_aspnet-targeting-pack() {
  pkgdesc='The ASP.NET Core targeting pack'
  depends=(dotnet-targeting-pack)
  provides=(aspnet-targeting-pack-${pkgver%.*.sdk*})
  conflicts=(aspnet-targeting-pack-${pkgver%.*.sdk*})

  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/aspnet-targeting-pack-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}

package_dotnet-source-built-artifacts() {
  pkgdesc='Internal package for building the .NET Core SDK'

  cd "${pkgdir}"
  tar --use-compress-program=unzstd -xf "${srcdir}"/dotnet-source-built-artifacts-8.0.8.sdk108-1-x86_64.pkg.tar.zst
  rm "${pkgdir}"/.{BUILDINFO,MTREE,PKGINFO}
}

# vim: ts=2 sw=2 et:
