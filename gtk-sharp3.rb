class GtkSharp3 < Formula
  homepage "http://www.mono-project.com/GtkSharp"
  url "https://github.com/mono/gtk-sharp/archive/2.99.3.tar.gz"
  version "2.99.3"
  sha256 "6212a59809951e032f6d2712d5a6680203d0d6869f1c09127c4b9fb3c35ad384"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config"
  depends_on "gtk+3"
  depends_on "pango"
  depends_on "harfbuzz"
  depends_on "glib"
  depends_on :x11

  def install
    ENV.append_path "PKG_CONFIG_PATH", "#{HOMEBREW_PREFIX}/lib/pkgconfig"
    ENV.append_path "PKG_CONFIG_PATH", "/Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig"

    inreplace "autogen.sh", "libtoolize", "glibtoolize"
    system "./autogen.sh", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test gtk-sharp`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
