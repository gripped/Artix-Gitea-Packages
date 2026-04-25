# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>

_pkgname='intel-oneapi-compiler-shared'
pkgbase="${_pkgname}-runtime"
pkgname=("${_pkgname}-runtime" "${_pkgname}-runtime-libs")
pkgver=2025.3.3_30
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
_pkgdesc="Intel oneAPI compiler runtime libraries"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-EULA-Developer-Tools")
depends=('level-zero-loader')
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${_pkgname}-common-${_majmin}-${_pkgver}_all.deb")
b2sums=('ccc7da489104f41efacd0912174094e188426b87408b32c66b3e7b173897a42eaf1e73b9522bb6a827af2ec0bba01fc2ac92600be242a43f3a58782717ae6974'
        'e087f54f1a0197e58b28eadc44aa03a5b92e416936e0861412f0d715fe7a3917240d9647072f9c0652e091e08f663613a2fbcb253ce796dd1f2e44083d9b561c')

noextract=(
    "${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    "${_pkgname}-common-${_majmin}-${_pkgver}_all.deb"
)
_lib_path='/opt/intel/oneapi/compiler'

prepare() {
    mkdir "${_pkgname}-${pkgver}"
    ar x "${srcdir}/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    tar xvf data.tar.xz -C "${_pkgname}-${pkgver}"
    rm data.tar.xz
    ar x "${srcdir}/${_pkgname}-common-${_majmin}-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${_pkgname}-${pkgver}"
    rm data.tar.xz
}

build() {
    mkdir libs
    install -d "libs/${_lib_path}/${_majmin}/bin"

    local _bin
    for _bin in aocl-ioc64 compiler icx-cc icx-cl ioc64 sycl-ls sycl-trace; do
        mv "${_pkgname}-${pkgver}/${_lib_path}/${_majmin}/bin/${_bin}" \
           "libs/${_lib_path}/${_majmin}/bin"
    done

    local _lib
    install -d "libs/${_lib_path}/${_majmin}/lib"
    for _lib in libsvml.so libirng.so libimf.so libintlc.so libintlc.so.5; do
        mv "${_pkgname}-${pkgver}/${_lib_path}/${_majmin}/lib/${_lib}" \
           "libs/${_lib_path}/${_majmin}/lib"
    done

    mkdir most
    cp -a "${_pkgname}-${pkgver}"/* most
}

package_intel-oneapi-compiler-shared-runtime-libs() {
    depends=('intel-oneapi-common' 'intel-oneapi-openmp' 'glibc' 'gcc-libs'
             'zlib')
    conflicts=('intel-oneapi-basekit')
    pkgdesc="${_pkgdesc}: Minimal compiler libraries"

    cp -a libs/* "${pkgdir}"

    # allow libs to be found
    local _ldso_conf="${pkgdir}"/etc/ld.so.conf.d
    install -d "${_ldso_conf}"
    echo "${_lib_path}/latest/lib" >> "${_ldso_conf}/${pkgname}.conf"

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}

package_intel-oneapi-compiler-shared-runtime() {
    depends=('intel-oneapi-openmp' 'intel-oneapi-common' 'intel-oneapi-compiler-shared-runtime-libs'
             'libxml2' 'glibc' 'gcc-libs' 'level-zero-loader' 'zlib')
    provides=("${_pkgname}-common" "opencl-driver")
    conflicts=('intel-oneapi-basekit')
    pkgdesc="${_pkgdesc}"

    cp -a most/* "${pkgdir}"

    # allow libs to be found
    local _ldso_conf="${pkgdir}"/etc/ld.so.conf.d
    install -d "${_ldso_conf}"
    echo "${_lib_path}/latest/linux/lib" > "${_ldso_conf}/${pkgname}.conf"
    echo "${_lib_path}/latest/linux/lib/x64" >> "${_ldso_conf}/${pkgname}.conf"

    echo '/opt/intel/oneapi/compiler/latest/lib/libintelocl.so' > 'intelocl.icd'
    install -Dm644 'intelocl.icd' "$pkgdir/etc/OpenCL/vendors/intelocl.icd"

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}
