# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=python-tensile
pkgver=10.0
pkgrel=2
pkgdesc="benchmark-driven backend libraries for general matrix-matrix multiplications"
arch=('any')
url='https://rocm.docs.amd.com/projects/Tensile/en/latest/'
license=('MIT')
depends=('python' 'python-msgpack' 'python-pyaml' 'python-joblib')
makedepends=('git' 'cmake' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
_git='https://github.com/ROCm/rocm-libraries'
source=("rocm-libraries::git+$_git.git#tag=therock-$pkgver"
        # Generic GPU targets and gfx1170 from Fedora, see
        # https://src.fedoraproject.org/rpms/rocblas/tree/6b56d7b0f92f1b66e9d8becc92a61c8214ebc255
        "0001-improve-the-warning-for-asm-caps-mismatches.patch"
        "0002-add-generic-gpu-targets.patch"
        "0003-improve-fallback-name-to-handle-generics.patch"
        "0004-generic-arches-need-a-solution-index.patch"
        "0001-tensile-add-gfx1170.patch"
        # Load generic code objects if no arch-specific one exists, from Debian, see
        # https://salsa.debian.org/rocm-team/rocblas/-/tree/5f036a6837b35f6e29795955705633d2b158cbe3/debian/patches
        "tensile-fallback-generic-codeobject-lookup.patch")
sha256sums=('bc3cc5a8f4bba70d2f7f9cb6582210a16244bfbf353cebc667db05bb756b5b20'
            '9ea9ca917de348b22f5605cd04fcc7136544f3dbd17954f25e4cbb2b2b173921'
            '58756dc67e2611c117951a52dbb7174d865ecbdbb123bb09da5a05398fb288d0'
            'd9c310660541506c90ed4278a5a4a63559eb46205ae25797de46d2b0b39e4fab'
            '9a17b4e7c1c6c0c05c7bff4ea548a29781c41d478a836340515cbc2a7de655ac'
            '65475c238c957193c07684900e689604c7116a048dff52fc7b0ec715c85ada39'
            '370172a3e8ebb75256523af742125f1670a02b7acbc773fa7aac5eeb8321ed3b')
_dirname="rocm-libraries/shared/tensile"

prepare() {
	cd ${_dirname}

	# Generic GPU targets, https://github.com/ROCm/rocm-libraries/pull/5243
	patch -Np3 -i "$srcdir/0001-improve-the-warning-for-asm-caps-mismatches.patch"
	patch -Np3 -i "$srcdir/0002-add-generic-gpu-targets.patch"
	patch -Np3 -i "$srcdir/0003-improve-fallback-name-to-handle-generics.patch"
	patch -Np3 -i "$srcdir/0004-generic-arches-need-a-solution-index.patch"
	patch -Np3 -i "$srcdir/0001-tensile-add-gfx1170.patch"
	# https://github.com/ROCm/rocm-libraries/issues/9366
	patch -Np2 -i "$srcdir/tensile-fallback-generic-codeobject-lookup.patch"

	# https://src.fedoraproject.org/rpms/python-tensile/blob/rawhide/f/python-tensile.spec#_85
	sed -i -e 's@${Tensile_PREFIX}/bin/TensileGetPath@TensileGetPath@g' Tensile/cmake/TensileConfig.cmake
	sed -i -e 's@opt/rocm@usr@g' Tensile/Common.py
	sed -i -e 's@opt/rocm@usr@g' Tensile/Tests/yaml_only/test_config.py
	sed -i -e 's@globalParameters["IgnoreAsmCapCache"] = False@globalParameters["IgnoreAsmCapCache"] = True@' Tensile/Common.py
	sed -i -e 's@arguments["IgnoreAsmCapCache"] = args.IgnoreAsmCapCache@arguments["IgnoreAsmCapCache"] = True@' Tensile/TensileCreateLibrary.py
	sed -i -e 's@if not ignoreCacheCheck and derivedAsmCaps@if False and derivedAsmCaps@' Tensile/Common.py
}

build() {
	cd ${_dirname}
	python -m build --wheel --no-isolation
}

package() {
	cd ${_dirname}
	python -m installer --destdir="$pkgdir" dist/*.whl
	# cmake files are installed to the wrong location, /usr/cmake.
	# Move them to the right directory.
	mkdir -p "$pkgdir"/usr/lib/cmake/Tensile
	mv "$pkgdir"/usr/cmake/* "$pkgdir"/usr/lib/cmake/Tensile
	rm -rf "$pkgdir"/usr/cmake
	install -vDm644 LICENSE.md "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
