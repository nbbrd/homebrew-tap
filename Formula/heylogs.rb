# Generated with JReleaser 1.3.1 at 2022-11-29T08:49:46.230870767Z
class Heylogs < Formula
  desc "Keep-a-changelog tool - CLI"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.5.0/heylogs-cli-0.5.0-bin.jar", :using => :nounzip
  version "0.5.0"
  sha256 "d3bebd2f32859418ecf0351534c58255634d9a2745d13beec76417c8fae0f3f2"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.5.0-bin.jar"
    bin.write_jar_script libexec/"heylogs-cli-0.5.0-bin.jar", "heylogs"
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.5.0", output
  end
end
