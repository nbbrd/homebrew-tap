# Generated with JReleaser 1.19.0 at 2025-08-18T08:36:23.74265803Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.12.1/heylogs-cli-0.12.1-bin.jar", :using => :nounzip
  version "0.12.1"
  sha256 "aad6d2cf9bcf0e6e7f239713251e38c375f487049581af740361713645098e4b"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.12.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.12.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.12.1", output
  end
end
