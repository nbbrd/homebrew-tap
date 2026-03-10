# Generated with JReleaser 1.23.0 at 2026-03-10T12:46:30.728079346Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.15.0/heylogs-cli-0.15.0-bin.jar", :using => :nounzip
  version "0.15.0"
  sha256 "2853531327d3950657689d523326f05a6c0a6c95deca7005916dbc3ffce09573"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.15.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.15.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.15.0", output
  end
end
