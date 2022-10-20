# Generated with JReleaser 1.2.0 at 2022-10-20T16:13:43.285534679Z
class Heylogs < Formula
  desc "Keep-a-changelog tool - CLI"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.4.0/heylogs-cli-0.4.0-bin.jar", :using => :nounzip
  version "0.4.0"
  sha256 "4c470284398549f8f65ab9000ee52bf1971ad884b5a4de4754079b113878981c"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.4.0-bin.jar"
    bin.write_jar_script libexec/"heylogs-cli-0.4.0-bin.jar", "heylogs"
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.4.0", output
  end
end
