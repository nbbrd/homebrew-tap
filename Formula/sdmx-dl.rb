class SdmxDl < Formula
  desc "Download SDMX data - CLI"
  homepage "https://github.com/nbbrd/sdmx-dl"
  version "3.0.0-beta.5"
  url "https://github.com/nbbrd/sdmx-dl/releases/download/v3.0.0-beta.5/sdmx-dl-3.0.0-beta.5-bin.jar", :using => :nounzip
  sha256 "5f2cb61480b557711845a9f1e7625c19108e48d6eeab6f36d5251291194db49b"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@9"

  def install
    libexec.install "sdmx-dl-3.0.0-beta.5-bin.jar"
    bin.write_jar_script libexec/"sdmx-dl-3.0.0-beta.5-bin.jar", "sdmx-dl"
  end

  test do
    output = shell_output("#{bin}/sdmx-dl --version")
    assert_match "3.0.0-beta.5", output
  end
end