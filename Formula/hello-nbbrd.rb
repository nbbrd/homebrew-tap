class HelloNbbrd < Formula
  desc "Sandbox - Binaries"
  homepage "https://github.com/nbbrd/sandbox"
  version "2.0.0"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.0.0/hello-nbbrd-2.0.0-bin.jar", :using => :nounzip
  sha256 "ef92d051eb431d08309d48c916daf118df86cb998b619b87fec3767beeb09513"
  license "European Union Public Licence (EUPL)"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install "hello-nbbrd-2.0.0-bin.jar"
    bin.write_jar_script libexec/"hello-nbbrd-2.0.0-bin.jar", "hello-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "2.0.0", output
  end
end