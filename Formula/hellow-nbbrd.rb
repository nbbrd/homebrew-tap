# Generated with JReleaser 1.8.0 at 2023-09-29T11:18:10.022574312Z
class HellowNbbrd < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.3.3/sandbox-desktop-2.3.3-bin.jar", :using => :nounzip
  version "2.3.3"
  sha256 "7bcec8f337235a4542df283212c712965a060698544e8d75c952f4167b25c442"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-desktop-2.3.3-bin.jar"

    bin.mkpath
    File.open("#{bin}/hellow-nbbrd", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-desktop-2.3.3-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hellow-nbbrd --version")
    assert_match "2.3.3", output
  end
end
