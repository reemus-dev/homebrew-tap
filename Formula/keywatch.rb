class Keywatch < Formula
  desc "Live view of macOS key events with hold times"
  homepage "https://github.com/reemus-dev/keywatch"
  version "0.1.1"
  license "MIT"

  # Homebrew's style check allows no url in on_arm and on_intel blocks.
  if Hardware::CPU.arm?
    url "https://github.com/reemus-dev/keywatch/releases/download/v0.1.1/keywatch_0.1.1_Darwin_arm64.tar.gz"
    sha256 "4a5882f4633eaae031264482cd54017938a6a9d8371dc79528d1ed4b7720250d"
  else
    url "https://github.com/reemus-dev/keywatch/releases/download/v0.1.1/keywatch_0.1.1_Darwin_x86_64.tar.gz"
    sha256 "2b731b2b7e8617a148fd6a5103e90c493d1af056286b3dc7dc7c1fa5f00386ad"
  end

  depends_on :macos

  def install
    bin.install "keywatch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/keywatch --version")
  end
end
