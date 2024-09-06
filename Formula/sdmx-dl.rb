# Generated with JReleaser 1.13.1 at 2024-09-06T13:35:04.334807203Z

class SdmxDl < Formula
  desc "Easily download official statistics"
  homepage "https://github.com/nbbrd/sdmx-dl"
  url "https://github.com/nbbrd/sdmx-dl/releases/download/v3.0.0-beta.13/sdmx-dl-cli-3.0.0-beta.13-bin.jar", :using => :nounzip
  version "3.0.0-beta.13"
  sha256 "ff453da699f432a6650856c738981437f37bdf2d14a95f44bc87c0b4684f0207"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sdmx-dl-cli-3.0.0-beta.13-bin.jar"

    bin.mkpath
    File.open("#{bin}/sdmx-dl", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sdmx-dl-cli-3.0.0-beta.13-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/sdmx-dl --version")
    assert_match "3.0.0-beta.13", output
  end
end
