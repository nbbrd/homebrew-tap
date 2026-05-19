# Generated with JReleaser 1.24.0 at 2026-05-19T12:56:46.878418724Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.18.0/heylogs-cli-0.18.0-bin.jar", :using => :nounzip
  version "0.18.0"
  sha256 "cf188f2082f51f4bffb883b6a46773d13ac8b0856dcf3d090862f1cf00548336"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.18.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.18.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.18.0", output
  end
end
