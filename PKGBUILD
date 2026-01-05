# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=rst2pdf
pkgver=0.103.1
pkgrel=2
pkgdesc="Use a text editor. Make a PDF"
arch=(any)
url="https://github.com/rst2pdf/rst2pdf"
license=(MIT)
depends=(
  python
  python-docutils
  python-importlib-metadata
  python-jinja
  python-packaging
  python-pillow
  python-pygments
  python-reportlab
  python-roman
  python-smartypants
  python-yaml
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
# TODO: package python-xhtml2pdf
# https://github.com/xhtml2pdf/xhtml2pdf/issues/560
checkdepends=(
  graphviz
  plantuml
  python-aafigure
  python-matplotlib
  python-pymupdf
  python-pytest
  python-pytest-xdist
  python-sphinx
  python-svglib
)
# TODO: package python-xhtml2pdf
optdepends=(
  'plantuml: for UML diagram support'
  'python-aafigure: for ASCII image support'
  'python-pyphen: for hyphenation support'
  'python-matplotlib: for math support'
  'python-sphinx: for sphinx support'
  'python-svglib: for SVG support'
)
source=("git+$url.git#tag=$pkgver")
sha512sums=('9366787ccff062018509abd6d9477ac5120085d2c6004d265975a502def5be90e1c76130d14603d4d95987078bc24487e97b530504aa0bcb9443d9d3674d2a5f')
b2sums=('b4e144bc9354778fb8130f47382681b8bd2ac9d68e7843f463f75c26b272bf89ffe97078bbdad03122fb054ccd9c33b5fb9f15d23a2162be9f283e44a6b78b78')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --numprocesses=auto
    # https://github.com/rst2pdf/rst2pdf/issues/1067
    --deselect=tests/input/test_raw_html.rst::test_raw_html
    # Fails for some reason
    --deselect=tests/input/sphinx-issue284/conf.py::sphinx-issue284
    --deselect=tests/input/test_issue_244.rst::test_issue_244
    --deselect=tests/input/test_jpg_scaling.rst::test_jpg_scaling
    --deselect=tests/input/test_malformed_rst.rst::test_malformed_rst
  )

  cd $pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  export PYTHONPATH="$(test-env/bin/python -c "import site; print(site.getsitepackages()[0])")"
  export PATH="$PATH:$PWD/test-env/bin"
  test-env/bin/python -Pm pytest "${pytest_options[@]}"
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,MAINTAINERS,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
