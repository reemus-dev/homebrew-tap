class GhosttyDesigner < Formula
  desc "Design Ghostty's appearance, with your own Ghostty windows as the live preview"
  homepage "https://github.com/reemus-dev/ghostty-designer"
  version "0.5.0"
  license "MIT"

  # Homebrew's style check allows no url in on_arm and on_intel blocks.
  if Hardware::CPU.arm?
    url "https://github.com/reemus-dev/ghostty-designer/releases/download/v0.5.0/ghostty-designer_0.5.0_darwin_arm64.tar.gz"
    sha256 "554fc102a4ee44bf3b79916dd7b35c11b781a8af6345890846bcec2a2b546656"
  else
    url "https://github.com/reemus-dev/ghostty-designer/releases/download/v0.5.0/ghostty-designer_0.5.0_darwin_x86_64.tar.gz"
    sha256 "66c4c146c306f0c070eafdc8aecc1be926848a9b91d37201d354753babf1fd91"
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
