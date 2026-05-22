# Generated with JReleaser 1.24.0 at 2026-05-22T15:16:57.500458623Z

class SdmxDl < Formula
  desc "Easily download official statistics"
  homepage "https://github.com/nbbrd/sdmx-dl"
  url "https://github.com/nbbrd/sdmx-dl/releases/download/v3.0.0/sdmx-dl-cli-3.0.0-bin.jar", :using => :nounzip
  version "3.0.0"
  sha256 "38d7f095760368e0ecb04814a96d10b1cad4946cebae7bbbee8e712291120325"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sdmx-dl-cli-3.0.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/sdmx-dl", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sdmx-dl-cli-3.0.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/sdmx-dl --version")
    assert_match "3.0.0", output
  end
end
