# Generated with JReleaser 1.3.1 at 2022-11-24T11:23:03.280084333Z
class HellowNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.2.7/sandbox-desktop-2.2.7-bin.jar", :using => :nounzip
  version "2.2.7"
  sha256 "1a36a8a877418d20ae834278f4a8b394f19c88a796c6d80d0e909c00c12831f2"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-desktop-2.2.7-bin.jar"
    bin.write_jar_script libexec/"sandbox-desktop-2.2.7-bin.jar", "hellow-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hellow-nbbrd --version")
    assert_match "2.2.7", output
  end
end
