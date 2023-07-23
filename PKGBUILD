# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-aws-sam-translator
# https://github.com/aws/serverless-application-model/releases
pkgver=1.71.0
pkgrel=1
pkgdesc='AWS Serverless Application Model (AWS SAM) prescribes rules for expressing Serverless applications on AWS'
arch=(any)
url='https://github.com/aws/serverless-application-model'
license=(Apache)
depends=(python python-botocore python-boto3 python-jsonschema python-pydantic python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
# python-yaml is needed by samtranslator.yaml_helper, while the latter is used in tests only
checkdepends=(python-pytest python-pytest-rerunfailures python-yaml python-parameterized)
# Upstream intentionally exclude tests from sdist
# https://github.com/aws/serverless-application-model/pull/381#issuecomment-382143094
source=("https://github.com/aws/serverless-application-model/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname-jsonschema-4.18.patch"::"https://github.com/aws/serverless-application-model/commit/6a166398277da3db7afd5aa667143f201ab63b12.patch"
        "pydantic2.diff")
sha256sums=('8bdcc10b9dc70e8adb68b62dfed190c5112d7d628bab51ea3413b6582235f054'
            'c17ed9ea3d5a6c1dfbc282d8d1b72c79e9fc0e45fcc3b935dfbcb650e5e1cb9a'
            '42072cdbba7ff000f78effd55f97cf2768cfdd2c9bce46d0c2114cdfa222f3bb')

prepare() {
  cd serverless-application-model-$pkgver
  # skip pytest-coverage
  sed -i -r 's#--cov\S*\s+\S+##g' pytest.ini

  # Proposed at https://github.com/aws/serverless-application-model/pull/3249#issuecomment-1634980000
  patch -Np0 -i ../pydantic2.diff

  patch -Np1 -i ../$pkgname-jsonschema-4.18.patch
}

build() {
  cd serverless-application-model-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd serverless-application-model-$pkgver
  # See https://github.com/aws/serverless-application-model/blob/v1.52.0/Makefile#L9
  AWS_DEFAULT_REGION=us-east-1 pytest tests
}

package() {
  cd serverless-application-model-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
