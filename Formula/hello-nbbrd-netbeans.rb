# Generated with JReleaser 1.14.0 at 2024-10-20T18:00:12.794047695Z

class HelloNbbrdNetbeans < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.4.5/sandbox-netbeans-standalone-2.4.5-osx-x86_64.zip"
  version "2.4.5"
  sha256 "cceeb2dbd234bfa066a4e5d086706745b18f5751d465fac2b7018d5ea22ffe67"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/hello-nbbrd-netbeans" => "hello-nbbrd-netbeans"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-netbeans --version")
    assert_match "2.4.5", output
  end
end
