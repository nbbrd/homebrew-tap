# Generated with JReleaser 1.18.0 at 2025-05-23T09:06:57.991736169Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.10.0/heylogs-cli-0.10.0-bin.jar", :using => :nounzip
  version "0.10.0"
  sha256 "7290d5ed99987a22a916f80ac5ce6391bcc24801379652201e4ef6f480c9ac52"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.10.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.10.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.10.0", output
  end
end
