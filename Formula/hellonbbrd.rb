# Generated with JReleaser 1.3.1 at 2022-11-22T10:20:30.640023757Z
class HelloNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.2.4/sandbox-cli-2.2.4-bin.jar", :using => :nounzip
  version "2.2.4"
  sha256 "32714954ebbac9ccd26b5fe2beae5098dc75e43c509d77e3e69590be24347002"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-cli-2.2.4-bin.jar"
    bin.write_jar_script libexec/"sandbox-cli-2.2.4-bin.jar", "hello-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "2.2.4", output
  end
end
