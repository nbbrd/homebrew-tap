# Generated with JReleaser 1.18.0 at 2025-05-19T13:39:16.869831384Z

class HelloNbbrdPicocli < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.5.2/sandbox-picocli-2.5.2-bin.jar", :using => :nounzip
  version "2.5.2"
  sha256 "c08ac9dc564e78a511357c2049b1f1047f563b537d677e64dc6b7b1f6b4f92e7"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-picocli-2.5.2-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd-picocli", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-picocli-2.5.2-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-picocli --version")
    assert_match "2.5.2", output
  end
end
