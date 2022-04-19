# Generated with JReleaser 1.0.0 at 2022-04-19T14:29:51.069342546Z
class HellowNbbrd < Formula
  desc "Sandbox - Binaries"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.1.0/hellow-nbbrd-2.1.0-bin.jar", :using => :nounzip
  version "2.1.0"
  sha256 "ddae698a94ea5f78c98b88f0f87824fb5ba94e3bfdfc902259465f85796d59cf"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "hellow-nbbrd-2.1.0-bin.jar"
    bin.write_jar_script libexec/"hellow-nbbrd-2.1.0-bin.jar", "hellow-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hellow-nbbrd --version")
    assert_match "2.1.0", output
  end
end
