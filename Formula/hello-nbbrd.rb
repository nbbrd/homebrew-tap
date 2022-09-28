# Generated with JReleaser 1.2.0 at 2022-09-28T08:54:34.27446657Z
class HelloNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.2.3/sandbox-cli-2.2.3-bin.jar", :using => :nounzip
  version "2.2.3"
  sha256 "51bbb8dba395aeca27ae554c09ccbf5e13cf326a98a8c0fc9e3f65f3d3ff9a15"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-cli-2.2.3-bin.jar"
    bin.write_jar_script libexec/"sandbox-cli-2.2.3-bin.jar", "hello-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "2.2.3", output
  end
end
