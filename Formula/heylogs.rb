# Generated with JReleaser 1.19.0 at 2025-08-26T07:53:56.545187764Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.13.0/heylogs-cli-0.13.0-bin.jar", :using => :nounzip
  version "0.13.0"
  sha256 "98eac7fff2b27c774eb7099e87496a529453fdc4e2b48c28863b6f044c2cc953"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.13.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.13.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.13.0", output
  end
end
