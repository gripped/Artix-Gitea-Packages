# Maintainer: capezotte <capezotte@artixlinux.org>

_commit=d2592c8782a850964c307a0d1357482017f7ce3f
pkgname=s6-fish-completion
pkgver=20260731
pkgrel=2
pkgdesc="Shell completion for s6 frontend and s6-rc (fish)"
arch=(any)
url="https://git.informatics.coop/nix/slam"
license=('LicenseRef-PPL')
depends=(s6 s6-frontend s6-rc fish)
makedepends=(git pkg-config)
source=("git+${url}#commit=${_commit}")
sha256sums=('2535d4084f387e59347ac08a8fbd5201cb3b35b63d2ad7e48df641c3788f9f40')

package() {
	cd slam
	install -Dm644 -t "$pkgdir/$(pkg-config --variable completionsdir fish)" pkgs/by-name/s6-*/completions/*.fish
}
