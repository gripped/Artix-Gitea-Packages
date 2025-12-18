# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

_pkgbase=systemd

_alpm=2.4.4
_tag='259'

pkgbase=udev
pkgname=(
    'udev'
    'libudev'
    'esysusers'
    'etmpfiles'
    'egummiboot'
    'eukify'
)
pkgdesc='Userspace device file manager'
pkgver="${_tag/[-~]/}"
pkgrel=1
arch=('x86_64')
url='https://www.github.com/systemd/systemd'
license=(
    'GPL-2.0-or-later'
    'LGPL-2.1-or-later'
)
depends=(
    'gcc-libs'
    'glibc'
    'libcap'
)
makedepends=(
    'acl'
    'gperf'
    'hwdata'
    'kbd'
    'kmod'
    'libxcrypt'
    'util-linux'
    'docbook-xsl'
    'git'
    'intltool'
    'meson'
    'python-jinja'
    'rsync'
    'bash-completion'
    'python-pyelftools'
    'python-pefile'
)
validpgpkeys=('63CDA1E5D3FC22B998D20DD6327F26951A015CC4'  # Lennart Poettering <lennart@poettering.net>
              'A9EA9081724FFAE0484C35A1A81CEA22BC8C7E2E'  # Luca Boccassi <luca.boccassi@gmail.com>
              '9A774DB5DB996C154EBBFBFDA0099A18E29326E1'  # Yu Watanabe <watanabe.yu+github@gmail.com>
              '5C251B5FC54EB2F80F407AAAC54CA336CFEB557E') # Zbigniew Jędrzejewski-Szmek <zbyszek@in.waw.pl>
source=("git+https://github.com/systemd/systemd#tag=v${_tag}?signed"
        "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#tag=${_alpm}"
        0001-Use-Arch-Linux-device-access-groups.patch
        0001-artix-standalone-install.patch
        0001-artix-boot-standalone.patch
        artix.conf
        loader.conf
        splash-artix.bmp
)
sha512sums=('b7a0a2da92af8cc55ddb11e73e4bb635d359f0768d0b10c38ea696683dc6605202125541a2d271e9c1ae5aa79753c7b1f0d07e7aa1e2d29d986666056c42e619'
            '1c2cfce7051107172d1d1e75890ef9e4500c1b4516193b36d01e18fc4ee8dcb5324ee20b03b0890eecea674921cda55d5a455b49505f57991226e3a22be94417'
            'ddb9401e47d0bf01874f255803a4b2167ec631484189d29d03694101fd9c77724e735f16d99c5f4ffd8061ae78839b2826ff0e0a925a6f0dbca25f2cfb271a82'
            'bb5879ba8eeb3833d6e8529ccd2355b68221bf16cd8b1b833e2b5f7ca6b1fa1eec8b90116e63d9eda76bf1cb76beaf3b25707b440889786ee1abc4d6af0f883b'
            '063033fc7e95dff0397fe53f6692bee66717700683725d8bfebad03e9c6f7009726820aaca69aa040b78f810b921bd3690e49b7f2448c5dd63a8866e437a90a5'
            '982341dc60bcd15c956eddd683e0b42b63c93d9521acc204bd1ad38a7d1183ae91e8e3074a53294b29e5058a17a8b6d257156dd0bfc21facdba1c035fa64f2c5'
            'ff87b29ecb95d88c9048a74aadb84f8971fd1162e18097f74d7d2cfd40e8de0a42580f5a7fd9e393cfec402990b7390908ccaf24bba8bb8fb61653111a80ae58'
            'a023a7e151f1fe497ff53811e52e41f25ade1dda6f01a3bae37773f87180132bb87ffd60939d24cac09e8de6b9a0d42399c0504f56871e62eb54aedc131e653b')

_backports=(
)

_reverts=(
)

prepare() {
    cd "$_pkgbase"

    local _c
    for _c in "${_backports[@]}"; do
        git log --oneline -1 "${_c}"
        git cherry-pick -n "${_c}"
    done
    for _c in "${_reverts[@]}"; do
        git log --oneline -1 "${_c}"
        git revert -n "${_c}"
    done

    # Replace cdrom/dialout/tape groups with optical/uucp/storage
    patch -Np1 -i ../0001-Use-Arch-Linux-device-access-groups.patch

    patch -Np1 -i ../0001-artix-standalone-install.patch
    patch -Np1 -i ../0001-artix-boot-standalone.patch
}

build() {
    local _meson_options=() _targets=()

    local _meson_ver="${pkgver}-${pkgrel}"

    _meson_options+=(
        -Dversion-tag="${_meson_ver}-artix"
        -Dshared-lib-tag="${_meson_ver/~/}"
        -Dmode=release

        -Dstandalone-binaries=true
        -Dsysusers=true
        -Dtmpfiles=true

        -Dhwdb=true

        -Dblkid=enabled

        -Dkmod=enabled

        -Dgshadow=false

        -Dsbat-distro='artix'
        -Dsbat-distro-summary='Artix Linux'
        -Dsbat-distro-pkgname="${pkgname}"
        -Dsbat-distro-version="${pkgver}"

        -Dtests=true

        -Dlink-udev-shared=false
        -Dlink-boot-shared=false
        -Dlink-kernel-install-shared=false

        -Ddefault-keymap='us'

        -Dman=enabled

        -Dhtml=disabled

        -Ddns-servers=''
        -Dntp-servers=''
        -Defi=true

        -Dbootloader=enabled
        -Dkernel-install=true
        -Dukify=enabled

        -Dsysvinit-path=
        -Dsysvrcnd-path=
        -Ddefault-dnssec=no

        -Ddefault-llmnr=no
        -Ddefault-mdns=no

        -Dsshconfdir=no

        -Dadm-group=false
        -Danalyze=false
        -Dapparmor=disabled
        -Daudit=disabled
        -Dbacklight=false
        -Dbinfmt=false
        -Dbzip2=disabled
        -Dcoredump=false
        -Ddbus=disabled
        -Delfutils=disabled
        -Denvironment-d=false
        -Dfdisk=disabled
        -Dgcrypt=disabled
        -Dglib=disabled
        -Dgnutls=disabled
        -Dhibernate=false
        -Dhostnamed=false
        -Didn=false
        -Dima=false
        -Dinitrd=false
        -Dfirstboot=false
        -Dldconfig=false
        -Dlibcryptsetup=disabled
        -Dlibcurl=disabled
        -Dlibfido2=disabled
        -Dlibidn=disabled
        -Dlibidn2=disabled
        -Dlibiptc=disabled
        -Dlocaled=false
        -Dlogind=false
        -Dlz4=disabled
        -Dmachined=false
        -Dmicrohttpd=disabled
        -Dnetworkd=false
        -Dnss-myhostname=false
        -Dnss-resolve=disabled
        -Dnss-systemd=false
        -Doomd=false
        -Dopenssl=disabled
        -Dp11kit=disabled
        -Dpam=disabled
        -Dpcre2=disabled
        -Dpolkit=disabled
        -Dportabled=false
        -Dpstore=false
        -Dpwquality=disabled
        -Drandomseed=false
        -Dresolve=false
        -Drfkill=false
        -Dseccomp=disabled
        -Dsmack=false
        -Dstoragetm=false
        -Dsysext=false
        -Dtimedated=false
        -Dtimesyncd=false
        -Dtpm=false
        -Dqrencode=disabled
        -Dquotacheck=false
        -Duserdb=false
        -Dutmp=false
        -Dvconsole=false
        -Dvmspawn=disabled
        -Dwheel-group=false
        -Dxdg-autostart=false
        -Dxkbcommon=disabled
        -Dxz=disabled
        -Dzlib=disabled
        -Dzstd=disabled
        -Dbpf-framework=disabled
        -Dpasswdqc=disabled
        -Dselinux=disabled
        -Dxenctrl=disabled
        -Dlibcryptsetup-plugins=disabled
        -Drepart=disabled
        -Dsysupdate=disabled
        -Dimportd=disabled
        -Dhomed=disabled
        -Dremote=disabled
        -Dnss-mymachines=disabled
        -Dtpm2=disabled
        -Dshellprofiledir=no
    )

    artix-meson "$_pkgbase" build "${_meson_options[@]}"

    local _efi_arch

    case $CARCH in
        x86_64*) _efi_arch=x64 ;;
        i686) _efi_arch=ia32 ;;
    esac


    _targets+=(
        udev:shared_library
        src/libudev/libudev.pc

        udevadm
        {ata_id,cdrom_id,dmi_memory_id,fido_id,iocost,mtd_probe,scsi_id,v4l_id}
        rules.d/{50-udev-default,60-persistent-storage,64-btrfs}.rules
        udev-hwdb
        hwdb.d/60-autosuspend-chromiumos.hwdb
        src/udev/udev.pc
        man/{libudev.3,udev.conf.5,hwdb.7,udev.7,udevadm.8,iocost.conf.5,systemd-hwdb.8}

        esysusers
        etmpfiles
        sysusers.d/basic.conf
        tmpfiles.d/{etc,static-nodes-permissions,var,legacy}.conf
        man/{sysusers,tmpfiles}.d.5
        man/systemd-{sysusers,tmpfiles}.8
        factory/templates/{locale,vconsole}.conf

        bootctl
        man/bootctl.1
        src/boot/eboot${_efi_arch}.efi
        src/boot/linux${_efi_arch}.efi.stub
        src/boot/addon${_efi_arch}.efi.stub

        ebless-boot{,-generator}
        man/systemd-{boot.7,bless-boot-generator.8}

        kernel-install
        src/kernel-install/90-loaderentry.install
        man/kernel-install.8

        ukify
        src/kernel-install/60-ukify.install
        man/ukify.1

        systemd-detect-virt
        systemd-runtest.env

        test-libudev
        test-libudev-sym

        test-udev-builtin
        test-udev-device-thread
        test-udev-format
        test-udev-manager
        test-udev-node
        test-udev-rules
        test-udev-spawn
        #test-udev-util

        test-fido-id-desc
        test-link-config-tables
    )
    meson compile -C build "${_targets[@]}"
}

check() {
    local _tests=()
    _tests+=(
        udev-rules-check
        hwdb-test

        test-libudev
        test-libudev-sym

        test-udev
        test-udev-builtin
        test-udev-device-thread
        test-udev-format
        test-udev-manager
        test-udev-node
        test-udev-rules
        test-udev-spawn
        #test-udev-util

        test-fido-id-desc
        test-link-config-tables

        dmidecode_HP-Z600
        dmidecode_Lenovo-ThinkPad-X280
        dmidecode_Lenovo-Thinkcentre-m720s


        test-systemd-tmpfiles.standalone
        test-sysusers.standalone

        #test-tmpfile-util
        #test-offline-passwd
    )

    meson test -C build --print-errorlogs "${_tests[@]}"
}

_inst_man() {
    local x="$1" y=${1##*.} man
    install -d "${pkgdir}"/usr/share/man/man"$y"
    case "$x" in
        *sysusers*|*tmpfiles*) man=${x/systemd-/e} ;;
        *systemd-hwdb*) man=${x/systemd/udev} ;;
        *systemd-boot*) man=${x/systemd-/egummi} ;;
        *systemd-bless-boot-generator*) man=${x/systemd-/e} ;;
        *) man=${x/systemd-/e} ;;
    esac
    install -vm644 build/man/"$x" "${pkgdir}"/usr/share/man/man"$y/$man"
}

package_udev() {
    pkgdesc='Userspace device file manager'
    depends+=(
        'acl' #'libacl.so'
        'bash'
        'hwdata'
        'kbd'
        'kmod'
        'libcap'
       # 'libcap.so'
        'libudev'
        'util-linux' #'libblkid.so'
    )
    backup=(etc/udev/iocost.conf
            etc/udev/udev.conf)

    meson install -C build --destdir "$pkgdir" --no-rebuild --tags udev,udev-devel,hwdb

    for m in udev.conf.5 iocost.conf.5 udev.7 udevadm.8 systemd-hwdb.8; do
        _inst_man "$m"
    done

    # pacman hooks
    make -C alpm-hooks DESTDIR="${pkgdir}" install_udev
}

package_libudev() {
    pkgdesc='udev library for enumerating and introspecting local devices'
    depends+=(
        #'libcap.so'
        'libcap'
    )
    provides=('libudev.so')

    meson install -C build --destdir "$pkgdir" --no-rebuild --tags libudev,libudev-devel

    _inst_man "libudev.3"
}

package_esysusers() {
    pkgdesc='the sysusers.d binary'
    depends+=(
        #'libcap.so'
        'libcap'
        'libxcrypt' #'libcrypt.so'
    )

    meson install -C build --destdir "$pkgdir" --no-rebuild --tags esysusers

    _inst_man "sysusers.d.5"
    _inst_man "systemd-sysusers.8"

    # pacman hooks
    make -C alpm-hooks DESTDIR="${pkgdir}" install_sysusers
}

package_etmpfiles() {
    pkgdesc='the tmpfiles.d binary'
    depends+=(
        'acl' #'libacl.so'
        'libcap'
        #'libcap.so'
    )

    meson install -C build --destdir "$pkgdir" --no-rebuild --tags etmpfiles

    _inst_man "tmpfiles.d.5"
    _inst_man "systemd-tmpfiles.8"

    # pacman hooks
    make -C alpm-hooks DESTDIR="${pkgdir}" install_tmpfiles
}

package_egummiboot() {
    pkgdesc='the gummiboot bootloader'
    provides=('gummiboot')
    depends+=(
        'util-linux' #'libblkid.so' 'libmount.so'
        #'libcap.so'
        'libcap'
        'sh'
    )

    meson install -C build --destdir "$pkgdir" --no-rebuild --tags eboot,kernel-install,ebless

    # add example bootctl configuration
    install -D -m0644 artix.conf "$pkgdir"/usr/share/egummiboot/bootctl/artix.conf
    install -D -m0644 loader.conf "$pkgdir"/usr/share/egummiboot/bootctl/loader.conf
    install -D -m0644 splash-artix.bmp "$pkgdir"/usr/share/egummiboot/bootctl/splash-artix.bmp

    for m in bootctl.1 kernel-install.8 systemd-boot.7 systemd-bless-boot-generator.8; do
        _inst_man "$m"
    done
}

package_eukify() {
    pkgdesc='Combine kernel and initrd into a signed Unified Kernel Image'
    provides=('ukify')
    depends+=(
        'binutils'
        'python'
        'python-cryptography'
        'python-pefile'
    )
    optdepends=(
        'python-pillow: Show the size of splash image'
        'sbsigntools: Sign the embedded kernel'
    )

    meson install -C build --destdir "$pkgdir" --no-rebuild --tags eukify

    _inst_man "ukify.1"
}
