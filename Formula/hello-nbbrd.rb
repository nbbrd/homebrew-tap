# Generated with JReleaser 1.7.0 at 2023-06-28T07:19:05.336009237Z
class HelloNbbrd < Formula
  desc "Sandbox - Bill of Materials"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.3.0/sandbox-cli-2.3.0-bin.jar", :using => :nounzip
  version "2.3.0"
  sha256 "0cf873b97ad81813bc6b40cd5ad10ed3bfa73b9414d9bff490bc4aad2b8adb19"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-cli-2.3.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-cli-2.3.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "2.3.0", output
  end
end
