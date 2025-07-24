# Generated with JReleaser 1.19.0 at 2025-07-24T07:36:39.837682661Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.11.1/heylogs-cli-0.11.1-bin.jar", :using => :nounzip
  version "0.11.1"
  sha256 "6d367ff114e7f7900d87e15977800c135b34d25dd584f9e92db9b96e4479fa82"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.11.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.11.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.11.1", output
  end
end
