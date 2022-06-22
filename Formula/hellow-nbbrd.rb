# Generated with JReleaser 1.0.0 at 2022-06-22T12:39:34.397919798Z
class HellowNbbrd < Formula
  desc "Sandbox - Binaries"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.2.2/hellow-nbbrd-2.2.2-bin.jar", :using => :nounzip
  version "2.2.2"
  sha256 "c2c67f6755f3fe136b1acc4b8487c193ec15fd4592a71fe35b69c32767d27bfc"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "hellow-nbbrd-2.2.2-bin.jar"
    bin.write_jar_script libexec/"hellow-nbbrd-2.2.2-bin.jar", "hellow-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hellow-nbbrd --version")
    assert_match "2.2.2", output
  end
end
