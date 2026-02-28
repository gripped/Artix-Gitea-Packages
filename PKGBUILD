# Maintainer: artist for Artix Linux

pkgname=waterfox
pkgver=6.6.9
pkgrel=1.2
pkgdesc='Fork of Mozilla Firefox featuring some privacy, usability, and speed enhancements.'
arch=(x86_64)
license=('MPL-2.0')
url='https://www.waterfox.net/'
depends=(
	gtk3
	libxt
	mime-types
	dbus-glib
	nss
	ttf-font
	libpulse
)
makedepends=(
	cbindgen
	clang
	diffutils
	dump_syms
	imake
	jack
	lld
	llvm
	mercurial
	mesa
	nasm
	nodejs
	python
	python-pip
	rust
	unzip
	wasi-compiler-rt
	wasi-libc
	wasi-libc++
	wasi-libc++abi
	xorg-server-xvfb
	yasm
	zip
	#sccache
)

optdepends=(
	'hunspell-en_US: Spell checking, American English'
	'libnotify: Notification integration'
	'networkmanager: Location detection via available WiFi networks'
	'pulseaudio: Audio support'
	'speech-dispatcher: Text-to-Speech'
	'xdg-desktop-portal: Screensharing with Wayland'
)

options=(!emptydirs !makeflags !strip)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/WaterfoxCo/Waterfox/archive/refs/tags/$pkgver.tar.gz"
	"locales.tar.gz::https://github.com/BrowserWorks/l10n/archive/bce7b1e821ff7f65d914d35f09eee0379f41887d.tar.gz"
	"$pkgname.desktop"
	policies.json
	remove-organization-policy-banner.patch
	9002.enable_reader_mode_hotkey.patch
	9003.rebind_screenshot_key_to_ctrl_alt_s.patch
        license.html
)

prepare () {
	rm -rf "$pkgname-$pkgver/waterfox/browser/locales/"*
	mv "l10n-bce7b1e821ff7f65d914d35f09eee0379f41887d/"* "$pkgname-$pkgver/waterfox/browser/locales/"

	mkdir -p mozbuild
	cd "waterfox-$pkgver"

	#bsdtar xvf ../l10n-$pkgver.zip --strip-components=1 -C waterfox/browser/locales
        patch -Np1 -i ../remove-organization-policy-banner.patch
        patch -Np1 -i ../9002.enable_reader_mode_hotkey.patch
        patch -Np1 -i ../9003.rebind_screenshot_key_to_ctrl_alt_s.patch
        sed -i -e "s/%DISPLAY_VERSION%/$pkgver/" waterfox/browser/branding/pref/firefox-branding.js
        sed -i -e "s/^/$pkgver-/" browser/config/version_display.txt

	cat > ../mozconfig <<EOT
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --enable-optimize="-O2 -w"
ac_add_options --enable-release
ac_add_options --enable-rust-simd
export MOZ_APP_REMOTINGNAME=${pkgname}
export RUSTC_OPT_LEVEL=2
export MOZILLA_OFFICIAL=1
export RUSTFLAGS="$RUSTFLAGS -Ctarget-cpu=x86-64"

ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --enable-application=browser
ac_add_options --enable-install-strip
ac_add_options --enable-jxl
ac_add_options --enable-linker=lld
ac_add_options --enable-strip
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
ac_add_options --with-l10n-base="$PWD"/waterfox/browser/locales
ac_add_options --target=x86_64-pc-linux-gnu

ac_add_options --with-app-basename=Waterfox
ac_add_options --with-app-name=waterfox
ac_add_options --with-branding=waterfox/browser/branding
ac_add_options --with-distribution-id=net.waterfox

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
#ac_add_options --with-system-sccache

# Branding
ac_add_options --with-app-name=waterfox
ac_add_options --with-app-basename=Waterfox
ac_add_options --with-branding=waterfox/browser/branding
ac_add_options --with-distribution-id=org.artixlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
ac_add_options --disable-debug
ac_add_options --disable-dmd
ac_add_options --disable-geckodriver
ac_add_options --disable-profiling
EOT
}

build () {
	cd waterfox-$pkgver

	
    export CFLAGS="${CFLAGS/-fexceptions/}"
    export CXXFLAGS="${CXXFLAGS/-fexceptions/}"
    
    # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
    CFLAGS+=" -fno-exceptions"
    CXXFLAGS+=" -fno-exceptions"

	# malloc_usable_size is used in various parts of the codebase
	CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
	CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

	export MOZ_NOSPAM=1
	export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
	export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=none

	# LTO needs more open files
	ulimit -n 4096

	# prevents references to $srcdir being included in error messages
	# some references still remain in libxul.so and omni.ja
	CFLAGS+=" -ffile-prefix-map=$srcdir=."
	CXXFLAGS+=" -ffile-prefix-map=$srcdir=."

	# suppress warnings
	CFLAGS+=" -w"
	CXXFLAGS+=" -w"

	_disable_pgo=y #comment this to enable building the profiled browser and using PGO

	if [[ -z $_disable_pgo ]]; then
 # Do 3-tier PGO
	echo "Building instrumented browser..."
	cat >.mozconfig ../mozconfig - <<EOT
ac_add_options --enable-profile-generate=cross
EOT
	./mach build

	echo "Profiling instrumented browser..."
	./mach package
	LLVM_PROFDATA=llvm-profdata \
		JARLOG_FILE="$PWD/jarlog" \
		xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
		./mach python build/pgo/profileserver.py

	stat -c "Profile data found (%s bytes)" merged.profdata
	test -s merged.profdata

	stat -c "Jar log found (%s bytes)" jarlog
	test -s jarlog

	echo "Removing instrumented browser..."
	./mach clobber

	echo "Building optimized browser..."
	cat >.mozconfig ../mozconfig - <<EOT
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
EOT
else
	./mach build

	echo "Building symbol archive..."
	./mach buildsymbols

	./mach package
	./mach package-multi-locale --locales ar cs da de el en-US en-GB es-ES fr hu id it ja ko lt nl nn-NO pl pt-BR pt-PT ru sv-SE th tr uk zh-CN zh-TW
fi
}

package () {
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

#first browser package, second icon file 
sha256sums=('b491a4009b949abf09d352052e9e1b9d26bf5c05f3dbe5ee8c55ffa0a41c5af0'
            'fa87c5b01d38fddb67a7c3512acf622bc3eef2f90d2ff439cbde6d363849efd2'
            '3c8a3e73ffcb4670ca25fc7087b9c5d93ebbef2f3be8a33cf81ae424c3f27fa3'
            '7e7042f0ce7808c72ee1225f709db09764ffeb023b7543d39e1ba7d65dd33cef'
            '21dfd320408ffd57239eabf13df493fe7d575be6b12b07554f8454c233750ab2'
            '0abdfbbf6040f694507c5e33bc3d2d06ddffdf309ce6f6da9484ae268382f731'
            '8626d64e0250e8121255029097ba5f67e47a9d427e0143b8b8d1df3460a03be6'
            '9ad654556a5d3a891675863252a368fba5dc1f5bdfb4d2367466f9fd24a07fe5')
