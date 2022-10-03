# Generated with JReleaser 1.2.0 at 2022-10-03T14:31:01.889357076Z
class Heylogs < Formula
  desc "Keep-a-changelog tool - CLI"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.3.2/heylogs-cli-0.3.2-bin.jar", :using => :nounzip
  version "0.3.2"
  sha256 "824699458c1d30048c84a6afa162bb5abb6dad78cb34e4b9bfcaf3cdbb00b908"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.3.2-bin.jar"
    bin.write_jar_script libexec/"heylogs-cli-0.3.2-bin.jar", "heylogs"
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.3.2", output
  end
end
