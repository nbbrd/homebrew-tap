# Generated with JReleaser 1.8.0 at 2023-10-16T13:28:56.985041063Z
class SdmxDl < Formula
  desc "Easily download official statistics"
  homepage "https://github.com/nbbrd/sdmx-dl"
  url "https://github.com/nbbrd/sdmx-dl/releases/download/v3.0.0-beta.12/sdmx-dl-cli-3.0.0-beta.12-bin.jar", :using => :nounzip
  version "3.0.0-beta.12"
  sha256 "391de5eef43933eebc72cc34c0be15bbb9210c7b914c46ebaf796a7e8b67d42e"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sdmx-dl-cli-3.0.0-beta.12-bin.jar"

    bin.mkpath
    File.open("#{bin}/sdmx-dl", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sdmx-dl-cli-3.0.0-beta.12-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/sdmx-dl --version")
    assert_match "3.0.0-beta.12", output
  end
end
