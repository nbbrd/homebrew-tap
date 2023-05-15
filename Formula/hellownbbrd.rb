# Generated with JReleaser 1.5.1 at 2023-05-15T10:54:00.21641078Z
class HellowNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.2.10/sandbox-desktop-2.2.10-bin.jar", :using => :nounzip
  version "2.2.10"
  sha256 "602dd24fa6cde56d20c796a74e104838b46e0ab72cf37e6c477e6b369f32bd86"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-desktop-2.2.10-bin.jar"

    bin.mkpath
    File.open("#{bin}/hellow-nbbrd", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-desktop-2.2.10-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hellow-nbbrd --version")
    assert_match "2.2.10", output
  end
end
