class Sonixflasher < Formula
  desc "CLI flasher and diagnostics for Sonix SN32F2xx and SN34F2xx USB bootloaders"
  homepage "https://github.com/SonixQMK/SonixFlasherC"
  url "https://github.com/SonixQMK/SonixFlasherC/archive/refs/tags/3.1.0.tar.gz"
  sha256 "61a8f603613a1b6996ba1f97f9cb9c540b30223810f9f0f804cfa3fdfc9e9864"
  license "GPL-3.0-only"

  bottle do
    root_url "https://ghcr.io/v2/sonixqmk/sonixqmk"
    sha256 cellar: :any, arm64_tahoe:   "4685dd85cecee98933c9d443368792a81be00f0a0ccb123f89765e158014f652"
    sha256 cellar: :any, arm64_sequoia: "6c0e5b7bd3f2092121d361e0d5031a919198d64e7f7f6f2f49184ae2f2437a0d"
  end

  depends_on "pkg-config" => :build
  depends_on "libusb"

  def install
    system "make", "clean", "sonixflasher"
    bin.install "sonixflasher"
  end

  test do
    output = shell_output("#{bin}/sonixflasher -V")
    assert_match(/sonixflasher \d+\.\d+\.\d+/, output)
  end
end
