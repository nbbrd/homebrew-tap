class HelloNbbrd < Formula
  desc "Sandbox - CLI"
  homepage "https://github.com/nbbrd/sandbox"
  version "1.17.3"
  url "https://github.com/nbbrd/sandbox/releases/download/v1.17.3/hello-nbbrd-1.17.3-bin.jar", :using => :nounzip
  sha256 "25d9b3bb87df89e658bd95bebbf8dcc6302246982e32446d4092938dd75f820e"
  license "European Union Public Licence (EUPL)"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    File.open("hello-nbbrd", "w") do |f|
      f << "#!/bin/bash\n"
      f << "java -jar $JAVA_OPTS #{prefix}/hello-nbbrd-1.17.3-bin.jar \"$@\"\n"
    end
    prefix.install "hello-nbbrd-1.17.3-bin.jar"
    bin.install "hello-nbbrd"
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "1.17.3", output
  end
end