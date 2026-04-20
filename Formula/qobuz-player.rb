class QobuzPlayer < Formula
  desc "Music player for Qobuz"
  homepage "https://github.com/SofusA/qobuz-player"
  url "https://github.com/SofusA/qobuz-player/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "a005857c11af59d746d3c88e17d5906e0bd38dc464fd0afe04708bd462cd8372"
  license "GPL-3.0-only"

  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  on_linux do
    depends_on "alsa-lib"
  end

  def install
    system "cargo", "install", *std_cargo_args(path: "qobuz-player-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qobuz-player --version")
  end
end
