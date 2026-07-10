# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=forgejo-runner
pkgver=12.13.0
pkgrel=1.2
pkgdesc='Continuous integration for Forgejo'
arch=(x86_64)
url='https://code.forgejo.org/forgejo/runner'
license=(MIT Apache-2.0)
depends=(glibc)
makedepends=(git go)
backup=(etc/forgejo-runner/config.yaml)
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  systemd-service.patch
  sysusers.conf
  tmpfiles.conf
)
sha512sums=('80f86ef0da82ace759c55838e14f608c44463ef4b2e3018529f77d06b62d1385908b81c8c010aed8b2885be0dc3298162b924e87a5451daa128db175398b14c6'
            'd04a8bc145f11225a35fdc47ed047b7cb7a4267e002f3caf8f288ef4f48226bc12de26007853da966f478d103471dcbf690db5665d032d756c37fc4c7a7fd68c'
            '383a5cb2e6c8cf267dc1cd2de2fa97994b332521d449a9d903a639eaa466335756e8dd2fd13a8b3e233f4ceec6da2d293ba54e0fdbd09c54c6bc77d0314a7c49'
            '4b6b6fd8538e9c4338a07aa1faaa3dfbd887933f1de6d68046cfc5107e98bcf83758a655049cb6d860a7d0f57726abf573a334cd303ea94f11c91e5df37a3700')
b2sums=('2ef8e0bd91331b2f2d3de75aeddf6cc346c29e5ae6e520b2377168d50ed0db91a4319c70be690976efe50dfcb0bc105670b536aee5ad900594a26974904316d7'
        'bef8cde724d210d9eb7adefa4039b86f7b84f2b2f64a4df15c8abd8813eb8d9e422819251f4caf675366117d924487b12b4faa028f2a428f13f60c637840d078'
        'f3f86bb89290926ffddb76f3362ce3f1f1c880f0685e52995d23860c25a8ce93cff52c9ae06c741f54ca7f8749ff3049bad85db5651edf0a2de3d0e3b41377a5'
        '71313b1118ab5d8747bf9b52fa2a431e8e360ae31b357f343b5a833e3ae811259cbf9f5ccc1eb3085fcde4499ce4e4606c7caf7019078ae526f2895d4294e331')

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build

  # download dependencies
  export GOPATH="${srcdir}"
  go mod download

  patch -p1 -i "$srcdir/systemd-service.patch"
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -s -w -buildid='' \
    -extldflags '${LDFLAGS}' \
    -X code.forgejo.org/forgejo/runner/v${pkgver%%.*}/internal/pkg/ver.version=v$pkgver" \
    -o build/forgejo-runner \
    .

  ./build/forgejo-runner generate-config | sed -E "s|^([^#]+)\.runner|\1/var/lib/forgejo-runner/.runner|" > config.yaml
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/forgejo-runner

  # systemd integration
  install -vDm640 -t "$pkgdir/etc/forgejo-runner" config.yaml
  install -vDm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/forgejo-runner.conf"
  install -vDm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/forgejo-runner.conf"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
