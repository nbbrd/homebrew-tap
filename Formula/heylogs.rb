# Generated with JReleaser 1.2.0 at 2022-09-08T12:24:45.728615438Z
class Heylogs < Formula
  desc "Keep-a-changelog tool - CLI"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.1.0/heylogs-cli-0.1.0-bin.jar", :using => :nounzip
  version "0.1.0"
  sha256 "6f0125cc5d5985736cc995b7a9093b01ccfd64f003a9ba12632d03ef701ac693"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.1.0-bin.jar"
    bin.write_jar_script libexec/"heylogs-cli-0.1.0-bin.jar", "heylogs"
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.1.0", output
  end
end
