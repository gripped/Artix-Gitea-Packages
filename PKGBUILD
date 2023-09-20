# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=xdg-desktop-portal-hyprland
pkgver=1.1.0
_protocolver=4d29e48433270a2af06b8bc711ca1fe5109746cd
_sdbuscppver=0eda85574546d19d9f06d6d5418bc192b3846f96
pkgrel=1
pkgdesc='xdg-desktop-portal backend for hyprland'
url="https://github.com/hyprwm/$pkgname"
arch=(x86_64)
license=(MIT)
provides=(xdg-desktop-portal-impl)
depends=(libinih
         libuuid.so
         libelogind 
         pipewire
         qt6-base
         qt6-wayland
         xdg-desktop-portal)
makedepends=(cmake
             ninja
             scdoc
             wayland
             wayland-protocols)
optdepends=('grim: required for the screenshot portal to function'
            'slurp: support for interactive mode for the screenshot portal')
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/v$pkgver.tar.gz"
        "https://github.com/hyprwm/hyprland-protocols/archive/$_protocolver.tar.gz"
        "https://github.com/Kistler-Group/sdbus-cpp/archive/$_sdbuscppver.tar.gz")
sha256sums=('4a51163ec91f1d5ec7f8c44205d44e4cb429db05edf75cc273d3a8a8efffb7c3'
            '5f6be4d870e94314f05ec7ff9c9c1f028748230ff80a7f89aeaf66c08e5c70e0'
            '2cb93874c2576f7d8750a007d0a05aef3cf594e1fd3a6daad0731d9ed04d0d5c')

prepare() {
    cd "$_archive/subprojects"
    rm -rf hyprland-protocols sdbus-cpp
    ln -sfT "$srcdir/hyprland-protocols-$_protocolver" hyprland-protocols
    ln -sfT "$srcdir/sdbus-cpp-$_sdbuscppver" sdbus-cpp
}

build() {
    cd "$_archive"
    artix-cmake \
        --no-warn-unused-cli \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -H. \
        -Bbuild \
        -GNinja
    cmake \
        --build ./build \
        --config Release \
        --target all
}

package() {
    cd "$_archive"
    DESTDIR="$pkgdir" ninja -C build install
    # install -Dm0755 -t "$pkgdir/usr/bin/" hyprland-share-picker/build/hyprland-share-picker
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
