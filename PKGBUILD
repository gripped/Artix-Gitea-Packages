# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=iptables
pkgname=(iptables iptables-nft)
pkgver=1.8.11
pkgrel=1
epoch=1
pkgdesc='Linux kernel packet control tool'
arch=(x86_64)
license=(GPL-2.0-only)
url='https://www.netfilter.org/projects/iptables/index.html'
depends=(libnftnl libpcap libnfnetlink libnetfilter_conntrack bash)
makedepends=(linux-api-headers)
provides=(libip4tc.so libip6tc.so libipq.so libxtables.so)
backup=(etc/ethertypes etc/iptables/{ip,ip6}tables.rules)
source=(https://www.netfilter.org/projects/iptables/files/$pkgbase-$pkgver.tar.xz{,.sig}
        empty.rules simple_firewall.rules empty-{filter,mangle,nat,raw,security}.rules
        iptables-apply-default-path.patch)
sha256sums=('d87303d55ef8c92bcad4dd3f978b26d272013642b029425775f5bad1009fe7b2'
            'SKIP'
            '630d774f089703c2c7370db6d7c188dae25d00c26feaa3d3de8eb52519033948'
            '9e83d7ae39d31881790f814930d44acbaeab1520adb2fb4fcb80f0bbfab174b9'
            '09b90da35c2c8cb0fbda63b300f06d2387a102ca53a40980ef0b49829e249528'
            '92755648f456e235d17a8faeb5f46d27af66eb4db10ea4bac0abd3e35e2dae07'
            '52bd70dff3e1e1a64127ad7ed86840834b79756c3bdb6947b7c6279ffe95dd48'
            '5768a471c0559848635c39d270e456bfa5c43eda65f5f6f666fea2d277183a37'
            '91161a73f323016a9efc5eabd16243d20f8ca2467995cf0eabfb95f845090121'
            '770ceaedce26d05eb1b9d0c4c65f5b8e92facd1dc0652a29c859336d6bc347f6')
validpgpkeys=('C09DB2063F1D7034BA6152ADAB4655A126D292E4'
              '37D964ACC04981C75500FB9BD55D978A8A1420E4'
              '8C5F7146A1757A65E2422A94D70D1A666ACF2B21') # Netfilter Core Team

prepare() {
  mkdir build
  cd $pkgbase-$pkgver

  # use system one
  rm include/linux/types.h

  ln -rs libiptc/linux_list.h include/libiptc

  # use Arch path
  patch -p0 -i ../iptables-apply-default-path.patch
}

build() {
  cd build
  ../$pkgbase-$pkgver/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --enable-bpf-compiler \
    --enable-devel \
    --enable-libipq \
    --enable-shared
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' -i libtool
  make
}

package_iptables() {
  pkgdesc+=' (using legacy interface)'
  _package legacy
}

package_iptables-nft() {
  pkgdesc+=' (using nft interface)'
  depends+=(nftables)
  provides+=(iptables arptables ebtables)
  conflicts=(iptables arptables ebtables)
  backup+=(etc/{arp,eb}tables.conf)

  _package nft

  touch "$pkgdir"/etc/{arp,eb}tables.conf
}

_package() {
  DESTDIR="$pkgdir" make -C build install

  for _x in {arp,eb,ip,ip6}tables{,-restore,-save} iptables-xml; do
    if [[ $1 = nft || $_x = ip* ]]; then
      ln -sf xtables-$1-multi "$pkgdir/usr/bin/$_x"
    else
      rm "$pkgdir/usr/bin/$_x"
    fi
  done

  install -Dm644 empty.rules "$pkgdir/etc/iptables/iptables.rules"
  install -Dm644 empty.rules "$pkgdir/etc/iptables/ip6tables.rules"
  install -Dt "$pkgdir/usr/share/iptables" -m644 *.rules
  ln -srt "$pkgdir/etc/iptables" "$pkgdir"/usr/share/iptables/{empty,simple_firewall}.rules
}

# vim:set sw=2 et:
