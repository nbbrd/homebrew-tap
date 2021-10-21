class SdmxDl < Formula
  desc "Download SDMX data - CLI"
  homepage "https://github.com/nbbrd/sdmx-dl"
  version "3.0.0-beta.4"
  url "https://github.com/nbbrd/sdmx-dl/releases/download/v3.0.0-beta.4/sdmx-dl-3.0.0-beta.4-bin.jar", :using => :nounzip
  sha256 "9d7adf9644ddc99174b12802773c032f952db3788566325110212f88cd28bce2"
  license "European Union Public Licence (EUPL)"

  bottle :unneeded

  depends_on "openjdk@9"

  def install
    libexec.install "sdmx-dl-3.0.0-beta.4-bin.jar"
    bin.write_jar_script libexec/"sdmx-dl-3.0.0-beta.4-bin.jar", "sdmx-dl"
  end

  test do
    output = shell_output("#{bin}/sdmx-dl --version")
    assert_match "3.0.0-beta.4", output
  end
end