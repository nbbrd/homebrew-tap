# Generated with JReleaser 1.24.0 at 2026-06-17T09:01:16.831065288Z

class Sasquatchw < Formula
  desc "A java reader of SAS datasets - Bill of Materials"
  homepage "https://github.com/nbbrd/sasquatch"
  url "https://github.com/nbbrd/sasquatch/releases/download/v1.1.2/sasquatch-desktop-1.1.2-bin.jar", :using => :nounzip
  version "1.1.2"
  sha256 "09767ba9516697952a88904b36342122293f6d9120c36006cb3fed7d1e7b0e49"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sasquatch-desktop-1.1.2-bin.jar"

    bin.mkpath
    File.open("#{bin}/sasquatchw", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sasquatch-desktop-1.1.2-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/sasquatchw --version")
    assert_match "1.1.2", output
  end
end
