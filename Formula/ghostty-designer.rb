class GhosttyDesigner < Formula
  desc "Design Ghostty's appearance, with your own Ghostty windows as the live preview"
  homepage "https://github.com/reemus-dev/ghostty-designer"
  version "0.3.0"
  license "MIT"

  # Homebrew's style check allows no url in on_arm and on_intel blocks.
  if Hardware::CPU.arm?
    url "https://github.com/reemus-dev/ghostty-designer/releases/download/v0.3.0/ghostty-designer_0.3.0_darwin_arm64.tar.gz"
    sha256 "2841270a30d0d8674c337d70b852da5054e2db3257db0bc8eefcba3c3f48dfed"
  else
    url "https://github.com/reemus-dev/ghostty-designer/releases/download/v0.3.0/ghostty-designer_0.3.0_darwin_x86_64.tar.gz"
    sha256 "1da23c9ad91915533b0a8a7320e755267ba026df570a6edd5f1ddab769e32de7"
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
