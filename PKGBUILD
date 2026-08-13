# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=ansible
pkgver=14.3.0
pkgrel=1
pkgdesc='Official assortment of Ansible collections'
arch=('any')
url='https://pypi.org/project/ansible/'
license=('GPL-3.0-or-later')
depends=('python' 'ansible-core')
provides=('python-ansible_collections')
optdepends=('python-argcomplete: shell completions'
            'python-pyopenssl: openssl modules'
            'python-dnspython: for dig lookup'
            'python-ovirt-engine-sdk: ovirt support'
            'python-boto3: aws_s3 module'
            'python-proxmoxer: proxmox modules'
            'python-openstacksdk: OpenStack module'
            'python-pynetbox: NetBox module'
            'python-ldap: LDAP modules'
            'python-kubernetes: Kubernetes modules'
            'python-keyring: Keyring module'
            'python-github3py: GitHub module'
            'python-lxc: LXC module'
            'python-fqdn: fqdn_valid module'
            'acme-tiny: openssl_certificate module')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://pypi.python.org/packages/source/a/ansible/ansible-${pkgver}.tar.gz"
        "ansible-13.4.0-remove-pkg_resources.patch")
sha512sums=('ebd26d4641a936dca970a106e00a44cfb333030677dff37372fed3ca663f7bbac304732bb19cc3a57f3c33ca4ac27751cee2013d01e5a2a1bb5e71e5fb8e45fe'
            '8055d481ca3f4705822ce22fc3057129150fd647817ac1fad3937382b3af6a3f0379274aff9e9c4c8039266971302c7daea0311ddd8dea4b2ce2150bce06f82d')

prepare() {
  cd "ansible-${pkgver}"
  patch -Np1 -i ../ansible-13.4.0-remove-pkg_resources.patch
}

build() {
  cd "ansible-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "ansible-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 COPYING "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
}
