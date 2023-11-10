# Generated with JReleaser 1.9.0 at 2023-11-10T13:38:27.003625252Z
class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.7.2/heylogs-cli-0.7.2-bin.jar", :using => :nounzip
  version "0.7.2"
  sha256 "920d3edb4424aa7ccffcbaaa0172c7d00c9acbe3e18f19438e0c94c57f7a0fc3"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.7.2-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.7.2-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.7.2", output
  end
end
