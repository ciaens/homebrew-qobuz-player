class QobuzPlayer < Formula
  desc "Music player for Qobuz"
  homepage "https://github.com/SofusA/qobuz-player"
  url "https://github.com/SofusA/qobuz-player/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "719867f6c9574476a04a0097fe87fb6336465bf959c8963dc2a4970578806b51"
  license "GPL-3.0-only"

  depends_on "rust" => :build
  depends_on "pkg-config" => :build

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

