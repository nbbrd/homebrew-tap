# Generated with JReleaser 1.3.1 at 2022-11-22T10:20:30.640023757Z
class HellowNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.2.4/sandbox-desktop-2.2.4-bin.jar", :using => :nounzip
  version "2.2.4"
  sha256 "664c681b5d4451d2417245c1fbdc555bd6402be212b9d5b86552f974a9140c0b"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-desktop-2.2.4-bin.jar"
    bin.write_jar_script libexec/"sandbox-desktop-2.2.4-bin.jar", "hellow-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hellow-nbbrd --version")
    assert_match "2.2.4", output
  end
end
