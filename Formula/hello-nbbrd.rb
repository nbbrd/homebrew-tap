class HelloNbbrd < Formula
  desc "Sandbox - CLI"
  homepage "https://github.com/nbbrd/sandbox"
  version "1.17.4"
  url "https://github.com/nbbrd/sandbox/releases/download/v1.17.4/hello-nbbrd-1.17.4-bin.jar", :using => :nounzip
  sha256 "a3b0567593328701a131801d470930a009a8e643beff94a584a0ec6abfa5ae48"
  license "European Union Public Licence (EUPL)"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    File.open("hello-nbbrd", "w") do |f|
      f << "#!/bin/bash\n"
      f << "java -jar $JAVA_OPTS #{prefix}/hello-nbbrd-1.17.4-bin.jar \"$@\"\n"
    end
    prefix.install "hello-nbbrd-1.17.4-bin.jar"
    bin.install "hello-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "1.17.4", output
  end
end