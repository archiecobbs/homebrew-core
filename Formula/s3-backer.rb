class S3Backer < Formula
  desc "FUSE-based single file backing store via Amazon S3"
  homepage "https://github.com/archiecobbs/s3backer"
  url "https://archie-public.s3.amazonaws.com/s3backer/s3backer-1.6.1.tar.gz"
  sha256 "ec91b1c2ec2eadd945e1745fdeccc49baeb357a4040fd9ea8605a9bcdc96c29f"
  license "GPL-2.0-or-later"

  bottle do
    cellar :any
    sha256 "f54a33c549b57b056808803b4cc722596a89bb9413d135161952903de975a3f5" => :catalina
    sha256 "346fe1b085490959e17acf9930878b46b8224bf20b7aada21a1a48ab963c0da3" => :mojave
    sha256 "4d23cfd2c126c5f3efa1023e7c061830de6f1fdda69760bbd3ed70a169def288" => :high_sierra
  end

  depends_on "pkg-config" => :build
  depends_on "openssl@1.1"
  depends_on :osxfuse

  def install
    inreplace "configure", "-lfuse", "-losxfuse"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system bin/"s3backer", "--version"
  end
end
