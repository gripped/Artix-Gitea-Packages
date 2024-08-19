# Maintainer: artist for Artix Linux

pkgname=moksha-help
pkgver=0.0.2
pkgrel=1.5
pkgdesc="Help for Moksha"
arch=('any')
url="https://wiki.artixlinux.org/Site/MokshaDesktopForArtix"
makedepends=('unzip')
#depends=('moksha')
source=("bodhi7packages.zip::https://github.com/BodhiDev/bodhi7packages/archive/refs/heads/main.zip"
        "moksha-help"
        "moksha-help.desktop"
        "moksha-quickstart.desktop")
noextract=('bodhi7packages.zip')

package() {
  cd "$srcdir"
  install -Dm755 -t "${pkgdir}/usr/bin" moksha-help
  install -Dm644 -t "${pkgdir}/usr/share/applications" moksha-help.desktop
  install -Dm644 -t "${pkgdir}/usr/share/applications" moksha-quickstart.desktop
  install -dm755 "${pkgdir}/usr/share/moksha-help"

  _mfile="moksha.html"
  unzip -q bodhi7packages.zip bodhi7packages-main/bodhi/bodhi-quickstart/usr/share/bodhi/quickstart/quickstart*/$_mfile
  unzip -q bodhi7packages.zip bodhi7packages-main/bodhi/bodhi-quickstart/usr/share/bodhi/quickstart/quickstart*/everything.html

  for f in styles.css qs.css ie.css text.css images.css sizes.css
    do
      unzip -q bodhi7packages.zip bodhi7packages-main/bodhi/bodhi-quickstart/usr/share/bodhi/quickstart/QuickStart_files/$f
    done

  for f in favicon.png modules.png gadgets.png lx-shading.png everything1.png desktops.png mainmenu.png shelves.png
    do
      unzip -q bodhi7packages.zip bodhi7packages-main/bodhi/bodhi-quickstart/usr/share/bodhi/quickstart/images/$f
    done

  cd bodhi7packages-main/bodhi/bodhi-quickstart/usr/share/bodhi/quickstart
  for d in quickstart*
    do
      cd $d
      sed -i '/bodhilinux.png/d' $_mfile
      sed -i 's/Terminology is currently the default terminal in Bodhi/Terminology is provided by the optional terminology package/' $_mfile
      sed -i 's/Bodhi/Moksha/' $_mfile
      sed -i 's/the Bodhi AppCenter, Synaptic Package Manager or terminal./pacman/' $_mfile
      sed -i '/<header class="gradient">/,/<\/header>/d' $_mfile
      sed -i '/<!-- End of Body -->/,/<\/html>/d' $_mfile
      echo "      <div>" >> $_mfile
      sed '/<!DOCTYPE html>/,/<div class="content">/d' everything.html >> $_mfile
      _str0="$(grep 'https://www.bodhilinux.com/w/key-bindings-and-edge-bindings/' $_mfile)"
      _str1="$(echo $_str0 | cut -f2 -d '<')"
      _str2="$(echo $_str1 | sed -r 's/(\s+\S+)\s*$/ Bodhi /')"
      sed -i "s|$_str1|$_str2|" $_mfile
      cd ..
    done

  rm quickstart*/everything.html
  cd ..
  cp -r quickstart ${pkgdir}/usr/share/${pkgname}/

  cd $srcdir
  unzip -q -j $srcdir/bodhi7packages.zip bodhi7packages-main/bodhi/bodhi-quickstart/usr/share/doc/bodhi-quickstart/copyright
}
sha256sums=('855c23f21a6573885510b34c7dbee1364b4432b66f57aa08f3dc7486dd81c856'
            'f293fb4d621ff504531fe9cd4d8ff7439d7d47e5a73278af0726448da05c979a'
            '51edeafebc211b453dfb26c0f0c518177b33a52df884c5610817532e4e48315f'
            'f025bbf2e63fd664c3280b23a223867c881ef630c6c9b683b793da440de7eb1d')

