# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=gopass
pkgver=1.17.3
pkgrel=1.1
pkgdesc="The slightly more awesome standard unix password manager for teams."
arch=('x86_64')
url="https://github.com/gopasspw/gopass"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('xdotool: for typing passwords selected by dmenu'
            'xsel: clipboard support'
            'xclip: clipboard support'
            'wl-clipboard: clipboard support (wayland)')
options=("!lto")
source=("git+${url}.git#tag=v${pkgver}?signed")
sha512sums=('58e993e8afd2ea84461545084fd5e769e32e108ca4c688710f8fa01d0b2191d0499530a13ddb9f6ffc848ae8a9783893bcd25f1fc29de87bbf4f9443fde184c1')
validpgpkeys=('7BCE61F400F3CD911EF86EF1D31FA054C85AEFAC') # Dominik Schulz <dominik.schulz@gmail.com>

prepare() {
  cd ${pkgname}
  GOFLAGS="-mod=readonly" go mod vendor -v
}

build() {
  cd ${pkgname}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -mod=vendor -modcacherw -buildvcs=false"
  export GOPATH="${srcdir}"

  local ld_flags=" \
    -X main.version=${pkgver} \
    -X main.commit=$(git rev-parse --short HEAD) \
    -X main.date=NOTSET \
    -compressdwarf=false \
    -linkmode=external \
  "
  go build -v -ldflags "${ld_flags}"

  ./gopass completion bash > bash.completion
  ./gopass completion fish > fish.completion
  ./gopass completion zsh > zsh.completion
  go run helpers/man/main.go > gopass.1
}

package() {
  cd ${pkgname}
  install -vDm755 -t "${pkgdir}/usr/bin" gopass
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -vDm644 -t "${pkgdir}/usr/share/man/man1" gopass.1

  install -vDm644 bash.completion "${pkgdir}/usr/share/bash-completion/completions/gopass"
  install -vDm644 fish.completion "${pkgdir}/usr/share/fish/vendor_completions.d/gopass.fish"
  install -vDm644 zsh.completion "${pkgdir}/usr/share/zsh/site-functions/_gopass"
}
