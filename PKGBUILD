# Maintainer: artist for Artix Linux

pkgname=waterfox
pkgver=6.6.8
pkgrel=1
pkgdesc='Fork of Mozilla Firefox featuring some privacy, usability, and speed enhancements.'
arch=(x86_64)   
license=(GPL-2.1)
url='https://www.waterfox.net/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/WaterfoxCo/Waterfox/archive/refs/tags/$pkgver.tar.gz"
	"l10n-$pkgver.zip::https://codeload.github.com/BrowserWorks/l10n/zip/refs/heads/main"
	"$pkgname.desktop"
	policies.json
	remove-organization-policy-banner.patch
	9002.enable_reader_mode_hotkey.patch
	9003.rebind_screenshot_key_to_ctrl_alt_s.patch
	license.html)
noextract=(l10.zip)
conflicts=(waterfox)
depends=(
	cairo
	dbus
	ffmpeg
	fontconfig
	freetype2
	gcc-libs
	gdk-pixbuf2
	glib2
	glibc
	gtk3
	hicolor-icon-theme
	libpulse
	libx11
	libxcb
	libxcomposite
	libxdamage
	libxext
	libxfixes
	libxrandr
	libxss
	libxt
	mime-types
	nspr
	nss
	pango
	ttf-font
)
makedepends=(
	cbindgen
	clang
	diffutils
	imake
	inetutils
	lld
	llvm
	mesa
	nasm
	nodejs
	python
	rust
	unzip
	wasi-compiler-rt
	wasi-libc
	wasi-libc++
	wasi-libc++abi
	xorg-server-xvfb
	yasm
	zip
)
optdepends=(
	'libnotify: Notification integration'
	'speech-dispatcher: Text-to-Speech'
	'hunspell-en_US: Spell checking, American English')
options=(!emptydirs !makeflags !strip !lto !debug)

prepare() {
        mkdir -p mozbuild
        cd "$pkgname-$pkgver"

	bsdtar xvf ../l10n-$pkgver.zip --strip-components=1 -C waterfox/browser/locales
        patch -Np1 -i ../remove-organization-policy-banner.patch
        patch -Np1 -i ../9002.enable_reader_mode_hotkey.patch
        patch -Np1 -i ../9003.rebind_screenshot_key_to_ctrl_alt_s.patch	
        sed -i -e "s/%DISPLAY_VERSION%/$pkgver/" waterfox/browser/branding/pref/firefox-branding.js
        sed -i -e "s/^/$pkgver-/" browser/config/version_display.txt

	cat >../mozconfig <<END
ac_add_options --enable-optimize="-O2 -w"
ac_add_options --enable-release
ac_add_options --enable-rust-simd
export MOZ_APP_REMOTINGNAME=${pkgname}
export RUSTC_OPT_LEVEL=2
export MOZILLA_OFFICIAL=1
export RUSTFLAGS="$RUSTFLAGS -Ctarget-cpu=x86-64"

ac_add_options --disable-crashreporter
ac_add_options --disable-debug
ac_add_options --disable-dmd
ac_add_options --disable-geckodriver
ac_add_options --disable-profiling
ac_add_options --disable-tests

ac_add_options --enable-application=browser
ac_add_options --enable-install-strip
ac_add_options --enable-jxl
ac_add_options --enable-linker=lld
ac_add_options --enable-strip
ac_add_options --disable-bootstrap
# ac_add_options --enable-unverified-updates

ac_add_options --target=x86_64-pc-linux-gnu

ac_add_options --with-app-basename=Waterfox
ac_add_options --with-app-name=waterfox
ac_add_options --with-branding=waterfox/browser/branding
ac_add_options --with-distribution-id=net.waterfox
ac_add_options --with-l10n-base="$PWD"/waterfox/browser/locales

mk_add_options AUTOCLOBBER=1
export MOZ_INCLUDE_SOURCE_INFO=1
export MOZ_REQUIRE_SIGNING=
export MOZ_TELEMETRY_REPORTING=

ac_add_options --enable-pulseaudio
ac_add_options --enable-alsa
ac_add_options --enable-jack

#ac_add_options --disable-jprof   # artist: not known by WF 6.6.0
ac_add_options --disable-updater

ac_add_options --prefix=/usr
ac_add_options --enable-hardening
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

mk_add_options MOZ_OBJDIR=./obj-"$(uname -s)"-"$(uname -m)"

### Options for specific build pass follow
END
}

build() {
	cd "$pkgname-$pkgver"

	export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
	export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
	export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
	export MOZ_NOSPAM=1

	CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
	CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
	CFLAGS="${CFLAGS/-fexceptions/}"
	CXXFLAGS="${CXXFLAGS/-fexceptions/}"
	CFLAGS+=" -w"
	CXXFLAGS+=" -w"

	ulimit -n 4096

	if [[ -z $_disable_pgo ]]; then
	# Do 3-tier PGO
	echo; echo "----- Building instrumented browser -----"; echo
	cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
	./mach build --priority normal
	./mach package

	echo; echo "----- Profiling instrumented browser -----"; echo
	LLVM_PROFDATA=llvm-profdata JARLOG_FILE="$PWD/jarlog" \
		MOZ_DISABLE_CONTENT_SANDBOX=1 \
		MOZ_DISABLE_GMP_SANDBOX=1 \
		MOZ_DISABLE_GPU_SANDBOX=1 \
		MOZ_DISABLE_RDD_SANDBOX=1 \
		MOZ_DISABLE_SOCKET_PROCESS_SANDBOX=1 \
		MOZ_DISABLE_UTILITY_SANDBOX=1 \
		MOZ_DISABLE_VR_SANDBOX=1 \
		GTK_A11Y=none NO_AT_BRIDGE=1 dbus-run-session \
		xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
		./mach python build/pgo/profileserver.py

	[[ -s merged.profdata ]] || { echo >&2 "ERROR: No profile data produced"; return 1; }
	stat -c "Profile data found (%s bytes)" merged.profdata
	[[ -s jarlog ]] || { echo >&2 "ERROR: No jarlog produced"; return 1; }
	stat -c "Profile jarlog found (%s bytes)" jarlog

	echo; echo "----- Removing instrumented browser -----"; echo
	./mach clobber objdir

	echo; echo "----- Building optimized browser -----"; echo
	cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END

	else
	echo; echo "----- Building browser without PGO -----"; echo
	cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto
END
	fi

	./mach build

	./mach buildsymbols

	./mach package
	./mach package-multi-locale --locales ar cs da de el en-US en-GB es-ES fr hu id it ja ko lt nl nn-NO pl pt-BR pt-PT ru sv-SE th tr uk zh-CN zh-TW
}

package() {
	cd "$pkgname-$pkgver" || exit

	install -Ddvm755 "${pkgdir}/usr/lib/${pkgname}"
	cp -rvf "obj-Linux-x86_64/dist/${pkgname}/." "${pkgdir}/usr/lib/${pkgname}"

	install -Ddvm755 "${pkgdir}/usr/bin"
	ln -srfv "$pkgdir/usr/lib/${pkgname}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"

	local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
	install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);
END

	local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
	install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=artixlinux
version=1.0
about=Waterfox for Artix Linux

[Preferences]
app.distributor=artixlinux
app.distributor.channel=$pkgname
app.partner.$pkgname=$pkgname
startup.homepage_welcome_url.additional=""
startup.homepage_override_url=""
startup.homepage_welcome_url=""
END

	local p
	for p in 16 32 48 64 128 256; do
		install -Dvm644 waterfox/browser/branding/default$p.png \
			"$pkgdir/usr/share/icons/hicolor/${p}x${p}/apps/$pkgname.png"
	done
	install -Dvm644 waterfox/browser/branding/content/about-logo.png \
		"$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"
	install -Dvm644 waterfox/browser/branding/content/about-logo@2x.png \
		"$pkgdir/usr/share/icons/hicolor/384x384/apps/$pkgname.png"
	install -Dvm644 waterfox/browser/branding/content/about-logo.svg \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

	install -Dvm644 ../policies.json \
                "$pkgdir/usr/lib/$pkgname/distribution/policies.json"

	install -Dvm644 ../$pkgname.desktop \
		"$pkgdir/usr/share/applications/$pkgname.desktop"

        install -Dm644 "$srcdir/license.html" "$pkgdir/usr/share/licenses/$pkgname/license.html"

        # Install a wrapper to avoid confusion about binary path
        install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOT
#!/usr/bin/env sh
exec /usr/lib/$pkgname/waterfox "\$@"
EOT
        # Replace duplicate binary with wrapper
        # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
        ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/waterfox-bin"
        # Use system certificates
        local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
        if [[ -e $nssckbi ]]; then
                ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
        fi
}

b2sums=('58950b1e57ad14169739305330539400a575bb0de25beecb76c5b66f5cd89e45030a7bf7a83904169df8081cc5ac9fbf736db4f2e0e9a5a26b580c57cb2fba27'
        '34e5f09a1e693333697b8f56676ade83f6d7b4881d255cd32fe6378f8fdf9f4a08ce3bc2b828a564bfdf27e41c23a07d88eecc83a468e2198955e54389d43b52'
        '0fad7604486275fb74cdc11ce4375f024eda859eb6520f71cb6c4e73a042e9d16d3e6d03d3bc6e3d6bf6ec72d7c07394c922914042be3d0919205a55cf7ab978'
        '164844bacff82d9c6431c55ab078725e8e23ff0dc67bf079d56a5696f70b54ca81ec27e5a37acb336b52048c956cd39db087ac060414a1863d8ef3c47120df67'
        '3a6d97231824c9c2d97bd15023faa4cdd25ae59a34c1961e6cd12bb5d172ede95594fd1f7e3dbed7d79a645cf734961a4b7d2bdedaee55c716d49f0e7fdfc3a4'
        '98d7b2aa61364c2b015d1a696a326e26d6d570cb8346e243ae67e5bfd7683732ce8227404fbfcac0969c9c52dcb1a9547e5779c74beca07ad3c41d2e4034e7bc'
        'f547df79e8e5d5c83389a0e1fec844945627c652a2058eca4f3d9028a24674feca7553b3f0cd0bb4095c0208fc19992d58ad6991440c8741e1dde418a74a0753'
        '681c4141128e774a57c474f690e9e550f1f17675d5195e39201f17f254a8a376827d30f7ccc0ab2bd1d37495abcbc95bb9321285895c3aa99546a3600ea1668c')

