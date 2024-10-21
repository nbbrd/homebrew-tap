# Generated with JReleaser 1.14.0 at 2024-10-21T08:30:53.176442269Z

class HelloNbbrdSwing < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.5.0/sandbox-swing-2.5.0-bin.jar", :using => :nounzip
  version "2.5.0"
  sha256 "e7975e5dc924ef8dd9e2fb2f42f0237f221a081d2d750e1ebc8cbc07c191ba50"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-swing-2.5.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd-swing", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-swing-2.5.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-swing --version")
    assert_match "2.5.0", output
  end
end
