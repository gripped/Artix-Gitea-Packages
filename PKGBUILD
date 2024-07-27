# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgbase=python-pyopencl
_name="${pkgbase#python-}"
pkgname=('python-pyopencl' 'pyopencl-headers')
pkgver=2024.2.6
pkgrel=2.1
epoch=1
pkgdesc="A complete, object-oriented language binding of OpenCL to Python"
arch=('x86_64')
url="https://documen.tician.de/pyopencl/"
license=(
    'Apache-2.0'
    'BSD-3-Clause'
    'MIT'
    'MIT'
)
makedepends=(
    'ctags'
    'git'
    'nanobind'
    'ocl-icd'
    'opencl-headers'
    'pybind11'
    'python-appdirs'
    'python-build'
    'python-installer'
    'python-mako'
    'python-numpy'
    'python-platformdirs'
    'python-scikit-build-core'
    'python-pip'
    'python-devtools'
)
# NOTE: we install all available OpenCL drivers so that tests don't fail on PLATFORM_NOT_FOUND_KHR
checkdepends=(
    'intel-compute-runtime'
    'opencl-clover-mesa'
    'opencl-nvidia'
    'opencl-rusticl-mesa'
    'python-pytest'
    'python-pytools'
    'python-six'
    'rocm-opencl-runtime'
)
source=(
    "git+https://github.com/inducer/pyopencl.git?signed#tag=v${pkgver}"
    git+https://github.com/inducer/compyte
)
validpgpkeys=("900A958D9A0ACA58B1468F2471AA298BCA171145") # Andreas Ratchke
sha256sums=('12898a9c815268b746689a9a0b0cad22cb7b8097d53c26f2e7392a1d15a4eb23'
            'SKIP')

prepare() {
    cd $_name
    git cherry-pick -n 9f505f78e9a545d87ca2f8d9083897286a51495d
    git submodule init
    git config submodule.pyopencl/compyte.url ../compyte
    git -c protocol.file.allow=always submodule update

    # extract separate license files
    sed -n '1,24p' LICENSE > ../MIT.PyOpenCL.txt
    sed -n '26,48p' LICENSE > ../Apache-2.0.txt
    sed -n '52,80p' LICENSE > ../BSD-3-Clause.txt
    sed -n '82,101p' LICENSE > ../MIT.RANLUXCL.txt

    # we do not not ship placeholder build dependencies
    sed -i '/oldest-supported-numpy/d' pyproject.toml
}

build() {
    cd $_name
    pip wheel -w dist/ . pyopencl
}

package_python-pyopencl() {
    depends+=(
        'gcc-libs'
        'glibc'
        'ocl-icd'
        'python'
        'python-appdirs'
        'python-mako'
        'python-numpy'
        'python-platformdirs'
        'python-pytools'
        'python-setuptools'
    )

    cd $_name
    pip install --no-deps dist/pyopencl* --prefix="${pkgdir}/usr"

    install -vDm644 ../*.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

package_pyopencl-headers() {
    cd $_name
 
    install -Dm644 $_name/cl/*.cl -t "${pkgdir}"/usr/include/$_name
    install -vDm644 ../*.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
