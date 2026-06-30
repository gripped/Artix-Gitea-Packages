# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor:  Joakim Hernberg <jbh@alchemy.lu>

pkgbase=linux-rt-lts
pkgver=6.12.94.rt18.artix1
archpkgver=6.12.94.rt18.arch1
pkgrel=1
pkgdesc='Linux RT LTS'
arch=(x86_64)
url='https://gitlab.archlinux.org/archlinux/packaging/upstream/linux-rt-lts'
makedepends=(
  bc
  binutils
  cpio
  gettext
  glibc
  graphviz  # docs
  imagemagick  # docs
  libelf
  libgcc
  openssl
  pahole
  perl
  python
  python-sphinx  # docs
  python-yaml  # docs
  rust
  rust-bindgen
  rust-src
  tar
  texlive-latexextra  # docs
  xxhash
  xz
  zlib
  zstd
)
options=(
  !debug
  !strip
)
# Extract the version parts from pkgver and assemble them as needed.
IFS='.' read -r -a _version_parts <<< "$archpkgver"
_major="${_version_parts[0]}"
_minor="${_version_parts[1]}"
# Depending on whether patch level is 0, assemble the upstream version to use.
if (( _version_parts[2] == 0 )); then
  _upstream_ver="${_version_parts[0]}.${_version_parts[1]}"
else
  _upstream_ver="${_version_parts[0]}.${_version_parts[1]}.${_version_parts[2]}"
fi
# Based on upstream version, assemble the RT patch version.
_rt_patch_ver="${_upstream_ver}-${_version_parts[3]}"
# Assemble the distribution patch version.
_distro_patch_ver="${_version_parts[0]}.${_version_parts[1]}.${_version_parts[2]}-${_version_parts[3]}-${_version_parts[4]}"
# Add a convenience abstraction for the source directory.
_srcname=linux-${_upstream_ver}
source=(
  https://cdn.kernel.org/pub/linux/kernel/v${_major}.x/${_srcname}.tar.{xz,sign}
  $url/-/releases/v${_distro_patch_ver}/downloads/$pkgbase-v${_rt_patch_ver}.patch.{sig,zst}
  $url/-/releases/v${_distro_patch_ver}/downloads/$pkgbase-v${_distro_patch_ver}.patch.{sig,zst}
)
source_x86_64=(config.x86_64)
sha512sums=('9368813d7c2b17d0a893c1becd0d631dac9030a81c0505b463ad4d8c72edbdaeada53c24bc36ada0b84ff0ff78ae363bdf9aeeb8cff6a0d01bc6fc00b2fa275b'
            'SKIP'
            'SKIP'
            '6083c9277455537dcb6a11d989c50aeef908397a05478cde5762eb77967ad3a8f909278c021ca33c16ec32a9da8089493537cfe041b8ce40836728703003b59c'
            'SKIP'
            '39546d49247f9cbd0fa2f770cb0369c498190d86b34fc1e7086d00573da2e430e83bbe4974e97f1562089c952194e7bfff1fe0cf43babda87880b70f3e341a61')
sha512sums_x86_64=('c51588dbcd9f3c40e7c668bfe80eccb7f32a24cbb24e94588cb87e33b0b7c579bbc94d16b42b0651e641d9d351f8c74f3086a18297aa885261c77de2ca0785f2')
b2sums=('449180d9913a48b0fe777fc830b4e95af720793ff2a50d02d839077dffd439ec0c926e4cd8181c6b5912010e7e107456756aba65713eca9c4fdc6c57cb8c14dc'
        'SKIP'
        'SKIP'
        '9386ed3d8651fdadc45028551935bda7ee491063ee6cf10bcb7d8605096e0f3a642377b646b594e90ce0099c33488d7096fb80db278015df0086665ebfeb1744'
        'SKIP'
        'b661e0f21e7ee59e1c84d0a6f294fc76494cb78811e9c6633f23db4227ee7f9bcb90c3e380cfca37d9aed5e9e13a462b17f2ef59c51e2482fb963df59d57d8a4')
b2sums_x86_64=('3c346ce4d3b8cbd5e124432ca06d6652ee598446fc832060f79c921403ec3147e305b9ec6aa635d86b39c0791d4e13c83aaa7dd9dbaff366adb94975bfa57455')
validpgpkeys=(
  647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  D5653EA39C8675DA4BD5971C13B55DD07C53B851  # Clark Williams (Kernel Correspondence) <clrkwllms@kernel.org>
  991F6E3F0765CF6295888586139B09DA5BF0D338  # David Runge <dvzrv@archlinux.org>
  05C7775A9E8B977407FE08E69D4C5AA15426DA0A  # Frederik Schwan <freswa@archlinux.org>
)

export KBUILD_BUILD_HOST=artixlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config.$CARCH .config
  make olddefconfig
  # make nconfig
  diff -u ../config.$CARCH .config || :

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make all
  make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
  make htmldocs SPHINXOPTS=-QT
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  license=(
    'Apache-2.0 OR MIT'
    'BSD-2-Clause OR GPL-2.0-or-later'
    BSD-3-Clause
    'BSD-3-Clause OR GPL-2.0-only'
    'BSD-3-Clause OR GPL-2.0-or-later'
    BSD-3-Clause-Clear
    GPL-1.0-or-later
    'GPL-1.0-or-later OR BSD-3-Clause'
    GPL-2.0-only
    'GPL-2.0-only OR Apache-2.0'
    'GPL-2.0-only OR BSD-2-Clause'
    'GPL-2.0-only OR BSD-3-Clause'
    'GPL-2.0-only OR CDDL-1.0'
    'GPL-2.0-only OR Linux-OpenIB'
    'GPL-2.0-only OR MIT'
    'GPL-2.0-only OR MPL-1.1'
    'GPL-2.0-only OR X11'
    'GPL-2.0-only WITH Linux-syscall-note'
    GPL-2.0-or-later
    'GPL-2.0-or-later OR BSD-2-Clause'
    'GPL-2.0-or-later OR BSD-3-Clause'
    'GPL-2.0-or-later OR MIT'
    'GPL-2.0-or-later OR X11'
    'GPL-2.0-or-later WITH GCC-exception-2.0'
    ISC
    LGPL-2.0-or-later
    'LGPL-2.1-only'
    'LGPL-2.1-only OR BSD-2-Clause'
    LGPL-2.1-or-later
    MIT
    MPL-1.1
    X11
    Zlib
  )
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    "$pkgbase-headers: headers and scripts for building modules"
    'linux-firmware: firmware images needed for some devices'
    'scx-scheds: to use sched-ext schedulers'
    'wireless-regdb: to set the correct wireless channels of your country'
  )
  provides=(
    KSMBD-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
  )

  cd $_srcname
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build link
  rm "$modulesdir"/build

  # licenses
  install -vDm 644 LICENSES/deprecated/{GPL-1.0,ISC,Linux-OpenIB,X11,Zlib} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/preferred/{BSD,MIT}* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/exceptions/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  license=(
    BSD-3-Clause
    'BSD-3-Clause OR GPL-2.0-only'
    GPL-1.0-or-later
    'GPL-1.0-or-later WITH Linux-syscall-note'
    GPL-2.0-only
    'GPL-2.0-only OR Apache-2.0'
    'GPL-2.0-only OR BSD-2-Clause'
    'GPL-2.0-only OR BSD-3-Clause'
    'GPL-2.0-only OR CDDL-1.0'
    'GPL-2.0-only OR Linux-OpenIB'
    'GPL-2.0-only OR Linux-OpenIB OR BSD-2-Clause'
    'GPL-2.0-only OR MIT'
    'GPL-2.0-only OR MPL-1.1'
    'GPL-2.0-only OR X11'
    'GPL-2.0-only WITH Linux-syscall-note'
    '(GPL-2.0-only WITH Linux-syscall-note) AND MIT'
    '(GPL-2.0-only WITH Linux-syscall-note) OR BSD-2-Clause'
    '(GPL-2.0-only WITH Linux-syscall-note) OR BSD-3-Clause'
    '(GPL-2.0-only WITH Linux-syscall-note) OR CDDL-1.0'
    '(GPL-2.0-only WITH Linux-syscall-note) OR Linux-OpenIB'
    '(GPL-2.0-only WITH Linux-syscall-note) OR MIT'
    GPL-2.0-or-later
    'GPL-2.0-or-later OR BSD-2-Clause'
    'GPL-2.0-or-later OR BSD-3-Clause'
    'GPL-2.0-or-later OR MIT'
    'GPL-2.0-or-later WITH Linux-syscall-note'
    '(GPL-2.0-or-later WITH Linux-syscall-note) OR BSD-3-Clause'
    '(GPL-2.0-or-later WITH Linux-syscall-note) OR MIT'
    'LGPL-2.0-or-later OR BSD-2-Clause'
    'LGPL-2.0-or-later WITH Linux-syscall-note'
    ISC
    'LGPL-2.0-or-later WITH Linux-syscall-note'
    'LGPL-2.0-or-later OR BSD-2-Clause'
    LGPL-2.1-only
    'LGPL-2.1-only OR BSD-2-Clause'
    'LGPL-2.1-only OR MIT'
    'LGPL-2.1-only WITH Linux-syscall-note'
    LGPL-2.1-or-later
    'LGPL-2.1-or-later OR BSD-2-Clause'
    'LGPL-2.1-or-later WITH Linux-syscall-note'
    MIT
    Zlib
  )
  depends=(
    binutils
    glibc
    libelf
    libgcc
    openssl
    pahole
    xxhash
    zlib
    zstd
  )
  provides=(LINUX-HEADERS)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  local karch
  case $CARCH in
    x86_64) karch=x86 ;;
    *) echo "Unknown CARCH $CARCH"; exit 1 ;;
  esac

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux tools/bpf/bpftool/vmlinux.h
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/$karch" -m644 arch/$karch/Makefile
  cp -t "$builddir" -a scripts
  ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"

  if [[ $(scripts/config -s CONFIG_HAVE_STACK_VALIDATION) = y ]]; then
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool
  fi

  if [[ $(scripts/config -s CONFIG_DEBUG_INFO_BTF_MODULES) = y ]]; then
    install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
  fi

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/$karch" -a arch/$karch/include
  install -Dt "$builddir/arch/$karch/kernel" -m644 arch/$karch/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Installing Rust files..."
  if [[ $(scripts/config -s CONFIG_RUST) = y ]]; then
    install -Dt "$builddir/rust" -m644 rust/*.rmeta
    install -Dt "$builddir/rust" rust/*.so
  fi

  echo "Installing unstripped VDSO..."
  make INSTALL_MOD_PATH="$pkgdir/usr" vdso_install \
    link=  # Suppress build-id symlinks

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */$karch/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "$builddir/Documentation"

  echo "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -Sib "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

  # licenses
  install -vDm 644 LICENSES/deprecated/{ISC,Linux-OpenIB,X11,Zlib} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/preferred/{BSD*,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/exceptions/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

_package-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel"
  license=(
    BSD-3-Clause
    GFDL-1.1-no-invariants-or-later
    GPL-2.0-only
    'GPL-2.0-only OR BSD-2-Clause'
    'GPL-2.0-only OR BSD-3-Clause'
    'GPL-2.0-only OR GFDL-1.1-no-invariants-or-later'
    'GPL-2.0-only OR GFDL-1.2-no-invariants-only'
    'GPL-2.0-only OR MIT'
    GPL-2.0-or-later
    'GPL-2.0-or-later OR BSD-2-Clause'
    'GPL-2.0-or-later OR CC-BY-4.0'
    'GPL-2.0-or-later OR MIT'
    'GPL-2.0-or-later OR X11'
    'LGPL-2.1-only OR BSD-2-Clause'
    MIT
  )

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"

  # licenses
  install -vDm 644 LICENSES/deprecated/X11 -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/preferred/{BSD*,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
}

pkgname=(
  "$pkgbase"
  "$pkgbase-headers"
  "$pkgbase-docs"
)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
