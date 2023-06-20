# Generated with JReleaser 1.5.1 at 2023-06-20T14:27:09.25058928Z
class Heylogs < Formula
  desc "Keep-a-changelog tool - Bill of Materials"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.6.0/heylogs-cli-0.6.0-bin.jar", :using => :nounzip
  version "0.6.0"
  sha256 "bf02fd45484d514c45167820bc77c3da62986bb1b22bafee27bfa47051158f32"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.6.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.6.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.6.0", output
  end
end
