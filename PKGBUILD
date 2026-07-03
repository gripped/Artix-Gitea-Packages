# Maintainer: artist for Artix Linux

pkgname="limine-snapper-sync"
pkgver=1.31.0
pkgrel=1
pkgdesc="Integrates Limine boot entries with Snapper snapshots."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zesko/limine-snapper-sync"
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-25.0.2/graalvm-community-jdk-25.0.2_linux-x64_bin.tar.gz"
        syslog-watch-command.patch)
license=("GPL3")
options=(!debug !strip)
_graalvm_version=graalvm_ce_jdk25
makedepends=('gradle')
depends=('bash'
         'inotify-tools'
         'limine'
         'snapper'
         'btrfs-progs'
         'libnotify')
optdepends=('limine-dracut-support: Automates kernel installation/removal and Limine boot entry management.'
            'limine-mkinitcpio-hook: Automates kernel installation/removal and Limine boot entry management.'
            'inotify-tools: Monitors when snapshots are created or deleted.'
            'rsync: Alternative method for restoring snapshots.'
            'b3sum: Fast Blake3 hash function to prevent duplication.'
            'xxhash: Fast hashing utility for deduplication with shorter hashes.')
makedepends=('gradle')
backup=(etc/limine-snapper-sync.conf)

prepare() {
	[[ -d "${_graalvm_version}" ]] && rm -rf "${_graalvm_version}"
	mv graalvm-community-openjdk-*/ "${_graalvm_version}"
	if ! command -v "${_graalvm_version}"/bin/javac >/dev/null 2>&1; then
		echo "Error: "${_graalvm_version}"/bin/javac not found." >&2
		return 1
	fi
	cd $pkgname-$pkgver
	patch -Np1 -i ../syslog-watch-command.patch
}

build() {
	cd "${pkgname}-${pkgver}"
	export GRAALVM_HOME="$srcdir/${_graalvm_version}"
	export JAVA_HOME="${GRAALVM_HOME}"
	export NATIVE_IMAGE_OPTIONS="-march=compatibility"
	/usr/bin/gradle clean nativeCompile -Dorg.gradle.java.home="${JAVA_HOME}"
}

package() {
	cd "${pkgname}-${pkgver}"
	src_path="install/arch-linux/"
        rm -r "$src_path/usr/lib/systemd"
	install -Dm 755 "build/native/nativeCompile/${pkgname}" "$src_path/usr/lib/limine/"
	install -dm 755 "$src_path/usr/share/doc/limine-snapper-sync/"
	cp -r README.md CHANGELOG.md "$src_path/usr/share/doc/limine-snapper-sync/"
	cp -r "$src_path/usr" "$src_path/etc" "$pkgdir"
}

sha256sums=('d7424c11e3dbd80ad771a5562a77c61a60551d07d36c60d1ab15dc278710fb45'
            'e0be791c8fda4d03b6b0a0cb824fef3149736170057b3a515252b44419606af0'
            '9a971662b33208734513af8ed40fe867d1119a78a2dda7105dae708b1e42ec03')

