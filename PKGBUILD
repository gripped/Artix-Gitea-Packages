# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Cirk2 <privat+aur at cirk2 dot de>

pkgbase=sdbus-cpp
pkgname=($pkgbase $pkgbase-doc)
pkgver=v1.4.0+r14+g28921ad
pkgrel=1
pkgdesc='a high-level C++ D-Bus library designed to provide expressive, easy-to-use API'
url="https://github.com/Kistler-Group/$pkgbase"
arch=(x86_64)
license=(LGPL2.1 'custom:sdbus-c++ LGPL Exception 1.0')
depends=(expat
         libelogind)
makedepends=(cmake
             doxygen
             elogind
	     git)
#_archive="$pkgbase-$pkgver"
#source=("$url/archive/v$pkgver/$_archive.tar.gz")
#sha256sums=('ca7405c7f0f9ae3023dcfa37bc68974c4b8a1c9ea2909b970e0aedc3e8657ee6')
_archive="$pkgbase"
_commit=28921ad424de293541fe8e5787a404201d88535e # for the libsystemd refactor/fix
source=("git+https://github.com/Kistler-Group/sdbus-cpp.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd $_archive
	git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
	cmake -B build -S "$_archive" \
		-D CMAKE_INSTALL_PREFIX=/ \
		-D CMAKE_BUILD_TYPE=Release \
		-D BUILD_CODE_GEN=ON \
		-D BUILD_DOXYGEN_DOC=ON
	cmake --build build
	cmake --build build --target doc

	# Install so we can split the packaging up later
	DESTDIR="fakeinstall" cmake --install build

	# Remove references to $srcdir
	find fakeinstall/usr/share/doc \
		-name \*.html \
		-print \
		-exec sed \
		  -e "s|$srcdir/sdbus-cpp/include|/usr/include|g" \
		  -e "s|$srcdir/sdbus-cpp||" \
		  -i {} \;
}

package_sdbus-cpp() {
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgbase/" "$_archive/COPYING"*
	for dir in lib include bin; do
		_package_dir $dir
	done
}

package_sdbus-cpp-doc() {
	_package_dir share/doc
}

_package_dir() {
	install -dm755 "$pkgdir/usr/$1"
	cp -dr --no-preserve=owner "$srcdir/fakeinstall/usr/$1/"* "$pkgdir/usr/$1"
}
