# Generated with JReleaser 1.7.0 at 2023-06-28T07:30:49.965098004Z
class HelloNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.3.1/sandbox-cli-2.3.1-bin.jar", :using => :nounzip
  version "2.3.1"
  sha256 "f734e1e43de21893b297a32f0b96ee5105588fd183bfe6b22311c42b0e0e082f"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-cli-2.3.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-cli-2.3.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "2.3.1", output
  end
end
