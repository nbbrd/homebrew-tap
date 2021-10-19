class HellowNbbrd < Formula
  desc "Sandbox - Binaries"
  homepage "https://github.com/nbbrd/sandbox"
  version "2.0.0"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.0.0/hellow-nbbrd-2.0.0-bin.jar", :using => :nounzip
  sha256 "cd7e81fad67c4ac5c0996d1d88e78fe4ab42d56d3e38b6ed86a0e7aeac3f1118"
  license "European Union Public Licence (EUPL)"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install "hellow-nbbrd-2.0.0-bin.jar"
    bin.write_jar_script libexec/"hellow-nbbrd-2.0.0-bin.jar", "hellow-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hellow-nbbrd --version")
    assert_match "2.0.0", output
  end
end