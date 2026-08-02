# Maintainer: Artoo <artoo@artixlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

_pkgbase=systemd

_alpm=3.0
_tag='261.2'

pkgbase=udev
pkgname=(
    'udev'
    'libudev'
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
    'glibc'
    'libgcc'
)
makedepends=(
    'acl'
    #'audit'
    'gperf'
    'hwdata'
    'kbd'
    'kmod'
    'util-linux'
    'docbook-xsl'
    'git'
    'intltool'
    'meson'
    'python-jinja'
    'rsync'
    'tpm2-tss'
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
        0001-udev-standalone-install.patch
)
sha512sums=('1c2a3aed0b7c613040722ef1bd063a1f35d2f3993e0f678701ef5e4d42d31628804df477158e5fa2bb47e523a9969d01cfb7622762cf32ff44e0367e5f432368'
            'e5fec179ae4753b7ed844906d140d3efe525cfdf6675435e80e13a548dd087b0973e262011da5a41b3278edd967aadc5c800fcfddf41987c00fa02c4fdcc91c0'
            'ddb9401e47d0bf01874f255803a4b2167ec631484189d29d03694101fd9c77724e735f16d99c5f4ffd8061ae78839b2826ff0e0a925a6f0dbca25f2cfb271a82'
            '43f77dad07b4926d12731c1ff85d2439a6accb067d267bff2923a080ed8daba194d78b6893d0e75f222dd0a720817b5f39052c3d94d4f68f4ca0052bf87f7ead')

_backports=(
    # hwdb/keyboard: fix match for for X+ Piccolo, again
    '7a53696201adccecb7ad1b49ad825c02842c6845'
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

    patch -Np1 -i ../0001-udev-standalone-install.patch
}

build() {
    local _meson_options=() _targets=()

    local _meson_ver="${pkgver}-${pkgrel}"

    _meson_options+=(
        -Dversion-tag="${_meson_ver}-artix"
        -Dshared-lib-tag="${_meson_ver/~/}"
        -Dmode=release

        -Dstandalone-udev=true

        -Dhwdb=true

        -Dblkid=enabled
        -Dkmod=enabled
        -Dtpm2=enabled
        -Dacl=enabled
        -Dman=enabled



        -Dsbat-distro='artix'
        -Dsbat-distro-summary='Artix Linux'
        -Dsbat-distro-pkgname="${pkgname}"
        -Dsbat-distro-version="${pkgver}"

        -Dtests=true

        -Dlink-udev-shared=false
        -Dlink-boot-shared=false

        -Ddefault-keymap='us'

        -Dstandalone-binaries=false
        -Dsysusers=false
        -Dtmpfiles=false

        -Dgshadow=false

        -Dhtml=disabled

        -Ddns-servers=''
        -Dntp-servers=''
        -Defi=false

        -Dbootloader=disabled
        -Dkernel-install=false
        -Dukify=disabled

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
        -Dlibidn2=disabled
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
        -Dshellprofiledir=no
        -Dnsresourced=false
        -Dmountfsd=false
        -Dnspawn=disabled
        -Dimds=disabled
    )

    artix-meson "$_pkgbase" build "${_meson_options[@]}"

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

        test-fido-id-desc
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

        test-fido-id-desc

        dmidecode_HP-Z600
        dmidecode_Lenovo-ThinkPad-X280
        dmidecode_Lenovo-Thinkcentre-m720s
    )

    meson test -C build --print-errorlogs "${_tests[@]}"
}

_inst_man() {
    local x="$1" y=${1##*.} man
    install -d "${pkgdir}"/usr/share/man/man"$y"
    case "$x" in
        *systemd-hwdb*) man=${x/systemd/udev} ;;
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
        "libudev=${pkgver}"
        'util-linux' #'libblkid.so'
    )
    optdepends=('tpm2-tss: unlocking LUKS2 volumes with TPM2')
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
    provides=('libudev.so')

    meson install -C build --destdir "$pkgdir" --no-rebuild --tags libudev,libudev-devel

    _inst_man "libudev.3"
}
