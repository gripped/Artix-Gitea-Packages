# Maintainer: artoo <artoo@artixlinux.org>
# Contributor: Ben Parsons <9parsonsb[at]gmail[dot]com>
# Contributor: Chris Dill <chrisdude134[at]gmail[dot]com>
# Contributor: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Sven Lechner <sven[dot]lechner[at]rwth-aachen[dot]de>

_pkgname=act_runner

pkgname=act-runner
pkgver=0.2.13
pkgrel=1
pkgdesc="A runner for Gitea Actions based on GitHub's Act"
arch=('x86_64')
url="https://gitea.com/gitea/act_runner"
license=('MIT')
depends=('glibc')
provides=('act_runner')
makedepends=('go')
backup=('etc/act_runner/act_runner.yaml')
source=("act_runner-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'act_runner.yaml')
sha256sums=('69e6fe36ad9e9be188bf6dfe5fd55697eb92ef1aed6396c9a44c1d8e24611176'
            'c7daf8870a1b8ac67358b912e0511be1f815345a6b7bd9643050e9c3a48f83e9')

build() {
    cd "$_pkgname"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -buildvcs=false \
        -ldflags "-linkmode=external -X main.version=$pkgver"
}

package() {
    cd "$_pkgname"
    install -Dm755 act_runner -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

    # install config
    install -Dm644 "$srcdir/act_runner.yaml" "$pkgdir/etc/act_runner/act_runner.yaml"
}
