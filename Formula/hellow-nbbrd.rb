# Generated with JReleaser 1.2.0 at 2022-09-28T08:54:34.27446657Z
class HellowNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.2.3/sandbox-desktop-2.2.3-bin.jar", :using => :nounzip
  version "2.2.3"
  sha256 "18c53ec4614b31bfe8996c0c001f43fa81d0be06631cfa7cad2b39690f51be03"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-desktop-2.2.3-bin.jar"
    bin.write_jar_script libexec/"sandbox-desktop-2.2.3-bin.jar", "hellow-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hellow-nbbrd --version")
    assert_match "2.2.3", output
  end
end
