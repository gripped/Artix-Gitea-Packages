# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>

pkgbase=bluez
pkgname=('bluez' 'bluez-utils' 'bluez-libs' 'bluez-cups' 'bluez-deprecated-tools' 'bluez-hid2hci' 'bluez-mesh' 'bluez-obex')
pkgver=5.84
pkgrel=1
url="http://www.bluez.org/"
arch=('x86_64')
license=('GPL-2.0-only')
makedepends=('dbus' 'libical' 'alsa-lib' 'json-c' 'ell' 'python-docutils' 'python-pygments' 'cups')
source=(https://www.kernel.org/pub/linux/bluetooth/${pkgname}-${pkgver}.tar.{xz,sign}
        bluetooth.modprobe)
# see https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
sha256sums=('5ba73d030f7b00087d67800b0e321601aec0f892827c72e5a2c8390d8c886b11'
            'SKIP'
            '46c021be659c9a1c4e55afd04df0c059af1f3d98a96338236412e449bf7477b4')
validpgpkeys=('E932D120BC2AEC444E558F0106CA9F5D1DCF2659') # Marcel Holtmann <marcel@holtmann.org>

prepare() {
  # Remove the vendored ell to avoid conflicts in header search paths
  rm -r "${pkgname}-${pkgver}"/ell
}

build() {
  cd "${pkgname}"-${pkgver}
  ./configure \
          --prefix=/usr \
          --mandir=/usr/share/man \
          --sysconfdir=/etc \
          --localstatedir=/var \
          --libexecdir=/usr/lib \
          --with-dbusconfdir=/usr/share \
          --with-udevdir=/usr/lib/udev \
          --disable-systemd \
          --enable-btpclient \
          --enable-midi \
          --enable-sixaxis \
          --enable-mesh \
          --enable-hid2hci \
          --enable-experimental \
          --enable-datafiles \
          --enable-external-ell \
          --enable-library --enable-deprecated # libraries and these tools are deprecated
  make

  # fake installation to be seperated into packages
  make DESTDIR="${srcdir}/fakeinstall" install

  # add missing tools FS#41132, FS#41687, FS#42716
  for files in `find tools/ -type f -perm -755`; do
    filename=$(basename $files)
    install -Dm755 "${srcdir}"/"${pkgbase}"-${pkgver}/tools/$filename "${srcdir}/fakeinstall"/usr/bin/$filename
  done
}

_install() {
  local src f dir
  for src; do
    f="${src#fakeinstall/}"
    dir="${pkgdir}/${f%/*}"
    install -m755 -d "${dir}"
    # use copy so a new file is created and fakeroot can track properties such as setuid
    cp -av "${src}" "${dir}/"
    rm -rf "${src}"
  done
}

check() {
  cd "$pkgname"-$pkgver
  # fails test-vcp due to lto - https://github.com/bluez/bluez/issues/683
  make check || /bin/true
}


package_bluez() {
  pkgdesc="Daemons for the bluetooth protocol stack"
  depends=('dbus' 'glib2' 'alsa-lib' 'glibc')
  backup=(etc/bluetooth/{main,input,network}.conf)

  _install fakeinstall/usr/lib/bluetooth/bluetoothd
  _install fakeinstall/usr/share/dbus-1/system.d/bluetooth.conf
  _install fakeinstall/usr/share/man/man8/bluetoothd.8

  # ship upstream main config files
  install -dm555 "${pkgdir}"/etc/bluetooth
  install -Dm644 "${srcdir}"/"${pkgbase}"-${pkgver}/src/main.conf "${pkgdir}"/etc/bluetooth/main.conf
  install -Dm644 "${srcdir}"/"${pkgbase}"-${pkgver}/profiles/input/input.conf "${pkgdir}"/etc/bluetooth/input.conf
  install -Dm644 "${srcdir}"/"${pkgbase}"-${pkgver}/profiles/network/network.conf "${pkgdir}"/etc/bluetooth/network.conf

  # bluetooth.service wants ConfigurationDirectoryMode=0555
  chmod -v 555 "${pkgdir}"/etc/bluetooth

  # add basic documention
  install -dm755 "${pkgdir}"/usr/share/doc/"${pkgbase}"/dbus-apis
  cp -a "${pkgbase}"-${pkgver}/doc/*.txt "${pkgdir}"/usr/share/doc/"${pkgbase}"/dbus-apis/
  # fix module loading errors
  install -dm755 "${pkgdir}"/usr/lib/modprobe.d
  install -Dm644 "${srcdir}"/bluetooth.modprobe "${pkgdir}"/usr/lib/modprobe.d/bluetooth-usb.conf
  # load module at system start required by some functions
  # https://bugzilla.kernel.org/show_bug.cgi?id=196621
  install -dm755 "$pkgdir"/usr/lib/modules-load.d
  echo "crypto_user" > "$pkgdir"/usr/lib/modules-load.d/bluez.conf
}

package_bluez-utils() {
  pkgdesc="Development and debugging utilities for the bluetooth protocol stack"
  depends=('dbus' 'glib2' 'glibc' 'readline')
  optdepends=('ell: for btpclient')
  provides=('bluez-plugins')
  replaces=('bluez-plugins')

  _install fakeinstall/usr/bin/{advtest,avinfo,avtest,bcmfw,bdaddr,bluemoon,bluetoothctl,bluetooth-player,bneptest,btattach,btconfig,btgatt-client,btgatt-server,btinfo,btiotest,btmgmt,btmon,btpclient,btpclientctl,btproxy,btsnoop,check-selftest,cltest,create-image,eddystone,gatt-service,hcieventmask,hcisecfilter,hex2hcd,hid2hci,hwdb,ibeacon,isotest,l2ping,l2test,mcaptest,mpris-proxy,nokfw,oobtest,rctest,rtlfw,scotest,seq2bseq,test-runner}
  _install fakeinstall/usr/share/man/man1/bluetoothctl*.1
  _install fakeinstall/usr/share/man/man1/{btattach,btmgmt,btmon,isotest,l2ping,rctest}.1
  _install fakeinstall/usr/share/man/man5/org.bluez.{A,B,D,G,I,L,M,N,P}*.5
  _install fakeinstall/usr/share/man/man7/{hci,l2cap,mgmt,sco,iso}.7
  _install fakeinstall/usr/share/zsh/site-functions/_bluetoothctl
}

package_bluez-deprecated-tools() {
  pkgdesc="Deprecated tools that are no longer maintained"
  depends=('json-c' 'glib2' 'dbus' 'readline' 'glibc')

  _install fakeinstall/usr/bin/{ciptool,hciattach,hciconfig,hcidump,hcitool,meshctl,rfcomm,sdptool}
  _install fakeinstall/usr/share/man/man1/{ciptool,hciattach,hciconfig,hcidump,hcitool,rfcomm,sdptool}.1
  _install fakeinstall/usr/share/man/man7/rfcomm.7
}

package_bluez-libs() {
  pkgdesc="Deprecated libraries for the bluetooth protocol stack"
  depends=('glibc')
  provides=('libbluetooth.so')
  license=('LGPL-2.1-only')

  _install fakeinstall/usr/include/bluetooth/*
  _install fakeinstall/usr/lib/libbluetooth.so*
  _install fakeinstall/usr/lib/pkgconfig/*
}

package_bluez-cups() {
  pkgdesc="CUPS printer backend for Bluetooth printers"
  depends=('cups' 'glib2' 'glibc' 'dbus')

  _install fakeinstall/usr/lib/cups/backend/bluetooth
}

package_bluez-hid2hci() {
  pkgdesc="Put HID proxying bluetooth HCI's into HCI mode"
  depends=('glibc')

  _install fakeinstall/usr/lib/udev/*
  _install fakeinstall/usr/share/man/man1/hid2hci.1
}

package_bluez-mesh() {
  pkgdesc="Services for bluetooth mesh"
  depends=('ell' 'json-c' 'readline' 'glibc')
  backup=('etc/bluetooth/mesh-main.conf')

  _install fakeinstall/usr/bin/{mesh-cfgclient,mesh-cfgtest}
  _install fakeinstall/usr/lib/bluetooth/bluetooth-meshd
  _install fakeinstall/usr/share/dbus-1/system.d/bluetooth-mesh.conf
  _install fakeinstall/usr/share/man/man8/bluetooth-meshd.8

  # ship upstream mesh config file
  install -dm555 "${pkgdir}"/etc/bluetooth
  install -Dm644 "${srcdir}"/"${pkgbase}"-${pkgver}/mesh/mesh-main.conf "${pkgdir}"/etc/bluetooth/mesh-main.conf
}

package_bluez-obex() {
  pkgdesc="Object Exchange daemon for sharing content"
  depends=('glib2' 'libical' 'dbus' 'readline' 'glibc')

  _install fakeinstall/usr/bin/{obexctl,obex-client-tool,obex-server-tool}
  _install fakeinstall/usr/lib/bluetooth/obexd
  _install fakeinstall/usr/share/dbus-1/system.d/obex.conf
  _install fakeinstall/usr/share/man/man5/org.bluez.obex*.5  

  # Installs dbus service
  install -Dm644 /dev/stdin "$pkgdir"/usr/share/dbus-1/services/org.bluez.obex.service <<EOF
[D-BUS Service]
Name=org.bluez.obex
Exec=/usr/lib/bluetooth/obexd
EOF
}
