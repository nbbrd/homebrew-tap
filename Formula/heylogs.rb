# Generated with JReleaser 1.2.0 at 2022-09-27T14:55:06.853759956Z
class Heylogs < Formula
  desc "Keep-a-changelog tool - CLI"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.3.0/heylogs-cli-0.3.0-bin.jar", :using => :nounzip
  version "0.3.0"
  sha256 "4932793624202175f6f2e12a3e00a1b135e9794484db610b7cde0609d37ab2dc"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.3.0-bin.jar"
    bin.write_jar_script libexec/"heylogs-cli-0.3.0-bin.jar", "heylogs"
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.3.0", output
  end
end
