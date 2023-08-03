# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
pkgname=dracut
pkgver=059
pkgrel=3
pkgdesc="An event driven initramfs infrastructure"
arch=('x86_64')
url="https://github.com/dracutdevs/dracut"
license=('GPL')
depends=('bash' 'coreutils' 'cpio' 'filesystem' 'findutils' 'grep' 'gzip'
         'kmod' 'pkgconf' 'procps-ng' 'sed' 'udev' 'util-linux' 'xz')
makedepends=('asciidoc' 'bash-completion' 'git')
optdepends=('binutils: --uefi option support'
            'elfutils: strip binaries to reduce initramfs size'
            'multipath-tools: dmraid dracut module support'
            'pigz: faster gzip compression'
            'sbsigntools: uefi_secureboot_cert/key configuration option support')
provides=('initramfs')
backup=('etc/dracut.conf')
source=("${pkgname}-${pkgver}::git+${url}#tag=${pkgver}?signed"
        artix.conf
        union-join.patch::https://gitea.artixlinux.org/artix/dracut/commit/21c9afce4377a50864530d689cc1892bc751799e.patch
        dracut-{install,remove}.script
        90-dracut-install.hook
        60-dracut-remove.hook)
sha512sums=('SKIP'
            'cdb3aa63d834b0b3a1eb73b7579b2e36c188d66bc8534947830a2358aa6c59bdf4d02119015085ee1208c845945ebf99bb86a0b64a06591eb569aad49f778555'
            '1ac0ffd15f02e09744db273e5fcd1d7159fcd00bb3093aeb7149c78f2ae3b5a00e2f0179bc37a9ba5ef761db3263c5a6897fc05af535f0251542137afdeef8db'
            '80d22d68a29062fdd97256cdd15b1363045667b1de2168806e14bd77a65e58900c9ce06fa322364ac6a0f45e819e3abc300670cb19cbbcf8dcdfa213d1d9d7b7'
            'ac82fa81a8bcb7388890580786c3ca98e09a3314e478f204a9e140a3af235d97e5ba8407fbd27385a482e04714f46a299fb498035b19527e6b867da4a088a8c1'
            '8333619d495e6694f795a1f05492f11686da68c08763a8d285a78eb6d5e895af7925687297bf8cbd03ed2e88b89efc71976631fb4da8069230fd1ccf40b7ed9c'
            '5065a022c4f65fdec44ad0febb06273b73f397af0dfdf5ddb34ad9a08b60c61aa0450551b6c394e41d894a5552fff3daef846199a45da22cf8750e5553285664')
b2sums=('SKIP'
        'd2fc5ca844264ecf345f926c77f00ce3f38e44337efe053e588eeb82da36c595f1b4b6157593d90a14910f8422e36ed7f9664952e00c35120b636bc612790a6b'
        'd9a2f674ee22d8f3a46065220b97f4312b646edeb2efcdd081966edbeafd13d058c6133b808140c8e263d0583d1c804a33a61aafc117385527efe6c4fc937b4a'
        '8bb8fd1f29cb97da17ef6f9cfedfedd3b2c20e009a9fa1f22d029134c069b01087f716aaac2598d1187d251ac19d2f3aa72324fc9d657246df98217ae3c59da7'
        'bf47aff6d2b5210eeebdcaa7b784a1388255b9d22d85ad15519d65b0018234dc1fb6dabe21ead7e98a7ba8004871290a213d5a0f18543047e169d87e74e28f98'
        '21ae87c112baf0a7a72b8e3632dcfd2fd03aabb8cca982e6dd4e0d58574bedf5840899ab8afb16a9047e03ee747a86ab03d40b3dee12134d043af7c009fffb54'
        '3a696631a18223fbd5e5c3d0d6c41134758c0099e1703e12e3e505635df2596798fdcbb391c15907d7967eb4ff89f1e36de338e1518b011679858fd4849d491a')
validpgpkeys=('F66745589DE755B02AD947D71F1139EBBED1ACA9') # Jóhann B. Guðmundsson <johannbg@gmail.com>

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    patch -Np1 -i ../union-join.patch
}

build() {
  local prefix=/usr sysconfdir=/etc
  
  cd "$srcdir/${pkgname}-${pkgver}"

  ./configure \
    --sysconfdir=${sysconfdir} \
    --prefix=${prefix} \
    --libdir=${prefix}/lib \
    --systemdsystemunitdir=no \
    --bashcompletiondir=$(pkg-config --variable=completionsdir bash-completion)
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  DESTDIR="$pkgdir" make install
  install -Dm 755 $srcdir/artix.conf $pkgdir/etc/dracut.conf.d/01-artix.conf

  # pacman hooks
  install -Dm755 "${srcdir}"/dracut-install.script "${pkgdir}"/usr/share/libalpm/scripts/dracut-install
  install -Dm755 "${srcdir}"/dracut-remove.script "${pkgdir}"/usr/share/libalpm/scripts/dracut-remove
  install -Dm644 -t "${pkgdir}"/usr/share/libalpm/hooks "${srcdir}"/*.hook
}
