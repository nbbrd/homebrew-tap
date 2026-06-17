# Generated with JReleaser 1.24.0 at 2026-06-17T10:17:52.695807781Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.19.1/heylogs-cli-0.19.1-bin.jar", :using => :nounzip
  version "0.19.1"
  sha256 "4b97da79016acbc6da08c70d462591d034cf7499a7ad099319c578179d9359db"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.19.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.19.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.19.1", output
  end
end
