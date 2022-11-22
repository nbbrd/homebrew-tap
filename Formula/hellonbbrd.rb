# Generated with JReleaser 1.3.1 at 2022-11-22T10:29:16.929091035Z
class HelloNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.2.6/sandbox-cli-2.2.6-bin.jar", :using => :nounzip
  version "2.2.6"
  sha256 "409f2f3bdd704e7c1525599622a2e0bc3f11819487a80b132c1c42afd7b85000"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-cli-2.2.6-bin.jar"
    bin.write_jar_script libexec/"sandbox-cli-2.2.6-bin.jar", "hello-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "2.2.6", output
  end
end
