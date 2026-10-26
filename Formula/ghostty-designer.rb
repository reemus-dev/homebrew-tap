class GhosttyDesigner < Formula
  desc "Design Ghostty's appearance, with your own Ghostty windows as the live preview"
  homepage "https://github.com/reemus-dev/ghostty-designer"
  version "0.3.1"
  license "MIT"

  # Homebrew's style check allows no url in on_arm and on_intel blocks.
  if Hardware::CPU.arm?
    url "https://github.com/reemus-dev/ghostty-designer/releases/download/v0.3.1/ghostty-designer_0.3.1_darwin_arm64.tar.gz"
    sha256 "8d0f30bf67a1df518bfe538febc59b8b22c8f92d971274de35b2b925241de3ca"
  else
    url "https://github.com/reemus-dev/ghostty-designer/releases/download/v0.3.1/ghostty-designer_0.3.1_darwin_x86_64.tar.gz"
    sha256 "49ca40973cbe81e249147227ee41db60a34947e70277b2c3cc1194f845df4550"
  end

  depends_on macos: :sequoia

  # The exec script runs the binary from inside the bundle, so macOS shows the
  # app's name and icon. A symlink would show the link's name.
  def install
    prefix.install "Ghostty Designer.app"
    bin.write_exec_script prefix/"Ghostty Designer.app/Contents/MacOS/ghostty-designer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghostty-designer --version")
  end
end
