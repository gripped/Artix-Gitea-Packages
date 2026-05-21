# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ekin Dursun <ekindursun@gmail.com>

pkgname=python-mpv
pkgver=1.0.8
pkgrel=2
pkgdesc='Python interface to the awesome mpv media player'
arch=(any)
url=https://github.com/jaseg/python-mpv
license=('GPL-2.0-or-later OR LGPL-2.0-or-later')
depends=(
  mpv
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pyvirtualdisplay
  xorg-server-xvfb
)
optdepends=('python-pillow: for raw screenshot support')
source=("git+$url.git#tag=v$pkgver?signed")
b2sums=('401535f88b7214b6d370d85388f85d95fa4b4d4b72ca772dba94156b1a9dd627a1adb4b3ce657b331ab52de72b41aa83ea7ebe49baa63a63a2b0035d19dffddf')
validpgpkeys=(E36F75307F0A0EC2D145FF5CED7A208EEEC76F2D) # python-mpv Release Signing Key <python-mpv@jaseg.de>
cat <<EOT | gpg --import
-----BEGIN PGP PUBLIC KEY BLOCK-----

mDMEXom49xYJKwYBBAHaRw8BAQdA/KrWMt2MKGIZUvlQZnWjNd6i8/ZYjRsBQqEf
PJ8pJ+20NHB5dGhvbi1tcHYgUmVsZWFzZSBTaWduaW5nIEtleSA8cHl0aG9uLW1w
dkBqYXNlZy5kZT6IlgQTFggAPhYhBONvdTB/Cg7C0UX/XO16II7ux28tBQJeibj3
AhsDBQkSzAMABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEO16II7ux28thRYA
/3Yl1RdeUGor6K0RTxce9TIBB+DpLNupJgB9f6onuocpAQC614zQ/RQ6rkGTHCwA
ElFClWRQ5eppj0jpAuH15udqAbg4BF6JuPcSCisGAQQBl1UBBQEBB0A0mrXSv6rj
ajCmZR4H4OtowAx477YS+yWARqo1NtdgJwMBCAeIfgQYFggAJhYhBONvdTB/Cg7C
0UX/XO16II7ux28tBQJeibj3AhsMBQkSzAMAAAoJEO16II7ux28tMZwBAIUpHHvP
gRW2jQuzdw1r06kItfFk/0t+mgNUQ2+vtbhzAP98BoWx7lv+bvlIbBaVgLldusj0
pHnZI/0y3ksMBkdbBw==
=Mr6G
-----END PGP PUBLIC KEY BLOCK-----
EOT

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  pytest
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.rst
}
