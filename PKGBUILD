# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: xduugu
# Contributor: nh2
# Contributor: Steven Davidovitz <steviedizzle ð gmail đ com>
# Contributor: Nick B <Shirakawasuna ð gmail đ com>
# Contributor: Christof Musik <christof ð senfdax đ de>
# Contributor: Stefan Rupp <archlinux ð stefanrupp đ de>
# Contributor: Ignas Anikevicius <anikevicius ð gmail đ com>

pkgname=tp_smapi
pkgver=0.44+r10+ga6122c0
pkgrel=1
pkgdesc="Modules for ThinkPad's SMAPI functionality"
url='https://github.com/evgeni/tp_smapi'
arch=(x86_64)
license=('GPL-2.0-only')
makedepends=(
  git
  linux-headers
)
_commit=a6122c0840c36bf232250afd1da30aaedaf24910  # master
source=("git+https://github.com/evgeni/tp_smapi#commit=$_commit")
b2sums=('ece16a811414f4e4b4060a20de0a1c362a7021845deae1255e3d93a429e5631a46fdae1079063ea1a938a3c7022f23ea214e447de9035891f79b653827fdb377')

pkgver() {
  cd tp_smapi
  git describe --tags | sed 's/^tp-smapi\///;s/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd tp_smapi

  # https://bugs.archlinux.org/task/54975 (kernel has no _GLOBAL_OFFSET_TABLE_):
  # Clear EXTRA_CFLAGS since it defaults to injecting CFLAGS and -fno-plt breaks the modules

  make HDAPS=1 KVER="$(</usr/src/linux/version)" EXTRA_CFLAGS=
}

package() {
  depends=('linux')

  local extradir=/usr/lib/modules/$(</usr/src/linux/version)/extramodules
  cd tp_smapi

  find . -name "*.ko" -exec install -Dt "$pkgdir$extradir" {} +
  find "$pkgdir" -name "*.ko" -exec strip --strip-debug {} +
  find "$pkgdir" -name '*.ko' -exec zstd --rm -19 {} +

  # load module on startup
  echo tp_smapi | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}

# vim:set sw=2 sts=-1 et:
