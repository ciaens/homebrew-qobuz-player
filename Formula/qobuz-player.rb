class QobuzPlayer < Formula
  desc "Music player for Qobuz"
  homepage "https://github.com/SofusA/qobuz-player"
  url "https://github.com/SofusA/qobuz-player/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "dd5b839589f5d4fd4a5716f77a466d0172369c560234796fb4cc0c9205f319a8"
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
