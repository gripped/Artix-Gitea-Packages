# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: rudy.matela

pkgbase=z3
pkgname=(z3 python-z3-solver z3-java)
pkgver=5.3.3
pkgrel=1
pkgdesc='High-performance theorem prover'
url='https://github.com/Z3Prover/z3'
arch=(x86_64)
license=(MIT)
makedepends=(
  cmake
  git
  glibc
  jdk-openjdk
  libgcc
  libstdc++
  ninja
  python
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(
  git+https://github.com/Z3Prover/z3.git#tag=z3-$pkgver
  z3-python-do-not-rebuild.patch
)
sha512sums=('91d84f5eac7bc8e431e6d479401f2eddb86ba8ccd02af6a8a96395b0d27a13a721982e11dc8010a1aef29980a2fb0c2f19bed551a81c32d59ad8b379ca9f5273'
            'da5dec288c60eb38d92756e2c3a3bc7f507f980f4beed0187c2da5b4c719134908168d9fd6ebac4a96076af362904e784b62a21b3baa49c36228bfe9ef617270')
b2sums=('9b4ddb0ffab007d54b2ba9efddac1f0d0a9f6e5dfa2aba9593a42337e1a4132259046f63d91f5929dffea3c5a2ddf4b0cf6bc49476b4a3251e83152e6d12f965'
        'b86f473fdd084f2324de9af52ab8c12e33c9e3c05d984108593b75e2e2af4256d3040082757619c8aca9125afc81e9eda9aa594142ff6f25829ed8ac2c6a35b8')

prepare() {
  cd z3
  patch -Np1 -i ../z3-python-do-not-rebuild.patch
}

build() {
  cd z3

  # /usr/bin/z3 uses malloc_usable_size, which is incompatible with fortification level 3
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  cmake \
    -Bbuild \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_JAVA_COMPILE_FLAGS='--release;8' \
    -DZ3_INCLUDE_GIT_DESCRIBE=OFF \
		-DZ3_INCLUDE_GIT_HASH=OFF \
    -DZ3_LINK_TIME_OPTIMIZATION=1 \
    -DZ3_BUILD_PYTHON_BINDINGS=1 \
    -DZ3_BUILD_JAVA_BINDINGS=1 \
    -DPYTHON_EXECUTABLE=/usr/bin/python
  cmake --build build
  cmake --build build --target test-z3

  cd src/api/python
  python -m build --wheel --no-isolation
}

check() {
  cd z3
  ./build/test-z3 -a
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv -v "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_z3() {
  depends=(
    libgcc
    libstdc++
    glibc
  )
  provides=(
    libz3
    libz3.so
  )

  cd z3

  # use PEP517 installation instead of custom cmake dist
  pushd src/api/python
  python -m installer --destdir="$pkgdir/" dist/*.whl
  cd "$pkgdir"
  rm -r "${pkgdir}"/usr/lib/python*/site-packages/z3/{include,lib}
  _pick python usr/lib/python*
  rm -r "${pkgdir}"/*
  popd

  DESTDIR="$pkgdir" cmake --install build
  rm -r "${pkgdir}"/usr/lib/python*/
  install -Dm644 "${srcdir}/z3/LICENSE.txt" -t "$pkgdir"/usr/share/licenses/$pkgname

  cd "$pkgdir"
  _pick java usr/lib/libz3java.so
  _pick java usr/share/java/com.microsoft.z3.jar
}

package_z3-java() {
  depends=(
    glibc
    java-runtime
    libgcc
    libstdc++
    z3
  )
  mv java/* "$pkgdir"
  install -Dm644 z3/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_python-z3-solver() {
  depends=(
    python
    z3
  )
  replaces=(python-z3)
  conflicts=(python-z3)

  mv python/* "$pkgdir"

  # Support consumers expecting wheel library layout
  local _site_packages
  _site_packages=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
  install -dm755 "${pkgdir}${_site_packages}/z3/lib"
  ln -s /usr/lib/libz3.so "${pkgdir}${_site_packages}/z3/lib/libz3.so"

  install -Dm644 z3/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim: ts=2 sw=2 et:
