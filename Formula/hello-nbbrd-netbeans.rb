# Generated with JReleaser 1.18.0 at 2025-05-19T13:34:21.526055516Z

class HelloNbbrdNetbeans < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.5.1/sandbox-netbeans-standalone-2.5.1-osx-x86_64.zip"
  version "2.5.1"
  sha256 "94f8e02dc77363cef70b94a0613695e349dcafe20709e45d94abb2e106b2285f"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/hello-nbbrd-netbeans" => "hello-nbbrd-netbeans"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-netbeans --version")
    assert_match "2.5.1", output
  end
end
