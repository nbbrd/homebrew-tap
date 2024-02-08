# Generated with JReleaser 1.10.0 at 2024-02-08T15:24:07.629353777Z

class HelloNbbrd < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.3.4/sandbox-cli-2.3.4-bin.jar", :using => :nounzip
  version "2.3.4"
  sha256 "2f65034815c1082e11fb9251d2e1065d87f33be159dae9a0897d91466ba5eaba"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-cli-2.3.4-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-cli-2.3.4-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd --version")
    assert_match "2.3.4", output
  end
end
