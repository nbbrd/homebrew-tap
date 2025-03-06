# Generated with JReleaser 1.17.0 at 2025-03-06T10:45:18.748861639Z

class Sasquatchw < Formula
  desc "A java reader of SAS datasets - Bill of Materials"
  homepage "https://github.com/nbbrd/sasquatch"
  url "https://github.com/nbbrd/sasquatch/releases/download/v1.1.1/sasquatch-desktop-1.1.1-bin.jar", :using => :nounzip
  version "1.1.1"
  sha256 "da2dd2787885bab035c2bf299b1b88c75ec3ac9dffc0333d43bedf856558e44a"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sasquatch-desktop-1.1.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/sasquatchw", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sasquatch-desktop-1.1.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/sasquatchw --version")
    assert_match "1.1.1", output
  end
end
