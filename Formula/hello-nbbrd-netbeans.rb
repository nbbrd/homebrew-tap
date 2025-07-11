# Generated with JReleaser 1.19.0 at 2025-07-11T10:17:50.157033096Z

class HelloNbbrdNetbeans < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.6.0/sandbox-netbeans-standalone-2.6.0-osx-x86_64.zip"
  version "2.6.0"
  sha256 "d2f8a26445db3fe11bb477e1a9b1b467e272bcd8493eac3f802dc0192fbeb94a"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/hello-nbbrd-netbeans" => "hello-nbbrd-netbeans"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-netbeans --version")
    assert_match "2.6.0", output
  end
end
