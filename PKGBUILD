# Contributor: Muhammad Herdiansyah <koni@artixlinux.org>

pkgname=turnstile-openrc
pkgver=20231002
pkgrel=2
pkgdesc="OpenRC turnstile init script"
arch=('any')
url="https://gitea.artixlinux.org/artixlinux/packages-openrc"
license=('BSD')
depends=('turnstile' 'openrc')
groups=('turnstile-experimental')
source=("turnstile.initd")
sha256sums=('b7e428f7a7075e23f0baa57a61112648cf48a501526022ea24fdb199ae0f9d60')

package() {
    install -Dm755 "${srcdir}"/turnstile.initd "${pkgdir}"/etc/init.d/turnstile
}
