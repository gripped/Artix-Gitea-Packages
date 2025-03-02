# Maintainer: artist for Artix Linux

pkgname=waterfox
pkgver=6.5.4
pkgrel=1.1
pkgdesc='Fork of Mozilla Firefox featuring some privacy, usability, and speed enhancements.'
arch=(x86_64)
license=('GPL-2.1')
url='https://www.waterfox.net/'
depends=(
	gtk3
	libxt
	mime-types
	dbus-glib
	nss
	ttf-font
)
makedepends=(
	cbindgen
	clang
	diffutils
	dump_syms
        git
	imake
	jack
        libpulse
	lld
	llvm
	mercurial
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
	'hunspell-en_US: Spell checking, American English'
	'libnotify: Notification integration'
	'networkmanager: Location detection via available WiFi networks'
	'pulseaudio: Audio support'
	'speech-dispatcher: Text-to-Speech'
	'xdg-desktop-portal: Screensharing with Wayland'
)

options=(!emptydirs !makeflags !strip)
source=("git+https://github.com/BrowserWorks/l10n.git"
	"$pkgname-$pkgver.tar.gz::https://github.com/WaterfoxCo/Waterfox/archive/refs/tags/$pkgver.tar.gz"
	"$pkgname.desktop"
	"$pkgname-symbolic.svg"
        license.html
)

prepare () {
	mkdir -p mozbuild
	cd "Waterfox-$pkgver"
        mv ../l10n/* waterfox/browser/locales/

	cat > ../mozconfig <<EOT
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

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
mk_add_options MOZ_TELEMETRY_REPORTING=0
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
EOT
}

build () {
	cd Waterfox-$pkgver

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END

export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security -fstack-clash-protection -fcf-protection"
export CXXFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security -fstack-clash-protection -fcf-protection -Wp,-D_GLIBCXX_ASSERTIONS"
export "LDFLAGS=-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"

  ./mach build --priority normal

  echo "Profiling instrumented browser..."
  ./mach package
  LLVM_PROFDATA=llvm-profdata JARLOG_FILE="$PWD/jarlog" \
    dbus-run-session \
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    ./mach python build/pgo/profileserver.py

  stat -c "Profile data found (%s bytes)" merged.profdata
  test -s merged.profdata

  stat -c "Jar log found (%s bytes)" jarlog
  test -s jarlog

  echo "Removing instrumented browser..."
  ./mach clobber objdir

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build --priority normal
}

package () {
	cd Waterfox-$pkgver
	DESTDIR="$pkgdir" ./mach install

	local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
	install -Dvm644 /dev/stdin "$vendorjs" <<EOT
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);
EOT

	local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
	install -Dvm644 /dev/stdin "$distini" <<EOT
[Global]
id=artixlinux
version=1.0
about=Waterfox for Artix Linux

[Preferences]
app.distributor=artixlinux
app.distributor.channel=$pkgname
EOT

	cd $pkgname

	for i in 16 22 24 32 48 64 128 256; do
		install -Dm644 browser/branding/default$i.png \
			"$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
	done
	install -Dm644 browser/branding/content/about-logo.png \
		"$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"
	install -Dm644 browser/branding/content/about-logo@2x.png \
		"$pkgdir/usr/share/icons/hicolor/384x384/apps/$pkgname.png"
	install -Dm644 "$srcdir/$pkgname-symbolic.svg" \
		"$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.svg"

	install -Dvm644 $srcdir/$pkgname.desktop \
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

sha256sums=('SKIP'
            '7211b252a927be58356af1558c1195a520bc427450ec528f5ab7e20874baa812'
            '1edf74423d201cbfd4162353c2fa040bb29da9db1d3f46d7fd2eff0209140e85'
            'cf446278bf25a081a25818574d40e6820ca16d3469e62308ae1675d764844174'
            '9ad654556a5d3a891675863252a368fba5dc1f5bdfb4d2367466f9fd24a07fe5')
