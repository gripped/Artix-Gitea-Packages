# Maintainer: capezotte <capezotte@artixlinux.org>

_commit=a1bc48e130f66e489fd60619a386f5f3342b3128
pkgname=( s6-{bash,zsh}-completion )
pkgbase=s6-shell-completion
pkgver=20260827
pkgrel=1
pkgdesc="Shell completion for s6 frontend and s6-rc"
arch=(any)
url="https://github.com/capezotte/s6-shell-completion"
license=('CC0-1.0')
depends=(s6 s6-frontend s6-rc)
makedepends=(git)
source=("git+${url}#commit=${_commit}")
sha256sums=('6da16fe36770f244d9e08f50cfa912c9f05ec146aa05336794888905a991b9b7')

package_s6-bash-completion() {
	pkgdesc+=" (bash)"
	depends+=(bash)

	cd "$pkgbase"
	install -Dm644 bash/s6-rc.bash "$pkgdir/usr/share/bash-completion/completions/s6-rc"
}

package_s6-zsh-completion() {
	local s
	pkgdesc+=" (zsh)"
	depends+=(zsh)

	cd "$pkgbase"
	install -Dm644 -t "$pkgdir/usr/share/zsh/site-functions" zsh/s6-rc/*
}
