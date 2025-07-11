# Generated with JReleaser 1.19.0 at 2025-07-11T10:40:46.892313101Z

class HelloNbbrdPicocli < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.6.1/sandbox-picocli-2.6.1-bin.jar", :using => :nounzip
  version "2.6.1"
  sha256 "d6382877a91e20e1df0a532ad6563f796adfb96e67f7710771972864bd761ebc"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-picocli-2.6.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd-picocli", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-picocli-2.6.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-picocli --version")
    assert_match "2.6.1", output
  end
end
