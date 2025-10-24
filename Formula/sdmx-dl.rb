# Generated with JReleaser 1.20.0 at 2025-10-24T12:31:31.289783974Z

class SdmxDl < Formula
  desc "Easily download official statistics"
  homepage "https://github.com/nbbrd/sdmx-dl"
  url "https://github.com/nbbrd/sdmx-dl/releases/download/v3.0.0-beta.15/sdmx-dl-cli-3.0.0-beta.15-bin.jar", :using => :nounzip
  version "3.0.0-beta.15"
  sha256 "d656febd655ddf6abb247c9ce5bf517d938181dc7eff2b272d748b8b2b548efa"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sdmx-dl-cli-3.0.0-beta.15-bin.jar"

    bin.mkpath
    File.open("#{bin}/sdmx-dl", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sdmx-dl-cli-3.0.0-beta.15-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/sdmx-dl --version")
    assert_match "3.0.0-beta.15", output
  end
end
