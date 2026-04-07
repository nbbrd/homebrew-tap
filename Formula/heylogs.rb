# Generated with JReleaser 1.23.0 at 2026-04-07T14:01:49.801001395Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.17.0/heylogs-cli-0.17.0-bin.jar", :using => :nounzip
  version "0.17.0"
  sha256 "cd18b80c7374b62eb9d44175a06f067b1a28dd59b7dfc798c8ae5c5794eb2e3e"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.17.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.17.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.17.0", output
  end
end
