# Generated with JReleaser 1.20.0 at 2025-09-16T08:14:23.034311514Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.14.1/heylogs-cli-0.14.1-bin.jar", :using => :nounzip
  version "0.14.1"
  sha256 "e4fca4b242ffcfac956f35783cf500310b8fac5d8ef2c2457ac77c0f65a6f72b"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.14.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.14.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.14.1", output
  end
end
