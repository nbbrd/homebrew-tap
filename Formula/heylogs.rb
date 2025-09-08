# Generated with JReleaser 1.20.0 at 2025-09-08T11:30:05.174118315Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.14.0/heylogs-cli-0.14.0-bin.jar", :using => :nounzip
  version "0.14.0"
  sha256 "033cad3a62835b2e507af669adbe732026c9b1c3cf03a47a5467461a38c60158"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.14.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.14.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.14.0", output
  end
end
