# Generated with JReleaser 1.2.0 at 2022-09-21T09:34:59.262293525Z
class Heylogs < Formula
  desc "Keep-a-changelog tool - CLI"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.2.0/heylogs-cli-0.2.0-bin.jar", :using => :nounzip
  version "0.2.0"
  sha256 "2748be80e7564c336670be79cb9255c6b31620fbd05e63cafb377ab8b5280520"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.2.0-bin.jar"
    bin.write_jar_script libexec/"heylogs-cli-0.2.0-bin.jar", "heylogs"
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.2.0", output
  end
end
