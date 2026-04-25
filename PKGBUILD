# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
pkgname=intel-oneapi-tcm
pkgver=1.4.1_445
_pkgver=$(echo $pkgver | sed 's/_/-/')
_majmin=$(echo $pkgver | cut -d. -f1,2)
pkgrel=1
pkgdesc="Thread Composability Manager"
arch=('x86_64')
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/overview.html"
license=('LicenseRef-Intel-Simplified')
depends=('intel-oneapi-common' 'glibc' 'gcc-libs' 'hwloc')
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_majmin}-${_pkgver}_amd64.deb")
b2sums=('dff1e9198505b28ec69a8450faaef44946f9b1d1d789062f3d8f4ae7b8b5f08b758a089d88018adcb7624a0f93f2863ef43dd2fc2d5fd69f0f7fcc21ea1c5122')
noextract=("${pkgname}-${majmin}-${_pkgver}_amd64.deb")
conflicts=('intel-oneapi-basekit')

package() {
	ar x "${pkgname}-${_majmin}-${_pkgver}_amd64.deb"
	tar xvf data.tar.xz -C "${pkgdir}"
	rm data.tar.xz

	local _prefix=/opt/intel/oneapi/tcm
	ln -vs "${_prefix}/${_majmin}" "${pkgdir}/${_prefix}/latest"

	install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
	ln -vs /usr/share/licenses/intel-oneapi "${pkgdir}"/usr/share/licenses/"${pkgname}"/oneapi
}
