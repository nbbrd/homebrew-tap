# Generated with JReleaser 1.10.0 at 2024-02-22T17:08:33.098680105Z

class HelloNbbrdNetbeans < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.4.4/sandbox-netbeans-standalone-2.4.4-osx-x86_64.zip"
  version "2.4.4"
  sha256 "8710bca9d375a3b3e73c39a3a424d983fc99ca4ba835ad5989c150b3d0dcdb2b"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/hello-nbbrd-netbeans" => "hello-nbbrd-netbeans"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-netbeans --version")
    assert_match "2.4.4", output
  end
end
