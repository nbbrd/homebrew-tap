# Generated with JReleaser 1.2.0 at 2022-09-28T10:19:53.688631725Z
class Heylogs < Formula
  desc "Keep-a-changelog tool - CLI"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.3.1/heylogs-cli-0.3.1-bin.jar", :using => :nounzip
  version "0.3.1"
  sha256 "84342932012bea68f2de613446d52a9370673528a168cda862861706dc2d6301"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.3.1-bin.jar"
    bin.write_jar_script libexec/"heylogs-cli-0.3.1-bin.jar", "heylogs"
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.3.1", output
  end
end
