# Generated with JReleaser 0.10.0 at 2022-01-10T15:57:52.187832Z
class HellowNbbrd < Formula
  desc "Sandbox - Binaries"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.0.5/hellow-nbbrd-2.0.5-bin.jar", :using => :nounzip
  version "2.0.5"
  sha256 "55a91a157aa056dcbb5ecb7b7a88c50f93de4462052d5756992067008354e03e"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "hellow-nbbrd-2.0.5-bin.jar"
    bin.write_jar_script libexec/"hellow-nbbrd-2.0.5-bin.jar", "hellow-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hellow-nbbrd --version")
    assert_match "2.0.5", output
  end
end
