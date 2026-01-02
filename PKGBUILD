# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Frederik Schwan <freswa@archlinux.org>
pkgname=dracut
pkgver=109
pkgrel=1
pkgdesc="An event driven initramfs infrastructure"
arch=('x86_64')
url="https://github.com/dracut-ng/dracut-ng"
license=('GPL-2.0-or-later')
depends=(
  'bash'
  'coreutils'
  'cpio'
  'filesystem'
  'findutils'
  'gawk'
  'grep'
  'kmod'
  'pkgconf'
  'procps-ng'
  'sed'
  'udev'
  'util-linux'
)
makedepends=(
  'asciidoctor'
  'bash-completion'
  'git'
  'rust'
)
optdepends=(
  'binutils: --uefi option support'
  'bluez: bluetooth (keyboard)'
  'btrfs-progs: scan for Btrfs on block devices'
  'busybox: allows use of busybox (on your own risk)'
  'bzip2: bzip2 compression'
  'cifs-utils: support CIFS'
  'connman: support for connman networking'
  'cryptsetup: support for encrypted with LUKS filesystems'
  'dash: allows use of dash (on your own risk)'
  'dhclient: legacy networking support'
  'dmraid: dmraid dracut module support'
  'e2fsprogs: ext2/3/4 filesystem support'
  'elfutils: strip binaries to reduce initramfs size'
  'f2fs-tools: fsfs filesystem support'
  'fuse3: live on NTFS (dmsquash-live-ntfs module)'
  'gzip: gzip compression'
  'iproute2: legacy networking support'
  'iputils: networking support'
  'lvm2: support Logical Volume Manager'
  'lzop: lzop compression'
  'mdadm: support MD devices, also known as software RAID devices'
  'memstrack: memstrack module support'
  'nbd: support network block devices'
  'ndctl: NVDIMM support'
  'networkmanager: networkmanager support'
  'nfs-utils: support NFS'
  'ntfs-3g: live on NTFS (dmsquash-live-ntfs module)'
  'nvme-cli: NVMe-oF support (nvmf module)'
  'open-iscsi: support iSCSI (iscsi module)'
  'openssh: install ssh and scp along with config files and specified keys (ssh-client module)'
  'pigz: faster gzip compression'
  'plymouth: plymouth boot splash'
  'rng-tools: enable rngd service to help generating entropy early during boot'
  'sbsigntools: uefi_secureboot_cert/key configuration option support'
  'squashfs-tools: support for building a squashed initramfs'
  'tar: live tar image'
  'tpm2-tools: tpm2 support for e.g. LUKS'
  'xz: xz compression'
)
provides=('initramfs')
backup=('etc/dracut.conf')
source=(
  "${pkgname}-${pkgver}::git+${url}#tag=${pkgver}"

  artix.conf
  union-join.patch::https://gitea.artixlinux.org/artix/dracut/commit/21c9afce4377a50864530d689cc1892bc751799e.patch
  dracut-{install,remove}.script
  90-dracut-install.hook
  60-dracut-remove.hook)
sha512sums=('b016fbb547ea66739b1295f5e8a04b843555b601962a7d0d807016205bc3516b0431268eac85aa6b32bfebd5743a02b515fe0b330ec8c44d767e3da79889ef19'
            'cdb3aa63d834b0b3a1eb73b7579b2e36c188d66bc8534947830a2358aa6c59bdf4d02119015085ee1208c845945ebf99bb86a0b64a06591eb569aad49f778555'
            '1ac0ffd15f02e09744db273e5fcd1d7159fcd00bb3093aeb7149c78f2ae3b5a00e2f0179bc37a9ba5ef761db3263c5a6897fc05af535f0251542137afdeef8db'
            '0f91f0d4378fd9f67f1fd05080aa013b65ce48661aad4ffc07e090dee88ee789daddfa85393c49e8fd5e2ea82bf00ac482fef71523198336750bef59508408d2'
            'ed249af85fd15b79299e99b9b587fe962158d803cc1365d903a6202331cc0befaa309e36d4922bd859824295cd023bd75f959f5ad783d230550f6ce371baac67'
            '8333619d495e6694f795a1f05492f11686da68c08763a8d285a78eb6d5e895af7925687297bf8cbd03ed2e88b89efc71976631fb4da8069230fd1ccf40b7ed9c'
            '5065a022c4f65fdec44ad0febb06273b73f397af0dfdf5ddb34ad9a08b60c61aa0450551b6c394e41d894a5552fff3daef846199a45da22cf8750e5553285664')
b2sums=('03523bc15025cfa043a6ba84b5cbe36c63902b43423433070fd37f5cd1c8a276b60594160c6467c7553e79c3cce3b2afffc1728cc110fc918b5ae72870acbe9d'
        'd2fc5ca844264ecf345f926c77f00ce3f38e44337efe053e588eeb82da36c595f1b4b6157593d90a14910f8422e36ed7f9664952e00c35120b636bc612790a6b'
        'd9a2f674ee22d8f3a46065220b97f4312b646edeb2efcdd081966edbeafd13d058c6133b808140c8e263d0583d1c804a33a61aafc117385527efe6c4fc937b4a'
        '5468c20cd1d723509bf1d79dd5691d5e81eb19bc2e506c77eb8ee39b1b93ae195a34bb1e24a1db6a844b43999859491a3bf3c84dbef12b19a41d10a10ee8465c'
        '06e6ef68f1116d348ce4f11960a9b583af703b93ae0172c5d3d237dcdd4ca4614f2cb0f761ff12079b8c40f349e39d096ed404dee38732d4cc704e8af7ca23f1'
        '21ae87c112baf0a7a72b8e3632dcfd2fd03aabb8cca982e6dd4e0d58574bedf5840899ab8afb16a9047e03ee747a86ab03d40b3dee12134d043af7c009fffb54'
        '3a696631a18223fbd5e5c3d0d6c41134758c0099e1703e12e3e505635df2596798fdcbb391c15907d7967eb4ff89f1e36de338e1518b011679858fd4849d491a')

build() {
  local prefix=/usr sysconfdir=/etc

  cd ${pkgname}-${pkgver}

  ./configure \
    --sysconfdir=${sysconfdir} \
    --prefix=${prefix} \
    --libdir=${prefix}/lib \
    --systemdsystemunitdir=no \
    --bashcompletiondir=$(pkg-config --variable=completionsdir bash-completion) \
    --enable-dracut-cpio
  make
}

package() {
  cd ${pkgname}-${pkgver}

  DESTDIR="$pkgdir" make install

  install -Dm 755 $srcdir/artix.conf $pkgdir/etc/dracut.conf.d/01-artix.conf

  # pacman hooks
  install -Dm755 "${srcdir}"/dracut-install.script "${pkgdir}"/usr/share/libalpm/scripts/dracut-install
  install -Dm755 "${srcdir}"/dracut-remove.script "${pkgdir}"/usr/share/libalpm/scripts/dracut-remove
  install -Dm644 -t "${pkgdir}"/usr/share/libalpm/hooks "${srcdir}"/*.hook
}

