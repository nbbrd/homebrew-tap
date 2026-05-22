# Generated with JReleaser 1.24.0 at 2026-05-22T15:32:25.957866213Z

class Beanzooka < Formula
  desc "NetBeans Platform Launcher"
  homepage "https://github.com/nbbrd/beanzooka"
  url "https://github.com/nbbrd/beanzooka/releases/download/v1.5.0/beanzooka-1.5.0-bin.jar", :using => :nounzip
  version "1.5.0"
  sha256 "dbcf062e26a58404a022bee17017b915736b8c2bc56d43466259130a39e317f0"
  license "European Union Public Licence (EUPL)"

  depends_on "openjdk@9"

  def install
    libexec.install "beanzooka-1.5.0-bin.jar"

    bin.mkpath
    File.open("#{bin}/beanzooka", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/beanzooka-1.5.0-bin.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/beanzooka --version")
    assert_match "1.5.0", output
  end
end
