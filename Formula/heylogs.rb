# Generated with JReleaser 1.11.0 at 2024-04-18T14:30:18.361193652Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.8.1/heylogs-cli-0.8.1-bin.jar", :using => :nounzip
  version "0.8.1"
  sha256 "09a142163d17c9ee9220e919817a9e1cd72cf4eb061b2c8bfe1f9e5190cdca6c"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.8.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.8.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.8.1", output
  end
end
