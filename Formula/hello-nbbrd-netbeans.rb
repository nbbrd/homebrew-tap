# Generated with JReleaser 1.19.0 at 2025-07-11T10:40:46.892313101Z

class HelloNbbrdNetbeans < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.6.1/sandbox-netbeans-standalone-2.6.1-osx-x86_64.zip"
  version "2.6.1"
  sha256 "af3c03e2ce9955785f7119ad0c14d4b0818c116fa7b1f8ed4b7f4f4221451d5d"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/hello-nbbrd-netbeans" => "hello-nbbrd-netbeans"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-netbeans --version")
    assert_match "2.6.1", output
  end
end
