# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-cmd2
pkgver=3.1.0
pkgrel=1
pkgdesc="A tool for building interactive command line apps"
arch=('any')
url="https://github.com/python-cmd2/cmd2"
license=('MIT')
depends=('python-pyperclip' 'python-rich' 'python-rich-argparse')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock' 'vi')
source=("git+https://github.com/python-cmd2/cmd2.git#tag=$pkgver")
sha512sums=('a1a0125b474c58abd9ab5d30e46f80655d86c12676fed53ad3ed81f911a747fd1e41611d072a3be20fe9ec1a8f09cea7bf62b8eab6a0b6bd49fb8b9976af028f')

prepare() {
  cd cmd2

  # Rich 14.3 fixed styled newline handling; upstream removed cmd2's workaround in PR #1560.
  git cherry-pick -n 926636a38156e4a7e07dc1cee04bca7b019776ec

  # Python 3.14 removed argparse.HelpFormatter._format_actions_usage; upstream
  # dropped these private overrides in https://github.com/python-cmd2/cmd2/pull/1571.
  sed -e '/def _format_usage(/i\
    if not hasattr(argparse.HelpFormatter, "_format_actions_usage"):\
        def _format_actions_usage(self, actions, groups):\
            parts, _ = self._get_actions_usage_parts(actions, groups)\
            return " ".join(parts)\
' -i cmd2/argparse_custom.py

  # Keep Rich's console lock out of parser deepcopy; upstream fixed this in PR #1571.
  sed -e '/        if console is None:/,+4c\
        super().__init__(prog, indent_increment, max_help_position, width, console=console, **kwargs)\
\
        self._console: Cmd2RichArgparseConsole | None\
\
    @property  # type: ignore[override]\
    def console(self) -> Cmd2RichArgparseConsole:\
        if self._console is None:\
            self._console = Cmd2RichArgparseConsole()\
        return self._console\
\
    @console.setter\
    def console(self, console: Cmd2RichArgparseConsole | None) -> None:\
        self._console = console\
' -i cmd2/argparse_custom.py

  # Upstream PR #1642 made completion items deepcopy-safe after this file was refactored.
  sed -e '/        self._orig_value = value/a\
\
    def __deepcopy__(self, memo: dict[int, Any]) -> "CompletionItem":\
        return self\
' -i cmd2/argparse_custom.py
}

build() {
  cd cmd2
  SETUPTOOLS_SCM_PRETEND_VERSION_FOR_CMD2=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd cmd2
  PYTHONPATH="$PWD/cmd2" pytest --override-ini="addopts=" \
    --deselect tests/test_rich_utils.py::test_from_ansi_wrapper
}

package() {
  cd cmd2
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
