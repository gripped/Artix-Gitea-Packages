# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-aiobotocore
_pkgname=aiobotocore
# https://github.com/aio-libs/aiobotocore/releases
pkgver=2.16.0
pkgrel=2
pkgdesc='asyncio support for botocore library using aiohttp'
arch=(any)
url='https://github.com/aio-libs/aiobotocore'
# https://github.com/aio-libs/aiobotocore/blob/2.11.0/setup.py#L64
license=('Apache-2.0')
depends=(
  python
  python-aiohttp
  python-aioitertools
  python-botocore
  python-wrapt
  # detected by namcap but not listed in setup.py
  python-dateutil
  python-jmespath
  python-multidict
  python-urllib3
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-dill
  python-docutils
  python-moto
  python-pip
  python-pytest
  python-pytest-asyncio
  python-time-machine
  # moto optdepends
  python-docker
  python-flask
  python-flask-cors
  python-openapi-spec-validator
  python-yaml
)
source=("git+https://github.com/aio-libs/aiobotocore.git#tag=$pkgver"
        "moto-5.x.diff")
sha256sums=('b00c43901c9f268b9d18af39eb244eee800cfc9cb04b52849470d6f5bd564e16'
            '2bfadc984a4ad3a6420b356d572c8085b82a46949fc0ecaea98ddce45980503b')

prepare() {
  cd $_pkgname
  # Work-around test failures with moto 5.x
  # See: https://github.com/aio-libs/aiobotocore/issues/1108
  patch -Np1 -i ../moto-5.x.diff
}

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname
  local pytest_args=(
    # Uses moto.awslambda, which requires a running Docker service
    # See: https://github.com/spulec/moto/issues/3276
    --ignore=tests/test_lambda.py
    # Fail with:
    #   botocore.exceptions.NoCredentialsError: Unable to locate credentials
    --deselect=tests/test_basic_s3.py::test_bucket_redirect
    --deselect=tests/test_basic_s3.py::test_can_follow_signed_url_redirect
    --deselect=tests/test_basic_s3.py::test_presign_sigv4
    --deselect=tests/test_basic_s3.py::test_presign_with_existing_query_string_values
    --deselect=tests/test_basic_s3.py::test_succeed_proxy_request
    --deselect=tests/test_basic_s3.py::test_unicode_key_put_list
    --deselect=tests/test_basic_s3.py::test_unicode_system_character
    --deselect=tests/test_basic_s3.py
    # Fails with:
    #   botocore.exceptions.NoRegionError: You must specify a region.
    --deselect=tests/python3.8/test_eventstreams.py::test_kinesis_stream_json_parser 
  )
  pytest "${pytest_args[@]}"
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
