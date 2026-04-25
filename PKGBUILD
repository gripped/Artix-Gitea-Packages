# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>

_pkgbase='intel-oneapi-compiler-dpcpp'
_pkgname="${_pkgbase}-cpp"
pkgbase="${_pkgname}-runtime"
pkgname=("${_pkgname}-runtime" "${_pkgname}-runtime-libs")
pkgver=2025.3.3_30
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
_pkgdesc="Intel oneAPI Data Parallel C++ compiler"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-EULA-Developer-Tools")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${_pkgname}-common-${_majmin}-${_pkgver}_all.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${_pkgbase}-eclipse-cfg-${_pkgver}_all.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-icc-eclipse-plugin-cpp-${_majmin}-${_pkgver}_all.deb")
b2sums=('35f32880c719c04452f935f5eaa4e02d55a462b45950bc6acad2d976b36cd6fe92d23fc0f739372180088485d95a5d8072dada697da141b6df131ef57b23eae4'
        '839d433abbf1ae35b8c5700e3dd77c9430298dbff651b5879b36b5d0b24dee2627b8eaad05e847e1df276c5818c31b704e7f859eda21bd0bc06ea9c05269ef72'
        '3fd68f7ef6b5f7976690b5c66c0aa073a323f63c803649f6396cdf6570be7823bc2b7f30c17fad9860d784bf1b9171a410f24560de3bca01e665daf089ed5259'
        'ea93f0ebd630400f04763fdb3f94f4d6d66b900926ca06780881e8640826a47f5559a89f9d217f38b11986887f881bfd7c86ff6f0cff4e347ef253b3b2446aac')
noextract=(
    "${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
    "${_pkgname}-common-${_majmin}-${_pkgver}_all.deb"
    "${_pkgbase}-eclipse-cfg-${_pkgver}_all.deb"
    "intel-oneapi-icc-eclipse-plugin-cpp-${_majmin}-${_pkgver}_all.deb"
)

build() {
    mkdir "${_pkgbase}-${pkgver}"
    ar x "${srcdir}/${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
	tar xvf data.tar.xz -C "${_pkgbase}-${pkgver}"
    rm data.tar.xz

    ar x "${srcdir}/${_pkgname}-common-${_majmin}-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${_pkgbase}-${pkgver}"
    rm data.tar.xz

    ar x "${srcdir}/${_pkgbase}-eclipse-cfg-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${_pkgbase}-${pkgver}"
    rm data.tar.xz

    ar x "${srcdir}/intel-oneapi-icc-eclipse-plugin-cpp-${_majmin}-${_pkgver}_all.deb"
    tar xvf data.tar.xz -C "${_pkgbase}-${pkgver}"
    rm data.tar.xz

    mkdir "${_pkgbase}-${pkgver}-libs"
    local _lib_path="/opt/intel/oneapi/compiler/${_majmin}"
    install -d "${_pkgbase}-${pkgver}-libs/${_lib_path}/lib"
    cd "${_pkgbase}-${pkgver}/${_lib_path}/lib"
    local _lib
    for _lib in libur_* libsycl*; do
        mv "${_lib}" "${srcdir}/${_pkgbase}-${pkgver}-libs/${_lib_path}/lib"
    done
}

package_intel-oneapi-compiler-dpcpp-cpp-runtime-libs() {
    depends=(
      'intel-oneapi-compiler-shared-runtime-libs'
      'intel-oneapi-umf'
      'intel-oneapi-tbb'
      'intel-oneapi-common'
    )
    conflicts=('intel-oneapi-basekit')
    pkgdesc="${_pkgdesc}: Minimal runtime libraries"

    cp -a "${srcdir}/${_pkgbase}-${pkgver}-libs/opt" "${pkgdir}"

    # allow libs to be found
    local _lib_path='/opt/intel/oneapi/compiler'
    local _ldso_conf="${pkgdir}"/etc/ld.so.conf.d
    install -d "${_ldso_conf}"
    echo "${_lib_path}/latest/linux/lib" > "${_ldso_conf}/${pkgname}.conf"

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}

package_intel-oneapi-compiler-dpcpp-cpp-runtime() {
    depends=(
      'intel-oneapi-compiler-shared-runtime'
      'intel-oneapi-compiler-dpcpp-cpp-runtime-libs'
      'intel-oneapi-common'
    )
    provides=(
      'intel-oneapi-compiler-dpcpp-cpp-common'
      'intel-oneapi-compiler-dpcpp-eclipse-cfg'
      'intel-oneapi-icc-eclipse-plugin-cpp'
    )
    conflicts=('intel-oneapi-basekit')
    pkgdesc="${_pkgdesc}: Full runtime libraries and header files"

    cp -a "${srcdir}/${_pkgbase}-${pkgver}/opt" "${pkgdir}"

    # allow libs to be found
    local _lib_path='/opt/intel/oneapi/compiler'
    local _ldso_conf="${pkgdir}"/etc/ld.so.conf.d
    install -d "${_ldso_conf}"
    echo "${_lib_path}/latest/linux/lib/x64" >> "${_ldso_conf}/${pkgname}.conf"

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}
