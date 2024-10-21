# Generated with JReleaser 1.14.0 at 2024-10-21T08:30:53.176442269Z

class HelloNbbrdNetbeans < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.5.0/sandbox-netbeans-standalone-2.5.0-osx-x86_64.zip"
  version "2.5.0"
  sha256 "58a5d2d965bad4c4e2a351c1a758c52ab5f72d3a1f0bab35e767539d99fee74d"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/hello-nbbrd-netbeans" => "hello-nbbrd-netbeans"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-netbeans --version")
    assert_match "2.5.0", output
  end
end
