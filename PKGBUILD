# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cppjieba
pkgver=5.6.6
pkgrel=1
pkgdesc="C++ implementation of Jieba Chinese text segmentation"
arch=('any')
url="https://github.com/yanyiwu/cppjieba"
license=('MIT')
depends=('limonp')
makedepends=('cmake' 'git' 'gtest')
source=("git+https://github.com/yanyiwu/cppjieba.git#tag=v$pkgver")
b2sums=('03b5617f94d86d8cd47cf2740a69483f71aba54ec7f25477d2e7f197035548834131b2fd28384cfcba2b4f1db8ec3eec27b124fa2dec283363935f681cd16591')

prepare() {
  cd cppjieba

  # Avoid FetchContent network access and link tests against system gtest.
  sed -i '/^include(FetchContent)$/,/^FetchContent_MakeAvailable(googletest)$/c\find_package(GTest REQUIRED)' test/unittest/CMakeLists.txt
  sed -i 's/TARGET_LINK_LIBRARIES(test.run gtest)/TARGET_LINK_LIBRARIES(test.run GTest::gtest)/' test/unittest/CMakeLists.txt

  # Debug prefix mapping can break __FILE__-derived fallback paths used by the default constructor.
  sed -i 's|cppjieba::Jieba jieba;|cppjieba::Jieba jieba(DICT_DIR "/jieba.dict.utf8", DICT_DIR "/hmm_model.utf8", DICT_DIR "/user.dict.utf8", DICT_DIR "/idf.utf8", DICT_DIR "/stop_words.utf8");|' test/unittest/jieba_test.cpp
}

build() {
  cmake -B build -S cppjieba \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 cppjieba/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
