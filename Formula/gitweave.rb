class Gitweave < Formula
  desc "Patch-based version control that exports to plain Git"
  homepage "https://github.com/rvielma/gitweave-releases"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvielma/gitweave-releases/releases/download/v0.1.2/gitweave-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "cd43664ef37db88bd02edc6deb7556d5ee112422b2065b066aecd740784924a5"
    end
    on_intel do
      url "https://github.com/rvielma/gitweave-releases/releases/download/v0.1.2/gitweave-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "611acc5c76210092288c7ad74574ddafa800615b338c25b895ccb0d48a3988e3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rvielma/gitweave-releases/releases/download/v0.1.2/gitweave-v0.1.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "90dddd8bf4ebd7aec3b5d36c9a58022b1b1af5d95dad9fcb18be8fc0b04b5d7c"
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
