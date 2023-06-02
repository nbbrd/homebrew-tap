# Generated with JReleaser 1.5.1 at 2023-06-02T09:05:01.176724925Z
class SdmxDl < Formula
  desc "Download SDMX data - CLI"
  homepage "https://github.com/nbbrd/sdmx-dl"
  url "https://github.com/nbbrd/sdmx-dl/releases/download/v3.0.0-beta.11/sdmx-dl-cli-3.0.0-beta.11-bin.jar", :using => :nounzip
  version "3.0.0-beta.11"
  sha256 "152284cb46232b5a8b337238ef80630e285bc9d7493c09b43ec4a7f30ac878d4"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sdmx-dl-cli-3.0.0-beta.11-bin.jar"

    bin.mkpath
    File.open("#{bin}/sdmx-dl", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sdmx-dl-cli-3.0.0-beta.11-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/sdmx-dl --version")
    assert_match "3.0.0-beta.11", output
  end
end
