# Generated with JReleaser 1.8.0 at 2023-09-19T12:11:07.015679434Z
class HelloNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.3.2/sandbox-cli-2.3.2-bin.jar", :using => :nounzip
  version "2.3.2"
  sha256 "1b6a5de383692a1d4b7274dbf9f9ab4695e6f3c72fe098a96819f4e8da538fe2"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-cli-2.3.2-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-cli-2.3.2-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "2.3.2", output
  end
end
