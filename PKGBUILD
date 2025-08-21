# Maintainer: artoo <artoo@artixlinux.org>
# Contributor: Oscar Campos <damnwidget@artixlinux.org>
# Contributor: Rafli Akmal <rafliakmaltejakusuma@gmail.com>

pkgname=docker-openrc
pkgver=20250821
pkgrel=1
pkgdesc="OpenRC docker init script"
arch=('any')
url="https://gitea.artixlinux.org/artixlinux/packages-openrc"
license=('GPL2')
groups=('openrc-galaxy')
depends=('containerd-openrc' 'docker')
provides=('init-docker')
conflicts=('init-docker')
backup=('etc/conf.d/docker')
source=("docker.confd"
        "docker.initd")
sha256sums=('3f661c0032dda93d448f138308b1d70b35ef9297bc43816891bbcd1ab5d7cc5e'
            'd3c20cb1a488d703e00b4f5a36552f320f0afaaf753eb2fb1cae0c1bd7c21f87')

package() {
     install -Dm755 "$srcdir/docker.initd" "$pkgdir/etc/init.d/docker"
     install -Dm644 "$srcdir/docker.confd" "$pkgdir/etc/conf.d/docker"
}
