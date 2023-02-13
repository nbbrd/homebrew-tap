# Generated with JReleaser 1.4.0 at 2023-02-13T13:11:14.058371844Z
class SdmxDl < Formula
  desc "Download SDMX data - CLI"
  homepage "https://github.com/nbbrd/sdmx-dl"
  url "https://github.com/nbbrd/sdmx-dl/releases/download/v3.0.0-beta.10/sdmx-dl-cli-3.0.0-beta.10-bin.jar", :using => :nounzip
  version "3.0.0-beta.10"
  sha256 "80fe6eb97f4b697489e419a95e2cb474444f98c53c5073bdc191c1faa6efd023"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sdmx-dl-cli-3.0.0-beta.10-bin.jar"
    bin.write_jar_script libexec/"sdmx-dl-cli-3.0.0-beta.10-bin.jar", "sdmx-dl"
  end

  test do
    output = shell_output("#{bin}/sdmx-dl --version")
    assert_match "3.0.0-beta.10", output
  end
end
