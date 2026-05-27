# Maintainer: aartoni <aartoni@artixlinux.org>

pkgname=userspawn-runit
pkgver=20260527
pkgrel=1
pkgdesc='Launch anything, upon any user login'
arch=('any')
url='https://github.com/Mayware/userspawn'
license=('LGPL-3.0-or-later')
makedepends=(
    'git'
)
depends=(
    'dbus'
    'dbus-runit'
    'runit'
    'sh'
    'userspawn'
)
provides=(
    'init-userspawn'
)
conflicts=(
    'init-userspawn'
    'turnstile-runit'
)
install=userspawn-runit.install
source=(
    'userspawn.run'
    'userspawn.log.run'
    'userspawnrc'
)
sha256sums=('5efa2b881784b61cb21aa8ddfb988830621b5c5d766f9c6c57c65d1fecffe3f2'
            'fdd451e606e026156bc30100c5ecb7c5697dd6e4b0369aad0d73e66c31ea2374'
            '60ad911bec48c174eba7f976b7221bef78d6cf5bd1eb09030be44b4debf2124e')

package() {
    install -Dm755 userspawnrc "$pkgdir"/etc/xdg/userspawn/userspawnrc
    install -Dm755 userspawn.run "$pkgdir"/etc/runit/sv/userspawn/run
    install -Dm755 userspawn.log.run "$pkgdir"/etc/runit/sv/userspawn/log/run
    install -dm755 "$pkgdir"/etc/runit/runsvdir/default
    ln -s ../../sv/userspawn "$pkgdir"/etc/runit/runsvdir/default/userspawn
}
