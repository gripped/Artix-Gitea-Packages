# Maintainer: aartoni <aartoni@artixlinux.org>

_pkgname=userspawn

pkgname=userspawn-runit
pkgver=1.1.0
pkgrel=3
pkgdesc='Launch anything, upon any user login (runit)'
arch=('x86_64')
url='https://github.com/Mayware/userspawn'
license=('LGPL-3.0-or-later')
makedepends=('cmake' 'git' 'ninja')
depends=(
    'dbus'
    'dbus-runit'
    'runit'
    'libstdc++'
    'libgcc'
    'glibc'
    'sh'
)
groups=('runit-galaxy')
provides=(
    'init-userspawn'
)
conflicts=(
    'init-userspawn'
    'turnstile-runit'
)
install=userspawn-runit.install
source=(
    "git+$url.git#tag=v$pkgver"
    'userspawn.run'
    'userspawn.log.run'
    'userspawnrc'
)
sha256sums=('29970fec753883a5343677e069d9442835551f992d0e848540c6975db047705b'
            '5efa2b881784b61cb21aa8ddfb988830621b5c5d766f9c6c57c65d1fecffe3f2'
            'fdd451e606e026156bc30100c5ecb7c5697dd6e4b0369aad0d73e66c31ea2374'
            'ea1c3dbd3bd41097c402841c09e36bfa67e91878f692cb70eabb5f2c37acac96')

_backports=(
)

prepare() {
    cd "$_pkgname"

    local _c
    for _c in "${_backports[@]}"; do
        git log --oneline -1 "${_c}"
        git cherry-pick -n "${_c}"
    done
}

build() {
    cmake -B build -S "$_pkgname" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm755 userspawnrc "$pkgdir"/etc/xdg/userspawn/userspawnrc
    install -Dm755 userspawn.run "$pkgdir"/etc/runit/sv/userspawn/run
    install -Dm755 userspawn.log.run "$pkgdir"/etc/runit/sv/userspawn/log/run
    install -dm755 "$pkgdir"/etc/runit/runsvdir/default
    ln -s ../../sv/userspawn "$pkgdir"/etc/runit/runsvdir/default/userspawn
}
