# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=python-openai
_name=openai-python
pkgver=3.7.0
pkgrel=1
pkgdesc="Python client library for the OpenAI API"
arch=('any')
url="https://github.com/openai/openai-python"
license=('Apache-2.0' 'BSD-3-Clause')
depends=(
  'python'
  'python-anyio'
  'python-h2'
  'python-httpx2'
  'python-jiter'
  'python-pydantic'
  'python-pydantic-core'
  'python-sniffio'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'nodejs-lts-krypton'
  'npm'
  'procps-ng'
  'python-dirty-equals'
  'python-aiohttp'
  'python-inline-snapshot'
  'python-nest-asyncio'
  'python-packaging'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-xdist'
  'python-rich'
  'python-botocore'
  'python-websockets'
)
optdepends=(
  'python-aiohttp: Use aiohttp as HTTP backend'
  'python-httpx: Compatibility with legacy custom HTTP clients'
  'python-numpy: Datalib support'
  'python-pandas: Datalib support'
  'python-websockets: Realtime support'
  'python-botocore: AWS Bedrock OpenAI-compatible API support'
)
source=(
  "git+${url}.git#tag=v${pkgver}"
)
b2sums=('90b287c9139ece40ba1993f9467d5cae13d020d80ffd38a33265b5896a53c6fbce89e8b9e83228c001c8253442b17084e1996b495d8b78a590b5ce057e109500')

prepare() {
  cd "${_name}"
  # Run Steady with the packaged Node.js; upstream's launcher requires exactly 22.22.3.
  sed -i 's|node scripts/utils/node-tooling.cjs steady|npm exec --package=@stdy/cli@0.22.2 -- steady|' \
    scripts/run-steady
}

build() {
  cd "${_name}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "${_name}"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/${site_packages}"

  # Start mock server and make sure it's cleaned up on exit
  export npm_config_yes=true
  trap 'pkill "npm exec steady"' EXIT
  ./scripts/mock --daemon

  # Randomly generated mock API key
  export OPENAI_API_KEY=sk-dBAe8c5a9bc4294cca9bed292cd61e0ff9030bB94647adfb
  # websockets >= 16 follows sync redirects; upstream supports < 16.
  pytest -W ignore::DeprecationWarning:pytest_asyncio.plugin \
    --deselect tests/lib/chat/test_completions.py::test_parse_method_in_sync \
    --deselect tests/lib/chat/test_completions_streaming.py::test_stream_method_in_sync \
    --deselect tests/lib/test_assistants.py::test_create_and_run_poll_method_definition_in_sync \
    --deselect tests/lib/test_assistants.py::test_create_and_run_stream_method_definition_in_sync \
    --deselect tests/lib/test_azure_websocket_redirects.py::test_sync_azure_websocket_does_not_follow_redirects \
    --deselect tests/test_client.py::TestAsyncOpenAI::test_copy_build_request \
    --deselect tests/test_client.py::TestOpenAI::test_copy_build_request \
    --deselect tests/test_transform.py::test_base64_file_input
}

package() {
  cd "${_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm644 src/openai/_vendor/httpx_aiohttp/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/httpx-aiohttp-LICENSE"
}
