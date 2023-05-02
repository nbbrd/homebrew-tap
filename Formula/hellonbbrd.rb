# Generated with JReleaser 1.5.1 at 2023-05-02T08:43:02.083398911Z
class HelloNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.2.9/sandbox-cli-2.2.9-bin.jar", :using => :nounzip
  version "2.2.9"
  sha256 "1174beffcc1a01eb7c48556072fc84ba8ec71348adda160aa7dfa1a6840b8448"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-cli-2.2.9-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-cli-2.2.9-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "2.2.9", output
  end
end
