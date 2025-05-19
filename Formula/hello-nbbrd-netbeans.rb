# Generated with JReleaser 1.18.0 at 2025-05-19T13:39:16.869831384Z

class HelloNbbrdNetbeans < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.5.2/sandbox-netbeans-standalone-2.5.2-osx-x86_64.zip"
  version "2.5.2"
  sha256 "b74c79e17e45d0ae6e99817dc7ab5bdf0580322d09ede42dff16b579da3894b9"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/hello-nbbrd-netbeans" => "hello-nbbrd-netbeans"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-netbeans --version")
    assert_match "2.5.2", output
  end
end
