# Generated with JReleaser 1.16.0 at 2025-02-11T09:51:46.784221403Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.9.3/heylogs-cli-0.9.3-bin.jar", :using => :nounzip
  version "0.9.3"
  sha256 "05d0efb634bb58149c5010809a7581aa2c1e2d7625d56dfdb1137c4aa4af268a"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.9.3-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.9.3-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.9.3", output
  end
end
