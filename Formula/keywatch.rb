class Keywatch < Formula
  desc "Live view of macOS key events with hold times"
  homepage "https://github.com/reemus-dev/keywatch"
  version "0.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/reemus-dev/keywatch/releases/download/v0.1.0/keywatch_0.1.0_Darwin_arm64.tar.gz"
    sha256 "92e52764ca029e39b0cc597d7c400896e5188ce014c1abbc5640ffdb692cf554"
  end

  on_intel do
    url "https://github.com/reemus-dev/keywatch/releases/download/v0.1.0/keywatch_0.1.0_Darwin_x86_64.tar.gz"
    sha256 "ec5a0f8446e51e9d9ff2d27fb46b01870c33b88d9862744d582ac6b5b24e1e6c"
  end

  depends_on :macos

  def install
    bin.install "keywatch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/keywatch --version")
  end
end
