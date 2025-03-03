# Maintainer: artist for Artix Linux

pkgname=waterfox
_pkgname=Waterfox
pkgver=6.5.4
pkgrel=1.2
pkgdesc='Fork of Mozilla Firefox featuring some privacy, usability, and speed enhancements.'
arch=(x86_64)   
license=(GPL-2.1)
url='https://www.waterfox.net/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/WaterfoxCo/Waterfox/archive/refs/tags/$pkgver.tar.gz"
	"l10n.zip::https://codeload.github.com/BrowserWorks/l10n/zip/refs/heads/main"
	"$pkgname.desktop"
	policies.json
	remove-organization-policy-banner.patch
	9002.enable_reader_mode_hotkey.patch
	9003.rebind_screenshot_key_to_ctrl_alt_s.patch
	license.html)
noextract=(l10.zip)
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
        cd "$_pkgname-$pkgver"
	bsdtar xvf ../l10n.zip --strip-components=1 -C waterfox/browser/locales
        patch -Np1 -i ../remove-organization-policy-banner.patch
        patch -Np1 -i ../9002.enable_reader_mode_hotkey.patch
        patch -Np1 -i ../9003.rebind_screenshot_key_to_ctrl_alt_s.patch	
sed -i -e "s/%DISPLAY_VERSION%/$pkgver/" waterfox/browser/branding/pref/firefox-branding.js
	cat >../mozconfig <<END
ac_add_options --enable-optimize="-O2 -w"
ac_add_options --enable-release
ac_add_options --enable-rust-simd
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

ac_add_options --disable-jprof
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
	cd "$_pkgname-$pkgver"

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
}

package() {
	cd "$_pkgname-$pkgver"

	DESTDIR="$pkgdir" ./mach install

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

b2sums=('9d0a90d0c86f73d7dc2884d6b6d21bb82859f9c950be69d002dba9418c29609e447b23e94acb7ced7fbec5cd5ec4b17467e720750b1219b15889dc13b85dbd21'
        'dae98ce62bcc76d822d16a9c140a65943cd1d383734684b08e765b12e61e7010c104a0b333888a6f911fc22c2521c9148a8634cf36d7f120f964bb2ddcde162b'
        '0fad7604486275fb74cdc11ce4375f024eda859eb6520f71cb6c4e73a042e9d16d3e6d03d3bc6e3d6bf6ec72d7c07394c922914042be3d0919205a55cf7ab978'
        '24a456938be30bc9bbfac1da258134bfbda08f809e78c3903ecb7706f83fd653e24fc50567ee5b68a7447d072adaff27e481f62212665078cd7b8baf1b5f0506'
        '3a6d97231824c9c2d97bd15023faa4cdd25ae59a34c1961e6cd12bb5d172ede95594fd1f7e3dbed7d79a645cf734961a4b7d2bdedaee55c716d49f0e7fdfc3a4'
        '98d7b2aa61364c2b015d1a696a326e26d6d570cb8346e243ae67e5bfd7683732ce8227404fbfcac0969c9c52dcb1a9547e5779c74beca07ad3c41d2e4034e7bc'
        'f547df79e8e5d5c83389a0e1fec844945627c652a2058eca4f3d9028a24674feca7553b3f0cd0bb4095c0208fc19992d58ad6991440c8741e1dde418a74a0753'
        '681c4141128e774a57c474f690e9e550f1f17675d5195e39201f17f254a8a376827d30f7ccc0ab2bd1d37495abcbc95bb9321285895c3aa99546a3600ea1668c')
