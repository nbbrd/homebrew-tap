# Generated with JReleaser 1.12.0 at 2024-06-04T11:46:11.847957992Z

class Beanzooka < Formula
  desc "NetBeans Platform Launcher"
  homepage "https://github.com/nbbrd/beanzooka"
  url "https://github.com/nbbrd/beanzooka/releases/download/v1.2.0/beanzooka-1.2.0-bin.jar", :using => :nounzip
  version "1.2.0"
  sha256 "537ca96ad7ac41c5c05ca24c8a031dd5694cc3f04f614ff714aec72d35a39987"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@9"

  def install
    libexec.install "beanzooka-1.2.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/beanzooka", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/beanzooka-1.2.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/beanzooka --version")
    assert_match "1.2.0", output
  end
end
