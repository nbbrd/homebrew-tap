# Generated with JReleaser 1.11.0 at 2024-04-10T07:40:11.338857614Z

class Heylogs < Formula
  desc "Keep-a-changelog tool"
  homepage "https://github.com/nbbrd/heylogs"
  url "https://github.com/nbbrd/heylogs/releases/download/v0.8.0/heylogs-cli-0.8.0-bin.jar", :using => :nounzip
  version "0.8.0"
  sha256 "db8af54697013889ff5b97663d94b4d21014f5e05af074a7be2b74b6b87d4310"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "heylogs-cli-0.8.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/heylogs", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/heylogs-cli-0.8.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/heylogs --version")
    assert_match "0.8.0", output
  end
end
