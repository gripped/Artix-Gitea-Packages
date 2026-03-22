# Contributor: nous <nous@artixlinux.org>
# Contributor: Rafli Akmal <rafliakmaltejakusuma@gmail.com>
# Contributor: artoo <artoo@artixlinux.org>
# Contributor: Oscar Campos <damnwidget@artixlinux.org>

pkgname=dnscrypt-proxy-openrc
pkgver=20260322
pkgrel=1
pkgdesc="OpenRC dnscrypt-proxy init script"
arch=('any')
url="https://gitea.artixlinux.org/artixlinux/packages-openrc"
license=('GPL2')
groups=('openrc-galaxy')
depends=('openrc' 'dnscrypt-proxy')
provides=('init-dnscrypt-proxy')
conflicts=('init-dnscrypt-proxy')
source=("dnscrypt-proxy.confd"
        "dnscrypt-proxy.initd")
sha256sums=('fd918f1c0c04e594b8ba50b693b617c8e28562f14e9faa4f1528539d64b2c840'
            '3968d8d4bee545a7c4452c70741b6ad8c500371c14cb989bf938d509dc6576d8')

package() {
    install -Dm755 "${srcdir}/dnscrypt-proxy.initd" "${pkgdir}/etc/init.d/dnscrypt-proxy"
    install -Dm644 "${srcdir}/dnscrypt-proxy.confd" "${pkgdir}/etc/conf.d/dnscrypt-proxy"
}
