# Maintainer: superphenotype
pkgbase=deploytix-git
pkgname=('deploytix-git' 'deploytix-gui-git')
pkgver=1.2.6.rr9.ge34a93c.9.gfb8e963
pkgrel=1
pkgdesc="Automated Artix Linux deployment installer for removable media and disks"
arch=('x86_64')
url="https://github.com/MasterGenotype/Deploytix"
license=('GPL-3.0-or-later')
makedepends=('cargo' 'git' 'libxkbcommon' 'libxcb' 'wayland' 'mesa')
source=('https://github.com/MasterGenotype/Deploytix/raw/refs/heads/main/Cargo.toml')
sha512sums=('b8503ac2df628f3e1d8fae779d70f94b7e9130f57c4d20a55da4c9b119405ddfbd1520bbed30130954fde6d8c3b965b64bfeb440fab85cb62703ce0618b8b42a')

# Build from the local repo tree (pkg/ lives one level below the repo root).
_repodir="$startdir/.."

prepare() {
    cd "$_repodir"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_repodir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --features gui
}

package_deploytix-git() {
    pkgdesc="Automated Artix Linux deployment installer (CLI)"
    depends=('gcc-libs' 'alsa-lib')
    optdepends=(
        'dosfstools: EFI partition formatting (mkfs.vfat)'
        'e2fsprogs: ext4 filesystem support'
        'btrfs-progs: btrfs filesystem support'
        'xfsprogs: xfs filesystem support'
        'f2fs-tools: f2fs filesystem support'
        'cryptsetup: LUKS encryption support'
        'lvm2: LVM thin provisioning layout'
        'grub: GRUB bootloader'
        'artools: basestrap for Artix installation'
    )
    provides=('deploytix')
    conflicts=('deploytix')

    cd "$_repodir"
    install -Dm755 "target/release/deploytix" "$pkgdir/usr/bin/deploytix"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

package_deploytix-gui-git() {
    pkgdesc="Automated Artix Linux deployment installer (GUI)"
    depends=('deploytix-git' 'alsa-lib' 'libxkbcommon' 'libxcb' 'wayland' 'mesa')
    provides=('deploytix-gui')
    conflicts=('deploytix-gui')

    cd "$_repodir"
    install -Dm755 "target/release/deploytix-gui" "$pkgdir/usr/bin/deploytix-gui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed 's|%BINDIR%|/usr/bin|g' deploytix-gui.desktop > "$startdir/deploytix-gui.desktop.out"
    install -Dm644 "$startdir/deploytix-gui.desktop.out" "$pkgdir/usr/share/applications/deploytix-gui.desktop"
    install -Dm644 com.deploytix.gui.policy "$pkgdir/usr/share/polkit-1/actions/com.deploytix.gui.policy"
    sed -i 's|%BINDIR%|/usr/bin|g' "$pkgdir/usr/share/polkit-1/actions/com.deploytix.gui.policy"
}
