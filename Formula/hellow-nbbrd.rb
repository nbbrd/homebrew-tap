class HellowNbbrd < Formula
  desc "Sandbox - Binaries"
  homepage "https://github.com/nbbrd/sandbox"
  version "2.0.1"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.0.1/hellow-nbbrd-2.0.1-bin.jar", :using => :nounzip
  sha256 "16dc2acec16ac9e2f1154979cf395e2bab9e39b7615489b0f19ea875d1a18045"
  license "European Union Public Licence (EUPL)"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install "hellow-nbbrd-2.0.1-bin.jar"
    bin.write_jar_script libexec/"hellow-nbbrd-2.0.1-bin.jar", "hellow-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hellow-nbbrd --version")
    assert_match "2.0.1", output
  end
end