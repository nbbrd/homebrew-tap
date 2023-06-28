# Generated with JReleaser 1.7.0 at 2023-06-28T07:19:05.336009237Z
class HellowNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.3.0/sandbox-desktop-2.3.0-bin.jar", :using => :nounzip
  version "2.3.0"
  sha256 "cbaf618765ac11553befaf4aaeea9611d7f142dde6a7a81dabe17abec49d64c2"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-desktop-2.3.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/hellow-nbbrd", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-desktop-2.3.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hellow-nbbrd --version")
    assert_match "2.3.0", output
  end
end
