# Generated with JReleaser 1.10.0 at 2024-02-20T11:04:05.075653481Z

class HelloNbbrdNetbeans < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.4.1/sandbox-netbeans-app-2.4.1-mac-x86_64.zip"
  version "2.4.1"
  sha256 "8ea65db8b0862e573ebdbb04cd36c2b17ea7f6b6d2723e8362786c3415f65f36"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/sandboxnetbeans" => "sandboxnetbeans"
  end

  test do
    output = shell_output("#{bin}/sandboxnetbeans --version")
    assert_match "2.4.1", output
  end
end
