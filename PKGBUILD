# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>
# Contributor: Asterios Dimitriou <asterios@pci.gr>
# Contributor: Benjamin Asbach <archlinux-aur.lxd@impl.it>
# Contributer: nightuser <nightuser.android at gmail.com>

pkgname=lxd
pkgver=6.5
pkgrel=1
pkgdesc="Daemon based on liblxc offering a REST API to manage containers"
arch=('x86_64')
url="https://ubuntu.com/lxd"
license=('AGPL-3.0-only')
depends=('lxc' 'lxcfs' 'squashfs-tools' 'dnsmasq' 'dqlite' 'libuv' 'ebtables' 'sqlite' 'libcap' 'acl')
makedepends=('go' 'git' 'tcl' 'apparmor' 'libseccomp' 'udev')
optdepends=(
    'lvm2: lvm2 support'
    'thin-provisioning-tools: thin provisioning support'
    'btrfs-progs: btrfs storage driver support'
    'minio: storage buckets support'
    'cdrtools: VM support'
    'qemu: VM support'
    'edk2-ovmf: VM support'
    'libudev: unix device hotplug support'
    'apparmor: apparmor support'
)
# options=('!debug')
source=("https://github.com/canonical/lxd/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc}
        "lxd.sysusers")
validpgpkeys=('602F567663E593BCBD14F338C638974D64792D67'  # Stéphane Graber <stgraber@stgraber.org>
              'ED1CA1E7A6F80E22E5CB2DA84ACE106615754614') # Thomas Parrott <tomp@tomp.uk>
sha256sums=('f5a0b8a4eb6cb259497bc5587c09d080193cc908a2696d54e071863d2a14c9cc'
            'SKIP'
            'd0184d9c4bb485e3aad0d4ac25ea7e85ac0f7ed6ddc96333e74fcd393a5b5ec4')

prepare() {
  cd "$pkgname-$pkgver"

  mkdir bin
  go mod verify
}

build() {
  cd "$pkgname-$pkgver"

  export GOFLAGS="-buildmode=pie -trimpath"
  export CGO_LDFLAGS_ALLOW="-Wl,-z,now"

  CGO_LDFLAGS="-static" go build -v -tags "agent" -o bin/ ./lxd-agent/...

  go build -v -tags "netgo" -o bin/ ./lxd-migrate/...
  for tool in fuidshift lxc lxd lxd-benchmark lxd-user; do
    go build -v -tags "libsqlite3" -o bin/ ./$tool/...
  done
}

package() {
  cd "$pkgname-$pkgver"

  for tool in fuidshift lxc lxd lxd-agent lxd-benchmark lxd-migrate lxd-user; do
    install -v -p -Dm755 "bin/$tool" "${pkgdir}/usr/bin/$tool"
  done

  # Package license
  install -v -Dm644 "COPYING"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  # udev files
  install -v -Dm644 "${srcdir}/$pkgname.sysusers" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"

  # logs
  install -v -dm700 "${pkgdir}/var/log/lxd"

  # documentation
  install -d "${pkgdir}/usr/share/doc/lxd/"
  rm -rf doc/html
  cp -vr doc/* "${pkgdir}/usr/share/doc/lxd/"

	./bin/lxc completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/lxc"
	./bin/lxc completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_lxc"
	./bin/lxc completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/lxc.fish"
}

# vim:set ts=2 sw=2 et:
