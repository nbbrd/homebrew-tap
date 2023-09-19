# Generated with JReleaser 1.8.0 at 2023-09-19T12:11:07.015679434Z
class HellowNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.3.2/sandbox-desktop-2.3.2-bin.jar", :using => :nounzip
  version "2.3.2"
  sha256 "852a124df8b42587ba08e115c756fef95b97135b6abdc211f1cc27267dc9010a"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-desktop-2.3.2-bin.jar"

    bin.mkpath
    File.open("#{bin}/hellow-nbbrd", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-desktop-2.3.2-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hellow-nbbrd --version")
    assert_match "2.3.2", output
  end
end
