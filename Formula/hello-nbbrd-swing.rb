# Generated with JReleaser 1.14.0 at 2024-10-20T18:00:12.794047695Z

class HelloNbbrdSwing < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.4.5/sandbox-swing-2.4.5-bin.jar", :using => :nounzip
  version "2.4.5"
  sha256 "edb29b09406ddda176d0b8e50af892d9906264cd8c988d01a40a67b166bd6bfb"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-swing-2.4.5-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd-swing", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-swing-2.4.5-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-swing --version")
    assert_match "2.4.5", output
  end
end
