# Maintainer

pkgname=st-kgn-git
pkgver=0.8.2
pkgrel=7
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft' 'libxext' 'libxft-bgra')
makedepends=('ncurses')
url="http://st.suckless.org"
source=(
  https://dl.suckless.org/st/st-$pkgver.tar.gz
  https://st.suckless.org/patches/clipboard/st-clipboard-$pkgver.diff
  https://st.suckless.org/patches/scrollback/st-scrollback-$pkgver.diff
  https://st.suckless.org/patches/scrollback/st-scrollback-mouse-$pkgver.diff
  https://st.suckless.org/patches/scrollback/st-scrollback-mouse-altscreen-0.8.diff
#  https://st.suckless.org/patches/alpha/st-alpha-$pkgver.diff
  st.desktop
  config.h
)
sha256sums=(
  'aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35'
  '7be1a09831f13361f5659aaad55110bde99b25c8ba826c11d1d7fcec21f32945'
  '9c5aedce2ff191437bdb78aa70894c3c91a47e1be48465286f42d046677fd166'
  '6103a650f62b5d07672eee9e01e3f4062525083da6ba063e139ca7d9fd58a1ba'
  'bcfc106089d9eb75aa014d4915ed3e6842f1df54edd8b75597154096333df6fa'
#  '9c5b4b4f23de80de78ca5ec3739dc6ce5e7f72666186cf4a9c6b614ac90fb285'
  'SKIP'
  'SKIP'
)

prepare() {
  # user is supposed to maintain config.h him/herself
  cd $srcdir/st-$pkgver
  # skip terminfo which conflicts with ncurses
  sed '/tic /d' -i Makefile
  sed -i '/@echo .* terminfo/d' Makefile
  cp $srcdir/config.h $srcdir/st-$pkgver/config.h
  cp $srcdir/st.desktop st.desktop
  patch -i $srcdir/st-clipboard-$pkgver.diff
  patch -i $srcdir/st-scrollback-$pkgver.diff
  patch -i $srcdir/st-scrollback-mouse-$pkgver.diff
  patch -i $srcdir/st-scrollback-mouse-altscreen-0.8.diff
}

build() {
  cd $srcdir/st-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/st-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/st/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/st/README"
  install -Dm644 st.desktop "$pkgdir/usr/share/applications/st.desktop"
  # remove to avoid conflict with ncurses
  # rm -f "${pkgdir}/usr/share/terminfo/s/st" "${pkgdir}/usr/share/terminfo/s/st-256color" 
}

