# Maintainer: artist for Artix Linux

pkgname=ly-runit
pkgver=20240822
pkgrel=1
pkgdesc='Runit service script for ly'
arch=(any)
url='https://artixlinux.org'
license=(BSD)
depends=(logind-runit ly runit)
groups=(runit-world)
provides=(init-ly)
conflicts=(init-ly)
source=(ly.run log.run ly.finish conf)
sha512sums=('d2379b416e4189e5ea343cdf9501ecc202a24e660da617afe13b8b46afcc23b4c6a3e5adb15910e3e56b33a552b841727901e4859663774b98cc4528ece9ba53'
            'ee06cb1efaee0cb434de8782c3098dc473652df71600a7d00a5ebe8c60faa207df8082f72e48fe8202c2d2c2468d13b2b2367081d003b867ad3170f620c7f478'
            '3e427fd29c20f8c9da198a40d9c1d254b79efdc890ed5ec7f4e6e38d9f40bc54d03e935a416f96056bd82fd2ab85b5aaa4faa77fb4703c6c236c56da60ff53c0'
            '399ab041e0deb4fed1683d7414ee589a39bc83ce9ad9c756ef081a2e17d6f09a0f80cf64faf4500c6b0e4098660bf387b1d89fdb25405ededf8cbd613cc6dc7c')

package() {
    cd "$srcdir"
    install -Dm755 ly.run "$pkgdir/etc/runit/sv/ly/run"
    install -Dm755 ly.finish "$pkgdir/etc/runit/sv/ly/finish"
    install -Dm755 log.run "$pkgdir/etc/runit/sv/ly/log/run"
    install -Dm755 conf "$pkgdir/etc/runit/sv/ly/log/conf"
}

