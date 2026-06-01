class Contextlint < Formula
  desc "Lint, score, and compress AI agent context files"
  homepage "https://github.com/arsyadal/contextlint"
  url "https://github.com/arsyadal/contextlint/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "f9ea529193f5904decad2979123a9d250e300033a0e98ae663566b69875e2dab"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "contextlint #{version}", shell_output("#{bin}/contextlint --version")
    (testpath/"README.md").write("# Test\n\nUse safe context rules.\n")
    assert_match "ContextLint", shell_output("#{bin}/contextlint scan")
  end
end
