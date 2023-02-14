# Generated with JReleaser 1.1.0 at 2022-08-10T12:01:34.45287196Z
class SdmxDl < Formula
  desc "Download SDMX data - CLI"
  homepage "https://github.com/nbbrd/sdmx-dl"
  url "https://github.com/nbbrd/sdmx-dl/releases/download/v3.0.0-beta.7/sdmx-dl-cli-3.0.0-beta.7-bin.jar", :using => :nounzip
  version "3.0.0-beta.7"
  sha256 "44f6aa6fab8055abfff668230e58eddc471f4ade27c3f3c1245d0575ec6712ca"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sdmx-dl-cli-3.0.0-beta.7-bin.jar"
    bin.write_jar_script libexec/"sdmx-dl-cli-3.0.0-beta.7-bin.jar", "sdmx-dl"
  end

  test do
    output = shell_output("#{bin}/sdmx-dl --version")
    assert_match "3.0.0-beta.7", output
  end
end
