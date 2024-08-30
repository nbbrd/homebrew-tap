# Generated with JReleaser 1.13.1 at 2024-08-30T10:03:44.696282868Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.9.2/heylogs-cli-0.9.2-bin.jar", :using => :nounzip
  version "0.9.2"
  sha256 "9520f998c0ff91c0f49896d08a8c33ad0d47dd112acc876f25eec265cfb02fc9"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.9.2-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.9.2-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.9.2", output
  end
end
