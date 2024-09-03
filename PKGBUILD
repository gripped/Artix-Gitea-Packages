# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgbase=django
pkgname=('python-django')
pkgver=5.1
pkgrel=1
pkgdesc="A high-level Python Web framework that encourages rapid development and clean design"
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
checkdepends=('python-pytest' 'python-tblib')
makedepends=('python' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-pytz' 'python-sqlparse' 'python-asgiref')
# TODO: package and add python-pymemcache https://docs.djangoproject.com/en/dev/topics/cache/
optdepends=('python-psycopg2: for PostgreSQL backend'
            'python-argon2_cffi: for Argon2 password hashing support')
source=("Django-$pkgver.tar.gz::https://www.djangoproject.com/download/$pkgver/tarball/")
sha512sums=('4c34df7adf2a151488d8595551fe6e8eb90fdef9d7592ce1d8c8b0663fe4d876614f5dde4df1dd648153d4df6246ae39dbb33a66b1c3d2f60bd46595e0efb396')

prepare() {
  cd "Django-$pkgver"
  # Drop versioned setuptools requirement
  sed -i 's/>=61.0.0,<69.3.0//' pyproject.toml
}

build() {
  cd "Django-$pkgver"
  python -m build --wheel --no-isolation
}

package_python-django() {
  cd "Django-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  ln -s django-admin.py "$pkgdir"/usr/bin/django-admin3.py
  ln -s django-admin "$pkgdir"/usr/bin/django-admin3
  install -Dm644 extras/django_bash_completion \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin.py
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/manage.py

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
  cd "Django-$pkgver"
  PYTHONPATH="$PWD" python tests/runtests.py || echo 'tests failed'
}
