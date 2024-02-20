# Generated with JReleaser 1.10.0 at 2024-02-20T11:04:05.075653481Z

class HelloNbbrdPicocli < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.4.1/sandbox-picocli-2.4.1-bin.jar", :using => :nounzip
  version "2.4.1"
  sha256 "59f6ecb54418e9d1a464c5a495e1cf1a63aaf836b0bdba5a61236c1f28664c0a"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-picocli-2.4.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd-picocli", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-picocli-2.4.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-picocli --version")
    assert_match "2.4.1", output
  end
end
