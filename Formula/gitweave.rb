class Gitweave < Formula
  desc "Patch-based version control that exports to plain Git"
  homepage "https://github.com/rvielma/gitweave-releases"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvielma/gitweave-releases/releases/download/v0.1.0/gitweave-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "a59f8a939f72d4bfb70bcca6c8ed3a3f5532df8a575321a577a5d3de9807f199"
    end
    on_intel do
      url "https://github.com/rvielma/gitweave-releases/releases/download/v0.1.0/gitweave-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "a186b027e829ce07e1deeb33a09f1591e424c8031937a3a178ea64209792b56d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rvielma/gitweave-releases/releases/download/v0.1.0/gitweave-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2f357f4dd2f0ba11b63e4021f59f6943af4bd8438904606647a0da948b1d0c49"
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
