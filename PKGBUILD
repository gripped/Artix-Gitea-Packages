# Maintainer: David Runge <dvzrv@archlinux.org>

pkgbase=refind
pkgname=(refind refind-docs)
pkgver=0.14.1
pkgrel=1
pkgdesc="An EFI boot manager"
arch=(x86_64)  # we build architecture-specific EFI binaries
url="https://www.rodsbooks.com/refind/"
makedepends=(
  bash
  dosfstools
  efibootmgr
  gnu-efi
)
source=(https://sourceforge.net/projects/refind/files/$pkgver/$pkgname-src-$pkgver.tar.gz)
sha512sums=('25f420970ae00d9f9b9deb52fea8f9b8307a2de15f921eaae17713e522b6fe932cf1ac5db3006e3cee82670ba67d03039987289cd1de18f1e57f743f98d983c7')
b2sums=('35168bfc2c8db8335156c3a85cd2f6579881514368353b879efeea4697cb77b66796650a17bd931b93544a8fcac16917bfe08b822ec5aac6c4a61550f6543391')
_arch='x64'

prepare() {
  cd $pkgbase-$pkgver
  # remove the path prefix from the css reference, so that the css can live
  # in the same directory
  sed -e 's|../Styles/||g' -i docs/$pkgbase/*.html
  # hardcode RefindDir, so that refind-install can find refind_x64.efi
  sed -e 's|RefindDir=\"\$ThisDir/refind\"|RefindDir="/usr/share/refind/"|g' -i refind-install
  # add vendor line to the sbat file
  printf 'refind.%s,%s,%s,refind,%s,%s\n' 'artix' '1' 'Artix Linux' "${epoch:+${epoch}:}${pkgver}-${pkgrel}" 'https://gitea.artixlinux.org/packages/refind' >> refind-sbat.csv
}

build() {
  cd $pkgname-$pkgver
  make
  make gptsync
  make fs
}

package_refind() {
  license=(
    BSD-2-Clause
    CC-BY-SA-3.0
    CC-BY-SA-4.0
    GPL-2.0-only
    GPL-2.0-or-later
    GPL-3.0-or-later
    LGPL-2.1-or-later
    'LGPL-3.0-or-later OR CC-BY-SA-3.0'
  )
  depends=(
    bash
    dosfstools
    efibootmgr
  )
  optdepends=(
    'gptfdisk: for finding non-vfat ESP with refind-install'
    'imagemagick: for refind-mkfont'
    'openssl: for generating local certificates with refind-install'
    'python: for refind-mkdefault'
    'refind-docs: for HTML documentation'
    'sbsigntools: for EFI binary signing with refind-install'
    'sudo: for privilege elevation in refind-install and refind-mkdefault'
  )

  cd $pkgbase-$pkgver
  # NOTE: the install target calls refind-install, therefore we install things
  # manually
  # efi binaries
  install -vDm 644 refind/*.efi -t "$pkgdir/usr/share/$pkgname/"
  install -vDm 644 drivers_*/*.efi -t "$pkgdir/usr/share/refind/drivers_$_arch/"
  install -vDm 644 gptsync/*.efi -t "$pkgdir/usr/share/$pkgname/tools_$_arch/"
  # sample config
  install -vDm 644 $pkgname.conf-sample -t "$pkgdir/usr/share/$pkgname/"
  # keys
  install -vDm 644 keys/*{cer,crt} -t "$pkgdir/usr/share/$pkgname/keys/"
  # keysdir
  install -vdm 700 "$pkgdir/etc/refind.d/keys"
  # fonts
  install -vDm 644 fonts/*.png -t "$pkgdir/usr/share/$pkgname/fonts/"
  # icons
  install -vDm 644 icons/*.png -t "$pkgdir/usr/share/$pkgname/icons"
  install -vDm 644 icons/svg/*.svg -t "$pkgdir/usr/share/$pkgname/icons/svg/"
  # scripts
  install -vDm 755 {refind-{install,mkdefault,sb-healthcheck},mkrlconf,mvrefind} -t "$pkgdir/usr/bin/"
  install -vDm 755 fonts/mkfont.sh "$pkgdir/usr/bin/$pkgname-mkfont"
  # man pages
  install -vDm 644 docs/man/*.8 -t "$pkgdir/usr/share/man/man8/"
  # docs
  install -vDm 644 {CREDITS,NEWS,README}.txt -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 fonts/README.txt "$pkgdir/usr/share/doc/$pkgname/README.$pkgname-mkfont.txt"
  install -vDm 644 icons/README "$pkgdir/usr/share/doc/$pkgname/README.icons.txt"
  install -vDm 644 keys/README.txt "$pkgdir/usr/share/doc/$pkgname/README.keys.txt"
  # license
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_refind-docs() {
  pkgdesc+=" - documentation"
  license=(FDL-1.3-or-later)

  cd $pkgbase-$pkgver
  install -vDm 644 docs/$pkgbase/*.{html,png,svg,txt} -t "$pkgdir/usr/share/doc/$pkgbase/html/"
  install -vDm 644 docs/Styles/*.css -t "$pkgdir/usr/share/doc/$pkgbase/html/"
  install -vDm 644 images/$pkgbase-banner.{png,svg} -t "$pkgdir/usr/share/doc/$pkgbase/html/"
}
