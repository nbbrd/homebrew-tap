# Generated with JReleaser 1.0.0 at 2022-04-21T08:36:01.757975633Z
class SdmxDl < Formula
  desc "Download SDMX data - CLI"
  homepage "https://github.com/nbbrd/sdmx-dl"
  url "https://github.com/nbbrd/sdmx-dl/releases/download/v3.0.0-beta.6/sdmx-dl-3.0.0-beta.6-bin.jar", :using => :nounzip
  version "3.0.0-beta.6"
  sha256 "bf5379aa4f429bb1524b160aa370079a9075bee7f9402e92bfe0a16a5929f41a"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sdmx-dl-3.0.0-beta.6-bin.jar"
    bin.write_jar_script libexec/"sdmx-dl-3.0.0-beta.6-bin.jar", "sdmx-dl"
  end

  test do
    output = shell_output("#{bin}/sdmx-dl --version")
    assert_match "3.0.0-beta.6", output
  end
end
