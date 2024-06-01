# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>

pkgname=pambase
pkgver=20230918
pkgrel=2
pkgdesc="Base PAM configuration for services"
arch=(any)
url="https://www.artixlinux.org"
license=(GPL-3.0-or-later)
backup=(
  etc/pam.d/system-auth
  etc/pam.d/system-local-login
  etc/pam.d/system-login
  etc/pam.d/system-remote-login
  etc/pam.d/system-services
  etc/pam.d/other
)
replaces=('pambase-turnstile')
source=(
  system-auth
  system-local-login
  system-login
  system-remote-login
  system-services
  other
)
sha512sums=('afcca27d03a3fd1cc5daeb960ff0b317284cfec005683e39bda6ff16a371121ebae59decfe7739c0ee90c04490940a60dfee64f637acaf8a2cb0f153b8bfc845'
            '83cc3d84ef5afded9afd4d347132901b9adcbd8b21be45b80d010370a2082e8388a713eb78d052944bc47b07fd7383edf18e2674d9d0545215cc45e14a2e14b1'
            '9964172277c889ca16359a60bc637ab53f70396f711bb4c1e9d5830ac8c33cab51b9021f864ba735f537b47fec690ea1dd5962f245c56a6732f6eb1d17ab0d70'
            '83cc3d84ef5afded9afd4d347132901b9adcbd8b21be45b80d010370a2082e8388a713eb78d052944bc47b07fd7383edf18e2674d9d0545215cc45e14a2e14b1'
            '5c2947f8644803783d19cc97ddc19fdaa234dac41a939edd32c9452e78bb2a4751bceeb4737d0791fb122ca932b8b941aab869b6dec3146bf90e94517d31724a'
            'df554f70f017dd3f6023a3c62b95d19123eaf41c08deaac0c4bc343fcce6eeefcf468910f7cb9ba58ee2846abb88091d18d718eb0228e38f6ce26ebced94c407')
b2sums=('e8a6ce0b27e45b7a1fb7c90c56dec1fa4512180b4fdc3c21c634ff063f86637df0b68e9f9dec8b1f8760c5068dbff6ac203ad961da99154eed22e0692b225ca2'
        '900a5250f5a9e464c1c3ab8fc112475c99f4d76b597abf362041b661707dcc458cd385fd2cfeecf1ba9e3e831176ca8d183cffc9a913fb79e8ddcaa68223a7e6'
        'cd0c593e04d6c247f0215ec9c01ef8de6d13cb49da2335e76f4fa6a63b5ec0f6f1680b962134660da2ddd98e3105ef59144997cbf4fb5969d17dd37a91fe4205'
        '900a5250f5a9e464c1c3ab8fc112475c99f4d76b597abf362041b661707dcc458cd385fd2cfeecf1ba9e3e831176ca8d183cffc9a913fb79e8ddcaa68223a7e6'
        'e11e8959c961036a384016096f0fce0696d8a3ecc63d0d12d8016cc7c27a7afc80f8580ab639c97360aed0d49af3159462d85260b4404b9d65963f440eb77243'
        '3de32ccd196fecaf0a3cce8e61867f93f85fff651044519d8521a28d9f8d6ddaf51f3e30eac4979884c505f9f52d01f458e5bccc5d5adc4f1d7d372068dd02da')

package() {
  install -vDm 644 "${source[@]}" -t "$pkgdir/etc/pam.d/"
}

# vim:set ts=2 sw=2 et:
