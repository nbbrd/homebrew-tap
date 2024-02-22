# Generated with JReleaser 1.10.0 at 2024-02-22T13:51:08.797569343Z

class HelloNbbrdNetbeans < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.4.2/sandbox-netbeans-app-2.4.2-osx-x86_64.zip"
  version "2.4.2"
  sha256 "5964740a3a43b1d972edd24872a0c9ca13e46bd2f931fd487cb58c7de662c5e3"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/hello-nbbrd-netbeans" => "hello-nbbrd-netbeans"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-netbeans --version")
    assert_match "2.4.2", output
  end
end
