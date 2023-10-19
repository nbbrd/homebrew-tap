# Generated with JReleaser 1.8.0 at 2023-10-19T12:14:18.579511918Z
class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.7.1/heylogs-cli-0.7.1-bin.jar", :using => :nounzip
  version "0.7.1"
  sha256 "0bd4ea04acc670018534b7fed7c2de3a1c979f307faf508a737afb23ad19571e"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.7.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.7.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.7.1", output
  end
end
