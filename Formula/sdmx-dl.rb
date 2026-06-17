# Generated with JReleaser 1.24.0 at 2026-06-17T14:30:09.663057103Z

class SdmxDl < Formula
  desc "Easily download official statistics"
  homepage "https://github.com/nbbrd/sdmx-dl"
  url "https://github.com/nbbrd/sdmx-dl/releases/download/v3.1.1/sdmx-dl-cli-3.1.1-bin.jar", :using => :nounzip
  version "3.1.1"
  sha256 "947fe733fe07cde3c1b6d32803e3b74ee0570e8b89d2047fbd8f6adfa9d1d13d"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sdmx-dl-cli-3.1.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/sdmx-dl", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sdmx-dl-cli-3.1.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/sdmx-dl --version")
    assert_match "3.1.1", output
  end
end
