# Generated with JReleaser 1.3.1 at 2022-11-22T12:00:53.624096299Z
class SdmxDl < Formula
  desc "Download SDMX data - CLI"
  homepage "https://github.com/nbbrd/sdmx-dl"
  url "https://github.com/nbbrd/sdmx-dl/releases/download/v3.0.0-beta.8/sdmx-dl-cli-3.0.0-beta.8-bin.jar", :using => :nounzip
  version "3.0.0-beta.8"
  sha256 "41bc27b77ea7da4f1cfa2665c5e80a382d305a7ad85a805aa0bca59cbc10ff1d"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sdmx-dl-cli-3.0.0-beta.8-bin.jar"
    bin.write_jar_script libexec/"sdmx-dl-cli-3.0.0-beta.8-bin.jar", "sdmx-dl"
  end

  test do
    output = shell_output("#{bin}/sdmx-dl --version")
    assert_match "3.0.0-beta.8", output
  end
end
