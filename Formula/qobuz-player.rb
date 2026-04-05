class QobuzPlayer < Formula
  desc "Music player for Qobuz"
  homepage "https://github.com/SofusA/qobuz-player"
  url "https://github.com/SofusA/qobuz-player/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "b2d80809a0b5bbe47e4829935585e739310539667cf968eb892fc5d96b166311"
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
