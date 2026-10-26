class GhosttyDesigner < Formula
  desc "Design Ghostty's appearance, with your own Ghostty windows as the live preview"
  homepage "https://github.com/reemus-dev/ghostty-designer"
  version "0.1.0"
  license "MIT"

  # Homebrew's style check allows no url in on_arm and on_intel blocks.
  if Hardware::CPU.arm?
    url "https://github.com/reemus-dev/ghostty-designer/releases/download/v0.1.0/ghostty-designer_0.1.0_darwin_arm64.tar.gz"
    sha256 "df72f04a06a66a60bed82532ca2f17ef2dc375a805cbd05817222c03eb350583"
  else
    url "https://github.com/reemus-dev/ghostty-designer/releases/download/v0.1.0/ghostty-designer_0.1.0_darwin_x86_64.tar.gz"
    sha256 "f64a2af70d347639fc2333e02e17483d87064cff419b31cf54ba3802a701a92e"
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
