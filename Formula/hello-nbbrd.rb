# Generated with JReleaser 1.0.0 at 2022-04-19T14:29:51.069342546Z
class HelloNbbrd < Formula
  desc "Sandbox - Binaries"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.1.0/hello-nbbrd-2.1.0-bin.jar", :using => :nounzip
  version "2.1.0"
  sha256 "9614e437bca26769c7bf7930c900ffae9e1169c8dead4e6a4d212d1b93512866"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "hello-nbbrd-2.1.0-bin.jar"
    bin.write_jar_script libexec/"hello-nbbrd-2.1.0-bin.jar", "hello-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "2.1.0", output
  end
end
