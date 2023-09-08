# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgname=minio
pkgver=2023.09.07
_timever=T02-05-02Z
_pkgver="${pkgver//./-}${_timever//:/-}"
pkgrel=1
pkgdesc='Object storage server compatible with Amazon S3'
arch=('x86_64')
url='https://minio.io'
license=('AGPL3')
depends=('glibc')
makedepends=('go' 'git')
options=('!strip')
source=(git+https://github.com/minio/minio.git#tag=RELEASE.${_pkgver}
        minio.conf
        minio.sysusers)
backup=('etc/minio/minio.conf')
sha512sums=('SKIP'
            '9fb09d19af9d7a00e4680cd92d208ddd44ce52328f6efee68d7ee47f591cbe77ee88ce139a677bcf8836de0643de18c6c7c4005d50b0056f9b861c3d595e5233'
            '7e4617aed266cf48a2ff9b0e80e31641d998537c78d2c56ce97b828cfc77d96dbf64728d4235dac7382d6e5b201388bef6722959302de5e2298d93f4ec1e0e63')

build() {
  cd minio

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  GO_LDFLAGS="\
      -linkmode=external \
      -compressdwarf=false \
      -X github.com/minio/minio/cmd.Version=${pkgver//./-}${_timever} \
      -X github.com/minio/minio/cmd.CopyrightYear=$(date +%Y) \
      -X github.com/minio/minio/cmd.ReleaseTag=${pkgver//./-}${_timever} \
      -X github.com/minio/minio/cmd.CommitID=$(git rev-parse RELEASE.${_pkgver}) \
      -X github.com/minio/minio/cmd.ShortCommitID=$(git rev-parse --short RELEASE.${_pkgver})"

  go build -ldflags "$GO_LDFLAGS" .
}

package() {
  install -dm750 -o 103 -g 103 "${pkgdir}/srv/minio"
  install -dm750 -o 103 -g 103 "${pkgdir}/var/lib/minio"

  install -Dm755 minio/minio "${pkgdir}/usr/bin/minio"
  install -Dm600 "${srcdir}/minio.conf" "${pkgdir}/etc/minio/minio.conf"
  install -Dm644 "${srcdir}/minio.sysusers" "${pkgdir}/usr/lib/sysusers.d/minio.conf"
}
