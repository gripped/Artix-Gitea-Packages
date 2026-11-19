# Maintainer: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Renato Garcia <fgarcia.renato@gmail.com>

pkgname=trash-cli
pkgver=0.26.9.29
pkgrel=1
pkgdesc="Command line trashcan (recycle bin) interface"
arch=('any')
url="https://github.com/andreafrancia/trash-cli"
license=('GPL-2.0-only')
depends=('python' 'python-psutil' 'python-six')
makedepends=('python-setuptools' 'python-shtab' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-flexmock' 'python-parameterized')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('33ec648238d291f1fd247bea9a260ab158528e184b3f83c9da10ea792bd4cdd2')

prepare() {
    cd "${srcdir}"/${pkgname}-${pkgver}

    # don't depend on thirdparty copies of the stdlib
    find tests -type f -name "*.py" -exec \
        sed -i 's/^import mock$/from unittest import mock/;s/from mock /from unittest.mock /;s/from mock.mock /from unittest.mock /' {} +
}

build() {
    cd "${srcdir}"/${pkgname}-${pkgver}

    python -m build --wheel --no-isolation
    for cmd in trash-empty trash-list trash-restore trash-put trash; do
      ./$cmd --print-completion bash > ./$cmd-completion
      ./$cmd --print-completion zsh > ./_$cmd-completion
    done
}

check() {
    cd "${srcdir}"/${pkgname}-${pkgver}

    # help output tests hardcode the shtab shell list (bash,zsh,tcsh), but
    # python-shtab >= 1.13 also lists fish and powershell
    python -m pytest \
        --deselect tests/test_empty/components/test_empty_end_to_end.py::TestEmptyEndToEnd::test_help \
        --deselect tests/test_list/cmd/test_end_to_end_list.py::TestEndToEndList::test_help \
        --deselect tests/test_put/cmd/e2e/test_end_to_end_put.py::TestEndToEndPut::test_on_help
}

package(){
    cd "${srcdir}"/${pkgname}-${pkgver}

    python -m installer --destdir="$pkgdir" dist/*.whl
    for cmd in trash-empty trash-list trash-restore trash-put trash; do
      install -vDm 644 ./$cmd-completion "$pkgdir/usr/share/bash-completion/completions/$cmd"
      install -vDm 644 ./_$cmd-completion "$pkgdir/usr/share/zsh/site-functions/_$cmd"
    done
}
