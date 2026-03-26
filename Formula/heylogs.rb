# Generated with JReleaser 1.23.0 at 2026-03-26T12:09:33.782727502Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.16.1/heylogs-cli-0.16.1-bin.jar", :using => :nounzip
  version "0.16.1"
  sha256 "763eb7584563e003cd0a9159371ebabccf322f9e213e3a41e08d11aeace3f3e2"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.16.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.16.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.16.1", output
  end
end
