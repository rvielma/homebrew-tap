class Gitweave < Formula
  desc "Patch-based version control that exports to plain Git"
  homepage "https://github.com/rvielma/gitweave-releases"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvielma/gitweave-releases/releases/download/v0.1.1/gitweave-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "760ff8068ce6a8fa93f578a1da4460b26d07faf8f056ff91f9b77c47bcada25c"
    end
    on_intel do
      url "https://github.com/rvielma/gitweave-releases/releases/download/v0.1.1/gitweave-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "f1afc074f5b7fffa4ec1dcf00c2f5e7138230f4e99d08afadfc858c82e7d8675"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rvielma/gitweave-releases/releases/download/v0.1.1/gitweave-v0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8180054afd6bb32636f657f0ffe36dd9ec5c5a13a6c851351f8883a0cb2ca55b"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gw --version")
    system bin/"gw", "init"
    (testpath/"a.txt").write "hello\n"
    system bin/"gw", "record", "-m", "first"
    assert_match "working directory clean", shell_output("#{bin}/gw status")
  end
end
