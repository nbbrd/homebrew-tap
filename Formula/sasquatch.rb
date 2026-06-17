# Generated with JReleaser 1.24.0 at 2026-06-17T09:01:16.831065288Z

class Sasquatch < Formula
  desc "A java reader of SAS datasets - Bill of Materials"
  homepage "https://github.com/nbbrd/sasquatch"
  url "https://github.com/nbbrd/sasquatch/releases/download/v1.1.2/sasquatch-cli-1.1.2-bin.jar", :using => :nounzip
  version "1.1.2"
  sha256 "a19fa6addff58de56c619f583c8a1b87bb8436dcda9573ddedf66b40cedb962f"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sasquatch-cli-1.1.2-bin.jar"

    bin.mkpath
    File.open("#{bin}/sasquatch", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sasquatch-cli-1.1.2-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/sasquatch --version")
    assert_match "1.1.2", output
  end
end
