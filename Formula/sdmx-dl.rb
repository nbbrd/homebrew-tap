# Generated with JReleaser 1.22.0 at 2026-01-22T14:22:13.806113882Z

class SdmxDl < Formula
  desc "Easily download official statistics"
  homepage "https://github.com/nbbrd/sdmx-dl"
  url "https://github.com/nbbrd/sdmx-dl/releases/download/v3.0.0-beta.17/sdmx-dl-cli-3.0.0-beta.17-bin.jar", :using => :nounzip
  version "3.0.0-beta.17"
  sha256 "aa6f8d31dd78cc8bc14bfb83f0412a5cdf9a05a8c1aeaa57f8f0aae67c9e7436"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sdmx-dl-cli-3.0.0-beta.17-bin.jar"

    bin.mkpath
    File.open("#{bin}/sdmx-dl", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sdmx-dl-cli-3.0.0-beta.17-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/sdmx-dl --version")
    assert_match "3.0.0-beta.17", output
  end
end
