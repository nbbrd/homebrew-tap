# Generated with JReleaser 1.3.1 at 2022-11-24T12:36:15.51661816Z
class HellowNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.2.7/sandbox-desktop-2.2.7-bin.jar", :using => :nounzip
  version "2.2.7"
  sha256 "fc783d3f52364681c6be8ed23bc8188d79faa72941418a4c861dc6411fc0d5ef"
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
