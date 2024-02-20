# Generated with JReleaser 1.10.0 at 2024-02-20T11:04:05.075653481Z

class HelloNbbrdSwing < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.4.1/sandbox-swing-2.4.1-bin.jar", :using => :nounzip
  version "2.4.1"
  sha256 "a50b8662ba4ffb6773b46e885cde4af5fb9e54dd8235bf8f810d4ba5f8c211a6"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-swing-2.4.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd-swing", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-swing-2.4.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-swing --version")
    assert_match "2.4.1", output
  end
end
