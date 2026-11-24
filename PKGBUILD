# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=python-tensile
pkgver=10.2
pkgrel=1
pkgdesc="benchmark-driven backend libraries for general matrix-matrix multiplications"
arch=('any')
url='https://rocm.docs.amd.com/projects/Tensile/en/latest/'
license=('MIT')
depends=('python' 'python-msgpack' 'python-pyaml' 'python-joblib')
makedepends=('git' 'cmake' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
_git='https://github.com/ROCm/rocm-libraries'
source=("rocm-libraries::git+$_git.git#tag=therock-$pkgver"
        # Generic GPU targets, https://github.com/ROCm/rocm-libraries/pull/5243
        "tensile-asm-caps-warning.patch::$_git/commit/2e2aeb071a42901c336c7351dc1c1cab5ca078b4.patch"
        "tensile-generic-solution-index.patch::$_git/commit/12b510b561fa2e198b51715ac2677e20cb7e6b6c.patch"
        # Commit c01aaa877ee5bbcc442a8ef7bf2bad2322cf1088 of the same pull request,
        # rebased by Fedora, and gfx1170 from Fedora, see
        # https://src.fedoraproject.org/rpms/rocblas/tree/6b56d7b0f92f1b66e9d8becc92a61c8214ebc255
        "0002-add-generic-gpu-targets.patch"
        "0001-tensile-add-gfx1170.patch"
        # Load generic code objects if no arch-specific one exists, from Debian, see
        # https://salsa.debian.org/rocm-team/rocblas/-/tree/5f036a6837b35f6e29795955705633d2b158cbe3/debian/patches
        "tensile-fallback-generic-codeobject-lookup.patch")
sha256sums=('960cacc3e77176493d285031b6ee2f8f5ef1f75118479d691c761276d2590be1'
            'be3bfe4c21ef3df4b05c3789c5b4894f63ce1d925f0525f85f402ed28bf007cc'
            '7908c1fe38e433da2eade3e47db587104c5bef9f8671a5738d9781a893c04699'
            'eb0e1b763d3158b5ab56e6c46a4fc8ebde1494e4a74e5292a93cb8ee2ce6b6fc'
            '7894d8b63c70157f519ccc9b56a03127cf563b9498a1e11b5c75067c335442b4'
            '370172a3e8ebb75256523af742125f1670a02b7acbc773fa7aac5eeb8321ed3b')
_dirname="rocm-libraries/shared/tensile"

prepare() {
	cd ${_dirname}

	# Generic GPU targets, https://github.com/ROCm/rocm-libraries/pull/5243
	patch -Np3 -i "$srcdir/tensile-asm-caps-warning.patch"
	patch -Np3 -i "$srcdir/0002-add-generic-gpu-targets.patch"
	patch -Np3 -i "$srcdir/tensile-generic-solution-index.patch"
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
