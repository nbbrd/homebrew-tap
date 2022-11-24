# Generated with JReleaser 1.3.1 at 2022-11-24T12:36:15.51661816Z
class HelloNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.2.7/sandbox-cli-2.2.7-bin.jar", :using => :nounzip
  version "2.2.7"
  sha256 "453c7a5995d2d0682d873cd0b5c68722a50b3ef578e75cbd92fdfbdb5ef2fcb0"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-cli-2.2.7-bin.jar"
    bin.write_jar_script libexec/"sandbox-cli-2.2.7-bin.jar", "hello-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "2.2.7", output
  end
end
