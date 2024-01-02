# Maintainer Qontinuum <qontinuum@artixlinux.org>
# Contributor: Nathan <ndowens@artixlinux.org>
# Contributor: linuxer
pkgname=rsm
pkgver=1.4.9
pkgrel=1
pkgdesc="Runit service manager"
arch=(any)
url="https://gitea.artixlinux.org/nikolar/Runit-Service-Manager"
license=('MIT')
depends=('runit')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('85970f02b4467d677708c5dc4579839ab45c577eafac0a3dcdd03b8a349f93fbb24f4eb583e35eabbf2a741965db130b18f9322b90baaa14cc046c2866eefc44')

package() {
  cd "runit-service-manager"
  install -Dm755 rsm -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/rsm"
  install -Dm644 autocompletion/bash/rsm "$pkgdir/usr/share/bash-completion/completions/rsm"
  install -Dm644 autocompletion/zsh/_rsm "$pkgdir/usr/share/zsh/site-functions/_rsm"
}
