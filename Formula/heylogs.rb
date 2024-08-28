# Generated with JReleaser 1.13.1 at 2024-08-28T15:25:00.578458212Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.9.1/heylogs-cli-0.9.1-bin.jar", :using => :nounzip
  version "0.9.1"
  sha256 "904a1e0ec4b29d9d974df4d5502eff30779295eb9b642d3b5a5f084ed8d0b9d9"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.9.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.9.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.9.1", output
  end
end
