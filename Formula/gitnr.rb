class Gitnr < Formula
  desc "CLI utility to create .gitignore files using one or more templates"
  homepage "https://github.com/reemus-dev/gitnr"
  url "https://github.com/reemus-dev/gitnr/archive/refs/tags/v0.1.37.tar.gz"
  sha256 "0bf57f504193705412f1a513c84fe458c4336243e24a5ed8b1e609e90fc2ebb0"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "false"
  end
end
