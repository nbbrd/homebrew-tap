# Generated with JReleaser 1.8.0 at 2023-09-29T11:18:10.022574312Z
class HelloNbbrd < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.3.3/sandbox-cli-2.3.3-bin.jar", :using => :nounzip
  version "2.3.3"
  sha256 "f38e920413d5c5a59b86113d49849a172333bb110d3753f346539e5417936f2f"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-cli-2.3.3-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-cli-2.3.3-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "2.3.3", output
  end
end
