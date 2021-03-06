# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Colpack < Formula
  desc "ColPack"
  homepage "https://cscapes.cs.purdue.edu/coloringpage/index.htm"
  url "https://github.com/CSCsw/ColPack/archive/v1.0.10.tar.gz"
  sha256 "b22ead7da80fa1735291b2d83198adf41bf36101e4fcb2c4f07c1cfacf211c75"
  head "https://github.com/CSCsw/ColPack.git"

  depends_on "autoconf"      => :build 
  depends_on "automake"      => :build 
  depends_on "libtool"       => :build 

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    #system  "cd", "build/automake"
    #system "pwd"
    system  "/usr/local/bin/autoreconf", "-v", "--install", "--force"
    # system "pwd"
    system  "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test colpack`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
