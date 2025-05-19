# Generated with JReleaser 1.18.0 at 2025-05-19T13:39:16.869831384Z

class HelloNbbrdSwing < Formula
  desc "Hello NBBRD"
  homepage "https://github.com/nbbrd/sandbox"
  url "https://github.com/nbbrd/sandbox/releases/download/v2.5.2/sandbox-swing-2.5.2-bin.jar", :using => :nounzip
  version "2.5.2"
  sha256 "898db92a0ece14d336deab8198d4916a4fc35d187f61ad0a617dc8af33a4fa0b"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@8"

  def install
    libexec.install "sandbox-swing-2.5.2-bin.jar"

    bin.mkpath
    File.open("#{bin}/hello-nbbrd-swing", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/sandbox-swing-2.5.2-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/hello-nbbrd-swing --version")
    assert_match "2.5.2", output
  end
end
