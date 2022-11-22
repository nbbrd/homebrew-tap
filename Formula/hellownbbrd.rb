# Generated with JReleaser 1.3.1 at 2022-11-22T10:29:16.929091035Z
class HellowNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.2.6/sandbox-desktop-2.2.6-bin.jar", :using => :nounzip
  version "2.2.6"
  sha256 "8cf3efb994607c1982d2ce49e4d179182c4d7cf0245e725b2ca6f3d9312c8819"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-desktop-2.2.6-bin.jar"
    bin.write_jar_script libexec/"sandbox-desktop-2.2.6-bin.jar", "hellow-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hellow-nbbrd --version")
    assert_match "2.2.6", output
  end
end
