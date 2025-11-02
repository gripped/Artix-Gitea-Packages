# Maintainer: artist for Artix Linux

_pkgname=lxdm
pkgname=$_pkgname-gtk2
pkgver=0.5.3
pkgrel=9
pkgdesc='Lightweight X11 Display Manager'
arch=('x86_64')
url="https://lxde.org/"
license=('GPL')
depends=('gtk2' 'lightdm-slick-greeter')
makedepends=('intltool' 'iso-codes')
conflicts=($_pkgname)
provides=($_pkgname)
groups=('lxde-gtk2')
optdepends=('iso-codes: show language names in language chooser')
backup=('etc/lxdm/lxdm.conf' 'etc/pam.d/lxdm' 'etc/lxdm/Xsession'
        'etc/lxdm/PreLogin' 'etc/lxdm/LoginReady' 'etc/lxdm/PostLogin'
        'etc/lxdm/PostLogout' 'etc/lxdm/PreReboot' 'etc/lxdm/PreShutdown')
source=(https://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz
        set-path.patch
        git-fixes.patch
        default-config.patch
        lxdm.pam
        Xsession)
sha256sums=('4891efee81c72a400cc6703e40aa76f3f3853833d048b72ec805da0f93567f2f'
            '328f766c4d2ee899fc37a26f6e8666d40ebeaa3bd4c7d5a474ebb5415351a440'
            'ca3b225fb85a4e87ebb48e2b1a20f4bab86bf619a9ad927f08fdc819bc435bb4'
            'ea5fbe021b98ec58de8f2ba9a3575f748024bad2a9b911179a44bf94577f869b'
            'e8c4c5fd3b801a390d201166fd1fb9730e78a5c62928768103b870b6bd980ea0'
            'a02f547e1c36f1c7dd2a1f942b620fe76445d561f7835e7fef434aa4c12c6967')

prepare(){
  cd $_pkgname-$pkgver

  # Don't overwrite PATH if already defined
  # https://sourceforge.net/p/lxde/bugs/907/
  patch -Np0 -i ../set-path.patch

  # Apply fixes from git
  patch -Np1 -i ../git-fixes.patch

  # Adjust Arch-specific settings
  patch -Np1 -i ../default-config.patch

  # Use our custom pam and Xsession files
  cp ../lxdm.pam pam/lxdm
  cp ../Xsession data/Xsession

  autoreconf -fi
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib/lxdm \
              --sysconfdir=/etc --localstatedir=/var --enable-gtk2
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  chmod 644 "$pkgdir/etc/lxdm/lxdm.conf"

  # Setup system user and group
  install -dm755 "$pkgdir"/usr/lib/{sysusers,tmpfiles}.d
  echo 'u lxdm - "Lightweight X11 Display Manager" /var/lib/lxdm' > "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  echo 'd /var/lib/lxdm 0700 lxdm lxdm - -' > "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}

