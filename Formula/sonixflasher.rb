class Sonixflasher < Formula
  desc "CLI-based Flasher for Sonix SN32F2xx MCUs"
  homepage "https://github.com/SonixQMK/SonixFlasherC"
  url "https://github.com/SonixQMK/SonixFlasherC/archive/refs/tags/2.0.7.tar.gz"
  sha256 "577f162c64833e19eef6213a6af0c506b534fe3db54ec6d61089e1dae28bcd3e"
  license "GPL-3.0-only"

  bottle do
    root_url "https://ghcr.io/v2/sonixqmk/sonixqmk"
    sha256 cellar: :any, arm64_sonoma: "33a5c09e216632da93fe29464109fe8dc27174700d7bc0039d5f5515ef1cc156"
    sha256 cellar: :any, ventura:      "d675823deaa3e0ff25b060635a73ee56c3d2694a667090083984e7b37ade3513"
    sha256 cellar: :any, monterey:     "3e8803d66de860de4fb9e20ac0591e1d095c033a1f914bc657f6d3e9f53c40a9"
  end

  depends_on "pkg-config" => :build
  depends_on "hidapi"

  on_linux do
    depends_on "libusb"
    depends_on "systemd" # for libudev
  end

  def install
    system "make", "clean", "sonixflasher"
    bin.install "sonixflasher"
  end

  test do
    output = shell_output("#{bin}/sonixflasher -V 2>&1", 1)
    assert_match(/sonixflasher \d+\.\d+\.\d+\n/, output)
  end
end
