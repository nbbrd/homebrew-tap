# Generated with JReleaser 1.17.0 at 2025-03-11T09:29:03.384751129Z

class Beanzooka < Formula
  desc "NetBeans Platform Launcher"
  homepage "https://github.com/nbbrd/beanzooka"
  url "https://github.com/nbbrd/beanzooka/releases/download/v1.4.0/beanzooka-1.4.0-bin.jar", :using => :nounzip
  version "1.4.0"
  sha256 "387176b0814fac8ee438248a3194c2f41e48ab2a5a7d8014e2ba3d3afd5390d7"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@9"

  def install
    libexec.install "beanzooka-1.4.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/beanzooka", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/beanzooka-1.4.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/beanzooka --version")
    assert_match "1.4.0", output
  end
end
