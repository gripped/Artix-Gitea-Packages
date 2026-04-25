# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
# Contributor: huyz
# Contributor: Jingbei Li <i@jingbei.li>
pkgbase=intel-oneapi-mkl
pkgname=("${pkgbase}" "${pkgbase}-sycl")
pkgver=2025.3.1_8
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
_pkgdesc="Intel oneAPI Math Kernel Library"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("LicenseRef-Intel-Simplified")
makedepends=('dpkg')
source=(
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-devel-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-classic-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-classic-devel-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-classic-include-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-core-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-core-devel-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-cluster-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-cluster-devel-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-include-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-devel-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-blas-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-lapack-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-dft-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-sparse-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-data-fitting-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-rng-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-stats-${_majmin}-${_pkgver}_amd64.deb"
        "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-sycl-vm-${_majmin}-${_pkgver}_amd64.deb"
        "${pkgname}.conf"
        "${pkgname}.sh")
options=('staticlibs' '!debug')
noextract=(
		   "${pkgbase}-devel-${_majmin}-${_pkgver}_amd64.deb"
		   "${pkgbase}-classic-${_majmin}-${_pkgver}_amd64.deb"
		   "${pkgbase}-classic-devel-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-classic-include-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-core-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-core-devel-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-cluster-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-cluster-devel-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-include-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-devel-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-blas-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-lapack-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-dft-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-sparse-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-data-fitting-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-rng-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-stats-${_majmin}-${_pkgver}_amd64.deb"
           "${pkgbase}-sycl-vm-${_majmin}-${_pkgver}_amd64.deb"
           )
sha256sums=('a0ff407b16b584be7d50cfab6ac8081133049ec6567e2ec922a5c99015fa5e77'
            'e629398bb30bab38af404aae18d44c2f270a3da0100e1a3124df48df42e8cba0'
            '5d6d62e721795211f48483725581fff15533b50c4ee00f55a06d6e24f1fe5925'
            '4ba39c1de76e318723c35c3043f2ad6279eb13a8658955eb4c36c595cf672f9c'
            '1648440662a5146d2064456c6e7ba23b00dbe63cb4a26e3563eb43b4912ace2f'
            'd2efe5d549803e80c3a9b3e5e092860f0acdd2f37da0e1c12de17d2e730035e6'
            '2149ca2adb7cef318ff50ea1fd6135cf873c2c4a1f3c0e396051645d992c0e7d'
            '3eb204990eb328b218bbd0a178dc40e4ac3f3a4fd7578caaf00caf7f0d732e70'
            'd3db31980517d70ba5febee14e089ac75844a9420ffde2baa43dc6f3e7269df8'
            '5fa96fb892c4b818fb176e556f3a93f99235affe0b47b7766717b9d6dcbd44ae'
            '73c70ab19f76d2c4cb64686800b2682d01a79f3a686454ff6d0b5198ce5f4e0d'
            'deb413a909822c14a6ee8eb270d5edb3351dc1c2656175ef40a7f99e025e6aab'
            '5296ef4a969688e3af40ebd851162523e3b5d4f63fea1d2f48a8dfd6a675a0a5'
            'e825872685f8b93130e32ca1b72d31cad808042f97f956b5e8e86065f94d29e8'
            '1261ee1b3ce52dfcc642ba541953af144308b2242e57ab7a32550da51882afaf'
            'ca9b47611b8e7b8503b087ca7de4ff6417325c10685d6d0254df1eb3a668aca8'
            '8559a0e7cdcd77f8f4e97c490b0d5e055605b21815e93d88383c53772f60c507'
            '426fd7795f4ef278930e2ea8a0021b4ff3460ab1c826206e01a17458cca9a9ba'
            '47f9a6fa7fcc9bcc98de93cfea2c92cfda45f9e86ddd8129176f527e53a7f7e9'
            'cd787d9843146ad5ccf28ec72311d76d95d6bb9e42974dd614d8b5aa76bb5bd9'
            '85a56750e03ad99a5b99e7296dcea411fb88c4a0a25e674c86ab48f5648d9ae9')

package_intel-oneapi-mkl() {
    pkgdesc="$_pkgdesc"
    depends=('intel-oneapi-common' 'intel-oneapi-tbb' 'intel-oneapi-openmp'
		     'glibc' 'gcc-libs' 'bash')
    replaces=('intel-mkl' 'intel-mkl-static')
    provides=('intel-mkl' 'intel-mkl-static')
    conflicts=('intel-mkl' 'intel-mkl-static' 'intel-oneapi-basekit')

    dpkg-deb -X ${pkgbase}-devel-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-classic-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-core-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-cluster-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-classic-include-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-core-devel-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-classic-devel-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-cluster-devel-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"

    # symlink mkl version
    ln -s "$_majmin" "${pkgdir}"/opt/intel/oneapi/mkl/latest

    install -Dm644 ${pkgbase}.conf "${pkgdir}"/etc/ld.so.conf.d/${pkgbase}.conf
    install -Dm644 ${pkgbase}.sh "${pkgdir}"/etc/profile.d/${pkgbase}.sh

    install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    ln -s /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
    ln -s /opt/intel/oneapi/mkl/latest/licensing "${pkgdir}"/usr/share/licenses/"${pkgname}"/mkl

    # pkgconfig
    cd "${pkgdir}"/opt/intel/oneapi/mkl/"${_majmin}"/lib/pkgconfig
    install -d "${pkgdir}"/usr/share/pkgconfig
    for _file in *.pc; do
        __file="$(basename ${_file})"
        ln -s /opt/intel/oneapi/mkl/"${_majmin}"/lib/pkgconfig/${__file} "${pkgdir}"/usr/share/pkgconfig/${__file}
        sed -e 's@prefix=.*@prefix=/opt/intel/oneapi/mkl/latest@g' -i ${__file}
    done

    # provide old intel-mkl
    install -d "${pkgdir}"/usr/bin
    install -d "${pkgdir}"/opt/intel/mkl
    install -d "${pkgdir}"/opt/intel/mkl/lib
    ln -sf /opt/intel/oneapi/mkl/latest/bin/intel64 "${pkgdir}"/opt/intel/mkl/bin
    ln -sf /opt/intel/oneapi/mkl/latest/lib/intel64 "${pkgdir}"/opt/intel/mkl/lib/intel64
    ln -sf /opt/intel/oneapi/mkl/latest/lib/intel64 "${pkgdir}"/opt/intel/mkl/lib/intel64_lin
    ln -sf /opt/intel/oneapi/mkl/latest/include "${pkgdir}"/opt/intel/mkl/include
    ln -sf /opt/intel/mkl/bin/mkl_link_tool "${pkgdir}"/usr/bin/mkl_link_tool
}

package_intel-oneapi-mkl-sycl() {
    pkgdesc="$_pkgdesc (GPU offloading)"
    depends=('intel-oneapi-mkl' 'intel-oneapi-compiler-dpcpp-cpp-runtime-libs'
             'intel-oneapi-common' 'intel-oneapi-compiler-shared-runtime-libs'
             'glibc' 'gcc-libs' 'bash')
    conflicts=('intel-oneapi-basekit')

    dpkg-deb -X ${pkgbase}-sycl-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-include-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-devel-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-blas-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-lapack-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-dft-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-sparse-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-data-fitting-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-rng-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-stats-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
    dpkg-deb -X ${pkgbase}-sycl-vm-${_majmin}-${_pkgver}_amd64.deb "${pkgdir}"
}
