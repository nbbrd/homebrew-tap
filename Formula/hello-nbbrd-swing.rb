# Generated with JReleaser 1.10.0 at 2024-02-22T17:08:33.098680105Z

class HelloNbbrdSwing < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.4.4/sandbox-swing-2.4.4-bin.jar", :using => :nounzip
  version "2.4.4"
  sha256 "d304a1eca5e435e5a040a9931af1e1c737d921a1e78417703463b166ab266bda"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-swing-2.4.4-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd-swing", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-swing-2.4.4-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-swing --version")
    assert_match "2.4.4", output
  end
end
