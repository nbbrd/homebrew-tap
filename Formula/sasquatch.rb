# Generated with JReleaser 1.17.0 at 2025-03-06T10:45:18.748861639Z

class Sasquatch < Formula
  desc "A java reader of SAS datasets - Bill of Materials"
  homepage "https://github.com/nbbrd/sasquatch"
  url "https://github.com/nbbrd/sasquatch/releases/download/v1.1.1/sasquatch-cli-1.1.1-bin.jar", :using => :nounzip
  version "1.1.1"
  sha256 "f996d5179f7f3a4ca758800c66d9f37a17b2c41f2abe35c840c9e66daa416cd6"
  license "European Union Public Licence (EUPL)"


  def install
    libexec.install "sasquatch-cli-1.1.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/sasquatch", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sasquatch-cli-1.1.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/sasquatch --version")
    assert_match "1.1.1", output
  end
end
