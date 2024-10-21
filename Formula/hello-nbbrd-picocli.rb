# Generated with JReleaser 1.14.0 at 2024-10-21T08:30:53.176442269Z

class HelloNbbrdPicocli < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.5.0/sandbox-picocli-2.5.0-bin.jar", :using => :nounzip
  version "2.5.0"
  sha256 "661913dc91d345236fbe1ea7d18cd228e62916960493ec9d30cc65e687a7717f"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-picocli-2.5.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd-picocli", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-picocli-2.5.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-picocli --version")
    assert_match "2.5.0", output
  end
end
