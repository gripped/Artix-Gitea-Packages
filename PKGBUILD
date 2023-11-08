# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=ansible
pkgver=8.6.0
pkgrel=1
pkgdesc='Official assortment of Ansible collections'
arch=('any')
url='https://pypi.org/project/ansible/'
license=('GPL3')
depends=('python' 'ansible-core')
provides=('python-ansible_collections')
optdepends=('python-argcomplete: shell completions'
            'python-pyopenssl: openssl modules'
            'python-dnspython: for dig lookup'
            'python-ovirt-engine-sdk: ovirt support'
            'python-boto3: aws_s3 module'
            'python-ldap: ldap support'
            'python-proxmoxer: proxmos modules'
            'python-openstacksdk: OpenStack module'
            'python-pynetbox: NetBox module'
            'python-ldap: LDAP modules'
            'python-kubernetes: Kubernetes modules'
            'python-keyring: Keyring module'
            'python-github3py: GitHub module'
            'acme-tiny: openssl_certificate module')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/a/ansible/ansible-${pkgver}.tar.gz")
sha512sums=('b316f1d6e8ffd4739f142d9add50f39802d8a57bac026f8ab833fd3d07c2ccd9df1d2ba5bcf68b3486db99e12943e8787203e22b16d1ecd1c4c1655a3573cf5d')

build() {
  cd ansible-${pkgver}
  python setup.py build
}

package() {
  cd ansible-${pkgver}
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm644 COPYING "${pkgdir}"/usr/share/doc/${pkgname}/COPYING
}
