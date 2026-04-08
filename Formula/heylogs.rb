# Generated with JReleaser 1.23.0 at 2026-04-08T07:55:37.092289985Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.17.1/heylogs-cli-0.17.1-bin.jar", :using => :nounzip
  version "0.17.1"
  sha256 "522ecfb62aa7cb00d94d780900a43f349739f8ef938353a12817f9c2ad6ceafe"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.17.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.17.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.17.1", output
  end
end
