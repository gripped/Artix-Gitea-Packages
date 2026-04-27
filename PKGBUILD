# Maintainer: artist for Artix Linux

_pkgname="limine-entry-tool"
pkgname="limine-mkinitcpio-hook"
_pkgver=1.35.1
_extver="" #_extver="_1"
pkgver="${_pkgver}${_extver}"
pkgrel=1
pkgdesc="Install kernels for the Limine bootloader."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zesko/${_pkgname}"
source=("${url}/-/archive/${pkgver}${_extver}/${_pkgname}-${pkgver}${_extver}.tar.gz"
        "https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-25.0.2/graalvm-community-jdk-25.0.2_linux-x64_bin.tar.gz")
license=("GPL3")
provides=('limine-entry-tool')
options=(!debug !strip)
_graalvm_version=graalvm_ce_jdk25
makedepends=('git' 'gradle')
depends=('bash'
         'grep'
         'tar'
         'limine'
         'mkinitcpio'
         'efibootmgr')
optdepends=('kernel-modules-hook: Safely keeps kernel on upgrade failure'
            'sbctl: Signs UEFI boot files for Secure Boot when enabled')
backup=(etc/limine-entry-tool.conf)
conflicts=('limine-entry-tool')

prepare() {
	[[ -d "${_graalvm_version}" ]] && rm -rf "${_graalvm_version}"
	mv graalvm-community-openjdk-*/ "${_graalvm_version}"
	if ! command -v "${_graalvm_version}"/bin/javac >/dev/null 2>&1; then
		echo "Error: ${_graalvm_version}/bin/javac not found." >&2
		return 1
	fi
}

build() {
	cd "${_pkgname}-${pkgver}"
	export GRAALVM_HOME="$srcdir/${_graalvm_version}"
	export JAVA_HOME="${GRAALVM_HOME}"
	export NATIVE_IMAGE_OPTIONS="-march=compatibility"
	/usr/bin/gradle clean nativeCompile -Dorg.gradle.java.home="${JAVA_HOME}"
}

package() {
	cd "${_pkgname}-${pkgver}"
	src_path="install/arch-linux/${pkgname}"
	install -dm 755 "$src_path/usr/share/limine-entry-tool.d/"
	install -dm 755 "$src_path/etc/limine-entry-tool.d/"
	install -Dm 755 build/native/nativeCompile/limine-entry-tool "$src_path/usr/lib/limine/"
	install -dm 755 "$src_path/usr/share/doc/${pkgname}/"
	cp -r README.md CHANGELOG.md "$src_path/usr/share/doc/${pkgname}/"
	cp -r "$src_path/usr" "$src_path/etc" "$pkgdir"
}

sha256sums=('660826bc5087f8a9fe103f8dbe98ad595dcda9148f597224c95a3be2c8e26555'
            'e0be791c8fda4d03b6b0a0cb824fef3149736170057b3a515252b44419606af0')
