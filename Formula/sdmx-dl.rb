class SdmxDl < Formula
  desc "Download data from remote SDMX servers - CLI"
  homepage "https://github.com/nbbrd/sdmx-dl"
  version "3.0.0-beta.3"
  url "https://github.com/nbbrd/sdmx-dl/releases/download/v3.0.0-beta.3/sdmx-dl-3.0.0-beta.3-bin.jar", :using => :nounzip
  sha256 "e3b0a36ea62b72312ef560ebc8011b692c354b8d31f8873ba28584958ba30901"
  license "European Union Public Licence (EUPL)"

  bottle :unneeded

  depends_on "openjdk@9"

  def install
    libexec.install "sdmx-dl-3.0.0-beta.3-bin.jar"
    bin.write_jar_script libexec/"sdmx-dl-3.0.0-beta.3-bin.jar", "sdmx-dl"
  end

  test do
    output = shell_output("#{bin}/sdmx-dl --version")
    assert_match "3.0.0-beta.3", output
  end
end