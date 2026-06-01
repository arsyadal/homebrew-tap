class Contextlint < Formula
  desc "Lint, score, and compress AI agent context files"
  homepage "https://github.com/arsyadal/contextlint"
  url "https://github.com/arsyadal/contextlint/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "1333a18e94e6aebf15f9da2d4a8a45c2714f795c90bade27bcc6f9482b0b02e5"
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
