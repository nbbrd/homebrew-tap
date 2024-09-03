# Generated with JReleaser 1.14.0 at 2024-09-03T09:54:44.624031195Z

class Sasquatch < Formula
  desc "A java reader of SAS datasets - Bill of Materials"
  homepage "https://github.com/nbbrd/sasquatch"
  url "https://github.com/nbbrd/sasquatch/releases/download/v1.1.0/sasquatch-cli-1.1.0-bin.jar", :using => :nounzip
  version "1.1.0"
  sha256 "4d8e02447ea80dcac3b4929b3089d77a17e9fbefdfee77ee602ffa126bcc8d14"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sasquatch-cli-1.1.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/sasquatch", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sasquatch-cli-1.1.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/sasquatch --version")
    assert_match "1.1.0", output
  end
end
