# Generated with JReleaser 1.13.1 at 2024-07-16T07:16:46.730770765Z

class Beanzooka < Formula
  desc "NetBeans Platform Launcher"
  homepage "https://github.com/nbbrd/beanzooka"
  url "https://github.com/nbbrd/beanzooka/releases/download/v1.3.0/beanzooka-1.3.0-bin.jar", :using => :nounzip
  version "1.3.0"
  sha256 "058164918f5d3db10993891adee3f82b1a0ab040e7e65432dfec2dc5733fa474"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@9"

  def install
    libexec.install "beanzooka-1.3.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/beanzooka", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/beanzooka-1.3.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/beanzooka --version")
    assert_match "1.3.0", output
  end
end
