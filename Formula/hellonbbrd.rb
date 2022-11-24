# Generated with JReleaser 1.3.1 at 2022-11-24T11:23:03.280084333Z
class HelloNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.2.7/sandbox-cli-2.2.7-bin.jar", :using => :nounzip
  version "2.2.7"
  sha256 "09f788c6572a4c81562a45695c84cab174eadd70c633f7b953686280e07addaf"
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
