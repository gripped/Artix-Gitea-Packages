# Maintainer: commandk <commandk@artixlinux.org>
# run pgo build or not with X(vfb)
: ${_build_profiled:=false}

epoch=1
pkgname=konform-browser
provides=(konform-browser)
conflicts=()
_pkgname="${pkgname}"
__pkgname=konform
pkgdesc="Firefox ESR fork with increased security, privacy, and customizability"
url="https://konform-browser.codeberg.page"
_l10n_commit=1e95d1c5f519c3fbde715345ae7beb56a2c79077

pkgver=153.7.0.100rc3

pkgrel=1
_ffbuild=1
_srcver="${pkgver%.*}"
_ffsrcver="${_srcver/.0.0/.0}"
_lwrelver="${pkgver##*.}"
if [[ "$_ffbuild" == "0" ]]; then
  : "${_ffsrcurl:="https://archive.mozilla.org/pub/firefox/releases/${_ffsrcver}esr"}"
else
  : "${_ffsrcurl:="https://archive.mozilla.org/pub/firefox/candidates/${_ffsrcver}esr-candidates/build${_ffbuild}"}"
fi
arch=(x86_64 aarch64)
license=(MPL-2.0)

depends=(
  dbus
  alsa-lib
  at-spi2-core
  cairo
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libpulse
  libvpx.so
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  libwebp.so
  mime-types
  nspr
  pango
  pixman
  sh
  zlib
)
makedepends=(
  binutils
  cbindgen
  clang
  diffutils
  git
  imake
  inetutils
  jack
  jq
  lld
  llvm
  llvm-libs
  mesa
  nasm
  nodejs
  pciutils
  python
  python-filelock
  python-setuptools
  rust
  unzip
  wasi-compiler-rt
  wasi-libc++
  wasi-libc++abi
  wasi-libc
  xz
  yasm
  zip

  # for generating sources
  gnupg
  tree
  wget
) # pciutils: only to avoid some PGO warning
optdepends=(
  'hunspell-dictionary: Spell checking'
  'ffmpeg: additional video and audio codec support'
  'openh264: H264 video decoding support'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
  'firefox-ublock-origin: Content filter extension'
  'firefox-noscript: Selectively enable javascript on pages'
  'firefox-decentraleyes: Local emulation of Content Delivery Networks'
)

if [[ "${_build_profiled}" == "true" ]]; then
  makedepends+=(
    xorg-server-xvfb
  )
fi

backup=("usr/lib/${__pkgname}/librewolf.cfg"
        "usr/lib/${__pkgname}/distribution/policies.json")
options=(
  !debug
  !emptydirs
  !lto
  !makeflags
)

_ff_source_tarball="firefox-${_ffsrcver}esr.source.tar.xz"
_src_repo=https://codeberg.org/konform-browser/source
_src_dir="src"
#if [[ "${_ffsrcver%%.*}" -gt 160  ]]; then
#  _src_repo=https://codeberg.org/konform-browser/konform-next
#  _src_dir="src-${_ffsrcver%%.*}"
#  install=konform-browser-testing.install
#fi
source=(
  "${_src_dir}"::"git+${_src_repo}.git#tag=${pkgver}"
  "firefox-${_ffsrcver}esr-${_ffbuild}.source.tar.xz"::"${_ffsrcurl}/source/${_ff_source_tarball}"
  "firefox-${_ffsrcver}esr-${_ffbuild}.source.tar.xz.asc"::"${_ffsrcurl}/source/${_ff_source_tarball}.asc"
  "firefox-l10n-${_l10n_commit}.tar.gz"::"https://github.com/mozilla-l10n/firefox-l10n/archive/$_l10n_commit.tar.gz"
  "security-state--intermediates-${pkgver}.zip::${_src_repo}/releases/download/${pkgver}/security-state--intermediates.zip"
  "${__pkgname}.desktop"
  "default192x192.png"
  "entrypoint.sh"
)
sha256sums=('be8040eec0b85a436e634370ef9b7c3f4ef56f619006128f29f35a3fa6ba695d'
            '7f8715ee7de2cf36a156216a9b1c7f26d1653010e65793bb2fce66e12edb6ea0'
            'SKIP'
            '5cda6675c1d51c6b16395a6be861f980968ed884a404d68d465e8fea87009ef5'
            '6479f3065374bacf330a33964c82d8296a0e36b7aa1bac42fba594ad828c0a46'
            '68fb47f178d5c3412162d3bb8f74abbfcf1977e0ea4dc69647580ff6f8a93fb4'
            'b86ddfc0cec482f7900f296857cdd0f1b736ff5037e0a86712b258ae0092924b'
            'c683b93bcb843da6de51ee49dd163c6eb9889f27988357aba3ca8766abd76f2e')

validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)
noextract=("security-state--intermediates-${pkgver}.zip")
_languages=(
    ach af an ar ast az be bg bn br bs ca-valencia ca cak cs cy da de dsb el
    en-CA en-GB en-US eo es-AR es-CL es-ES es-MX et eu fa ff fi fr fy-NL ga-IE
    gd gl gn gu-IN he hi-IN hr hsb hu hy-AM ia id is it ja ka kab kk km kn ko lij
    lt lv mk mr ms my nb-NO ne-NP nl nn-NO oc pa-IN pl pt-BR pt-PT rm ro ru si sk sl
    son sq sr sv-SE ta te th tl tr trs uk ur uz vi xh zh-CN zh-TW
)

prepare() {
  _lw_srcdir="$srcdir/${_src_dir}/source-$_srcver"
  ## <srcprep>
  cp -p *.desktop *.png "${_src_dir}"

  cd "${_src_dir}"
  mkdir -p mozbuild
  echo "${_lwrelver}" > release
  rm -rf "${_lw_srcdir}/"* "${_lw_srcdir}/".*
  mkdir -p "${_lw_srcdir}"
  mv "${srcdir}/firefox-${_ffsrcver%b*}"/* "${srcdir}/firefox-${_ffsrcver%b*}"/.* "${_lw_srcdir}/"
  mkdir -p "${_lw_srcdir}/lw"
  mv "../firefox-l10n-${_l10n_commit}" "${_lw_srcdir}/lw/l10n"
  mv "../security-state--intermediates-${pkgver}.zip" "services/settings/dumps/security-state/intermediates/security-state--intermediates.zip"

  python3 scripts/apply-patches.py "${_srcver}" "${_lwrelver}"

  ## </srcprep>

  cd $_lw_srcdir
  mv mozconfig ../mozconfig || true

  cat >>../mozconfig <<END
ac_add_options --disable-install-strip
ac_add_options --enable-system-pixman
ac_add_options --enable-linker=lld
ac_add_options --prefix=/usr
ac_add_options --disable-bootstrap

export CC='clang'
export CXX='clang++'

# Branding
ac_add_options --with-app-name=${__pkgname}
export MOZ_APP_REMOTINGNAME=${__pkgname}

# System libraries
ac_add_options --with-system-nspr

## Kon moar system libs
ac_add_options --with-system-zlib
ac_add_options --with-system-webp
ac_add_options --with-system-libvpx

# Features
# keep alsa option in here until merged upstream
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-pulseaudio

# wasi
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# options for ci / weaker build systems
mk_add_options MOZ_PARALLEL_BUILD=1
mk_add_options MOZ_MAKE_FLAGS="-j4"
# ac_add_options --enable-linker=gold

# optimizations
ac_add_options OPT_LEVEL="2"
ac_add_options RUSTC_OPT_LEVEL="2"
END

if [[ "${CARCH}" == "aarch64" ]]; then
  cat >>../mozconfig <<END
ac_add_options --enable-optimize="-g0 -O2"

ac_add_options --enable-lto
END

  export MOZ_DEBUG_FLAGS=" "
  export CFLAGS+=" -g0"
  export CXXFLAGS+=" -g0"
  export RUSTFLAGS="-Cdebuginfo=0"

else

  cat >>../mozconfig <<END
ac_add_options --enable-lto=cross
END
fi

  # reduce chance of builds failung during linking due to running out of memory
  export LDFLAGS+=" -Wl,--no-keep-memory"
}


build() {
  _lw_srcdir="$srcdir/${_src_dir}/source-$_srcver"
  cd "${_lw_srcdir}"

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_NOSPAM=1
  export MOZ_REQUIRE_SIGNING=

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-v/}"

  # sacrifice cpu for memory to prevent OoM
  export LDFLAGS+=" -Wl,--no-keep-memory"

  # Do 3-tier PGO
  if [[ "${_build_profiled}" == "true" ]]; then
    if [[ "${CARCH}" == "aarch64" ]]; then

      cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate
export MOZ_ENABLE_FULL_SYMBOLS=1
END

    else

      cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
export MOZ_ENABLE_FULL_SYMBOLS=1
END

    fi

    # temporarily disable ublock-origin, interferes with profiling
    cp "browser/components/enterprisepolicies/defaults/policies.json" "$srcdir/policies.json"
    jq 'del(.policies.Extensions.Install)' "$srcdir/policies.json" > "browser/components/enterprisepolicies/defaults/policies.json"
    # temporarily enable nimbus telemetry for profiling
    sed -i 's#^.*nimbus\.#// \0#' "browser/app/profile/librewolf.cfg"

    echo "Building instrumented browser..."

    ./mach build --priority normal

    echo "Profiling instrumented browser..."

    ./mach package

    local _headless_env=(
      LIBGL_ALWAYS_SOFTWARE=true \
      LLVM_PROFDATA=llvm-profdata \
        JARLOG_FILE="$PWD/jarlog" \
        dbus-run-session
    )

    local _headless_run=(
      xvfb-run
      -s "-screen 0 1920x1080x24 -nolisten local"
    )

    env "${_headless_env[@]}" "${_headless_run[@]}" -- ./mach python build/pgo/profileserver.py

    echo "Removing instrumented browser..."
    ./mach clobber objdir

    echo "Building optimized browser..."

    if [[ -s merged.profdata ]]; then
      stat -c "Profile data found (%s bytes)" merged.profdata

      if [[ "${CARCH}" == "x86_64" ]]; then
        cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-use
END
      else
        cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-use=cross
END
      fi

      cat >> .mozconfig - << END
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
END
    else
      echo "Profile data not found."
    fi

    if [[ -s jarlog ]]; then
      stat -c "Jar log found (%s bytes)" jarlog
      cat >> .mozconfig - << END
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
    else
      echo "Jar log not found."
    fi

    # reenable non-profiling policies
    cp "$srcdir/policies.json" "browser/components/enterprisepolicies/defaults/policies.json"
    # disable nimbus telemetry
    cp "${_lw_srcdir}/browser/app/profile/librewolf.cfg" "browser/app/profile/librewolf.cfg"

  else
    cat >.mozconfig ../mozconfig
  fi
  rm -f ../mozconfig  ./mozconfig

  ./mach build --priority normal
}

package() {
  _lw_srcdir="$srcdir/${_src_dir}/source-$_srcver"
  cd "${_lw_srcdir}"
  MOZ_PKG_FORMAT=tar ./mach pack-multi-locale --locales ${_languages[@]}
  DESTDIR="$pkgdir" MOZ_CHROME_MULTILOCALE="${_languages[*]}" ./mach install

  rm -f "${pkgdir}/usr/lib/pingsender"

  local vendorjs="$pkgdir/usr/lib/$__pkgname/browser/defaults/preferences/vendor.js"

  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

  local distini="$pkgdir/usr/lib/$__pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END

[Global]
id=org.codeberg.${_pkgname}
version=1.0
about="Konform Browser"

[Preferences]
app.distributor="Artix Linux"
app.distributor.channel=${_pkgname}
app.partner.artixlinux=artixlinux
END

  # Link up system ONNX runtime
  ln -sv "/usr/lib/libonnxruntime.so" -t "${pkgdir}/usr/lib/${__pkgname}/"

  for i in 16 32 48 64 128; do
    install -Dvm644 browser/branding/vendor/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$__pkgname.png"
  done
  install -Dvm644 ${srcdir}/default192x192.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$__pkgname.png"

  # arch upstream provides a separate svg for this. we don't have that, so let's re-use 16.png
  install -Dvm644 browser/branding/vendor/default16.png \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$__pkgname-symbolic.png"

  install -Dvm644 ${srcdir}/$__pkgname.desktop \
    "$pkgdir/usr/share/applications/$__pkgname.desktop"

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1553771
  install -Dvm755 "${srcdir}/entrypoint.sh" "${pkgdir}/usr/lib/${__pkgname}/${__pkgname}"

  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "${pkgdir}/usr/lib/${__pkgname}/${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
  ln -s "${__pkgname}" "${pkgdir}/usr/bin/${_pkgname}" || true
}
