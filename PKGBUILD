# Maintainer Qontinuum <qontinuum@artixlinux.org>
# Contributor: Nathan <ndowens@artixlinux.org>
# Contributor: linuxer
pkgname=rsm
pkgver=1.4.8
pkgrel=1
pkgdesc="Runit service manager"
arch=(any)
url="https://gitea.artixlinux.org/nikolar/Runit-Service-Manager"
license=('MIT')
depends=('runit')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('e896f332d8f0fca5b92a718a73aa23fc8f90505a7c92c098685778adbe9ead5d804635a10b11934f9eab6e6684d9f536179c980b6130d2b9ff7546d48da213d4')

package() {
  cd "runit-service-manager"
  install -Dm755 rsm -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/rsm"
  install -Dm644 autocompletion/bash/rsm "$pkgdir/usr/share/bash-completion/completions/rsm"
  install -Dm644 autocompletion/zsh/_rsm "$pkgdir/usr/share/zsh/site-functions/_rsm"
}
