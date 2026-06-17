# Generated with JReleaser 1.24.0 at 2026-06-17T08:36:22.781863537Z

class Beanzooka < Formula
  desc "NetBeans Platform Launcher"
  homepage "https://github.com/nbbrd/beanzooka"
  url "https://github.com/nbbrd/beanzooka/releases/download/v1.5.1/beanzooka-1.5.1-bin.jar", :using => :nounzip
  version "1.5.1"
  sha256 "a70629bff32777911d8c3a60395d7b6b5a3bd3804c9982246e59c28f78952b2d"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@9"

  def install
    libexec.install "beanzooka-1.5.1-bin.jar"

    bin.mkpath
    File.open("#{bin}/beanzooka", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/beanzooka-1.5.1-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/beanzooka --version")
    assert_match "1.5.1", output
  end
end
