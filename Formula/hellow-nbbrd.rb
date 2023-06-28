# Generated with JReleaser 1.7.0 at 2023-06-28T07:30:49.965098004Z
class HellowNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.3.1/sandbox-desktop-2.3.1-bin.jar", :using => :nounzip
  version "2.3.1"
  sha256 "e4297f7a49ff3ebba9c487c88e45b316c7ea51580f9c9664a52b19177be70ab3"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-desktop-2.3.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/hellow-nbbrd", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-desktop-2.3.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hellow-nbbrd --version")
    assert_match "2.3.1", output
  end
end
