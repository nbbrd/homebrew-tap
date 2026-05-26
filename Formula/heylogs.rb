# Generated with JReleaser 1.24.0 at 2026-05-26T08:25:35.385028075Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.18.1/heylogs-cli-0.18.1-bin.jar", :using => :nounzip
  version "0.18.1"
  sha256 "9d52e87aff666834e63879b5559872a6c590c5b235b3a3608893fc60f647cb7d"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.18.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.18.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.18.1", output
  end
end
