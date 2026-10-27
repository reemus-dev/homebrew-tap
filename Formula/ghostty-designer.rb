class GhosttyDesigner < Formula
  desc "Design Ghostty's appearance, with your own Ghostty windows as the live preview"
  homepage "https://github.com/reemus-dev/ghostty-designer"
  version "0.4.0"
  license "MIT"

  # Homebrew's style check allows no url in on_arm and on_intel blocks.
  if Hardware::CPU.arm?
    url "https://github.com/reemus-dev/ghostty-designer/releases/download/v0.4.0/ghostty-designer_0.4.0_darwin_arm64.tar.gz"
    sha256 "920c63d4893714295e4d2a1380071fe43fd27e9f5cfe9628d2eb56348fe8bce4"
  else
    url "https://github.com/reemus-dev/ghostty-designer/releases/download/v0.4.0/ghostty-designer_0.4.0_darwin_x86_64.tar.gz"
    sha256 "df066b96746acee4361f2b534240fceb9208c0bc7cbb2d66955d3f5ebc3e7e4c"
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
