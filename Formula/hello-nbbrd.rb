# Generated with JReleaser 0.10.0 at 2022-01-10T15:57:52.187832Z
class HelloNbbrd < Formula
  desc "Sandbox - Binaries"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.0.5/hello-nbbrd-2.0.5-bin.jar", :using => :nounzip
  version "2.0.5"
  sha256 "094ea90b4baf21e07104890940318d6998b4cf0fa4271433fd8c7e6b91b3816e"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "hello-nbbrd-2.0.5-bin.jar"
    bin.write_jar_script libexec/"hello-nbbrd-2.0.5-bin.jar", "hello-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "2.0.5", output
  end
end
