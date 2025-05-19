# Generated with JReleaser 1.18.0 at 2025-05-19T13:34:21.526055516Z

class HelloNbbrdPicocli < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.5.1/sandbox-picocli-2.5.1-bin.jar", :using => :nounzip
  version "2.5.1"
  sha256 "8b705f2e5b3672b5badb1436d8394aed86cc32edbee54d8c18f4f9b7cbaa7f1d"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-picocli-2.5.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd-picocli", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-picocli-2.5.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-picocli --version")
    assert_match "2.5.1", output
  end
end
