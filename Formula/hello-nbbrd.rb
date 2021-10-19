class HelloNbbrd < Formula
  desc "Sandbox - Binaries"
  homepage "https://github.com/nbbrd/sandbox"
  version "2.0.1"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.0.1/hello-nbbrd-2.0.1-bin.jar", :using => :nounzip
  sha256 "437e5b881f4bea5fadaf6959988040152ebe5b6ace5fa4f2aa4247569d57a37f"
  license "European Union Public Licence (EUPL)"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install "hello-nbbrd-2.0.1-bin.jar"
    bin.write_jar_script libexec/"hello-nbbrd-2.0.1-bin.jar", "hello-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "2.0.1", output
  end
end