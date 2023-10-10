# Generated with JReleaser 1.8.0 at 2023-10-10T09:10:53.638584967Z
class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.7.0/heylogs-cli-0.7.0-bin.jar", :using => :nounzip
  version "0.7.0"
  sha256 "186ad727240414cd895ade12dbcc9fccaa28a55ba11579b31a00ac1bcaae2e95"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.7.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.7.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.7.0", output
  end
end
