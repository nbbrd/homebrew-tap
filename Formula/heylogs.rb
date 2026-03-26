# Generated with JReleaser 1.23.0 at 2026-03-26T10:26:15.106126967Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.16.0/heylogs-cli-0.16.0-bin.jar", :using => :nounzip
  version "0.16.0"
  sha256 "4ebe87178fd6474099f7fce3b58951bdce20d1a0ac67c6b6cf701f436f8a2c5b"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.16.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.16.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.16.0", output
  end
end
