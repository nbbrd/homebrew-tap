# Generated with JReleaser 1.0.0 at 2022-06-22T12:39:34.397919798Z
class HelloNbbrd < Formula
  desc "Sandbox - Binaries"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.2.2/hello-nbbrd-2.2.2-bin.jar", :using => :nounzip
  version "2.2.2"
  sha256 "f88cdc57d3b7dda8f8804abf915487d28bbef9e0dd39a1dd1a9d24f75198d896"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "hello-nbbrd-2.2.2-bin.jar"
    bin.write_jar_script libexec/"hello-nbbrd-2.2.2-bin.jar", "hello-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "2.2.2", output
  end
end
