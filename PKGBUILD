# Maintainer: Muhammad Herdiansyah <koni@artixlinux.org>
# Contributor: Chris Cromer <chris@cromer.cl>
# Contributor: Dudemanguy <dudemanguy@artixlinux.org>

_url=https://gitea.artixlinux.org/artix/runit-artix
_pkgname=runit-artix
_pkgver=20210904

# set default service path to /run/runit/service
_servicedir=/run/runit/service

# alpm-hooks
_commit=08a2c08bd62b978cf782c43758968745b1dc9a22

pkgname=runit
pkgver=2.3.1
pkgrel=1
pkgdesc='a cross-platform Unix init scheme with service supervision'
arch=('x86_64')
url='http://smarden.org/runit/'
license=('BSD')
depends=('runit-rc')
makedepends=('git')
optdepends=('runit-bash-completions: Runit completions for Bash')
install=runit.install
provides=('svc-manager' 'eudev-runit')
conflicts=('svc-manager' 'eudev-runit')
replaces=('eudev-runit')
source=("http://smarden.org/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${_pkgver}.tar.gz::${_url}/archive/${_pkgver}.tar.gz"
        "git+https://gitea.artixlinux.org/artix/alpm-hooks.git#commit=$_commit"
        "halt.c"
        "shutdown"
        "clearmem.patch"
        "svlogd.patch")
b2sums=('5c3ffa1bcddcbea4e6f859602070803f793ac7b104f9e7c441d3f089af79c2783ed8b49a936b08ccc09f940600a6856dd5eb861c9c7a0b6dd4721c466a71a555'
        'a6c4d9847de044ff27790aa7289a6c3f4907699175ff99611343aff37580f8600f3a1fbd42320a38dc46df07ad151f637c031d0dcc14e1fd21162e9e85ee92f8'
        'cc807edc8370bb00d08c141aa3c59c4d8f11cfab409accc85ba8797c5e825d8524f3048ac9e7f15e76a1bb11fabb978e0abf75ba844f65044d85b4a5b828b3d4'
        '4008be93260a5df13f1d1199864c9f5e724643a670d69ed3ee980f35a83cad8bd97bb09614a7847d991b4ac0434ed563a3c5af6a74297b9590ad0e5b47749219'
        'e782155bd99bd4cd049a88fa9c0bfbd1d4ef4c61669e97a6b3d482c9ab52666ad736d38ccfc4486a152fd8446ab9703f99ff5ccef9ded3ba055aa412ec18de3a'
        'af632c732ec8e3942fc27e6450cb04fc539ca4a91bc1ea8e926784922acf8455b00725a082686475e13605a1d897ce17e7fd3bb975f48ffa9619daaaf2774911'
        'ca43dc96a11e033ddf92b92477f80e246a02ddde945d222224877177e42b436aa69c5a0ea97be405a5962218b915c4522b9fa5d49f408f3524ac2e253c560210')

prepare() {
    # set default service path to /run/runit/service
    cd "${srcdir}/admin/${pkgname}-${pkgver}"
    sed -i "s|/service/|${_servicedir}/|" src/sv.c

    # apply patches
    patch -p1 -i "${srcdir}/clearmem.patch"
    patch -p1 -i "${srcdir}/svlogd.patch"
}

build() {
    cc ${CFLAGS} halt.c -o halt ${LDFLAGS}

    cd ${_pkgname}
    make SERVICEDIR="${_servicedir}"

    cd "${srcdir}/admin/${pkgname}-${pkgver}"

    CFLAGS="${CFLAGS} -static"
    LDFLAGS="${LDFLAGS} -static"

    package/compile

}

check() {
    cd "${srcdir}/admin/${pkgname}-${pkgver}"
    package/check
}

package() {
    # commands
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 ${srcdir}/admin/${pkgname}-${pkgver}/command/* "${pkgdir}/usr/bin"
    install -Dm755 ${srcdir}/halt ${pkgdir}/usr/bin/halt
    ln -s halt ${pkgdir}/usr/bin/poweroff
    ln -s halt ${pkgdir}/usr/bin/reboot
    install -Dm755 ${srcdir}/shutdown ${pkgdir}/usr/bin/shutdown

    cd ${_pkgname}
    make DESTDIR="${pkgdir}" PREFIX="/usr" SERVICEDIR="${_servicedir}" install-runit

    # man pages
    install -dm755 "${pkgdir}/usr/share/man/man8"
    install -Dm644 ${srcdir}/admin/${pkgname}-${pkgver}/man/* "${pkgdir}/usr/share/man/man8"

    # license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 "${srcdir}/admin/${pkgname}-${pkgver}/package/COPYING" ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
    sed -n '/To the extent/,/0/p' README.md > "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

    # alpm hooks
    cd "${srcdir}"/alpm-hooks
    DESTDIR="${pkgdir}" make install_runit
}
