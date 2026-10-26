class GhosttyDesigner < Formula
  desc "Design Ghostty's appearance, with your own Ghostty windows as the live preview"
  homepage "https://github.com/reemus-dev/ghostty-designer"
  version "0.2.0"
  license "MIT"

  # Homebrew's style check allows no url in on_arm and on_intel blocks.
  if Hardware::CPU.arm?
    url "https://github.com/reemus-dev/ghostty-designer/releases/download/v0.2.0/ghostty-designer_0.2.0_darwin_arm64.tar.gz"
    sha256 "2ad42146a7e6c070a048ca6c723dc92095efd6b7c5ecc3e5bab17e5746dabb03"
  else
    url "https://github.com/reemus-dev/ghostty-designer/releases/download/v0.2.0/ghostty-designer_0.2.0_darwin_x86_64.tar.gz"
    sha256 "1c88244565d76f2eb5f85d0bdc41ef5c09d207e258ae2489a198f3d55804cd7c"
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
