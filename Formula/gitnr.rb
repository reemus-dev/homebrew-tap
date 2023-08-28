class Gitnr < Formula
  desc "A CLI utility to create .gitignore files using one or more templates"
  homepage "https://github.com/reemus-dev/gitnr"
  url "https://github.com/reemus-dev/gitnr/archive/refs/tags/v0.1.37.tar.gz"
  sha256 "689cd24f2e6af6459bed95f634ab8b50a2344a4f097e69ff1df7027bbc493cfa"
  license "MIT"

  depends_on "rust" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "cargo", "install", *std_cargo_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test gitnr`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end