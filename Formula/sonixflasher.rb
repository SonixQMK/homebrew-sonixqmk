class Sonixflasher < Formula
  desc "CLI-based Flasher for Sonix SN32F2xx MCUs"
  homepage "https://github.com/SonixQMK/SonixFlasherC"
  url "https://github.com/SonixQMK/SonixFlasherC/archive/refs/tags/2.0.7.tar.gz"
  sha256 "577f162c64833e19eef6213a6af0c506b534fe3db54ec6d61089e1dae28bcd3e"
  license "GPL-3.0-only"

  bottle do
    root_url "https://ghcr.io/v2/sonixqmk/sonixqmk"
    sha256 cellar: :any, arm64_sonoma: "c04a05dcda119eec98fa8c6cfc3068069d75e76a03407d3b44e46294a20c285a"
    sha256 cellar: :any, ventura:      "3b035d3680be48c3923c613a27a23018de82176dd17afb07e9ef40346f164349"
    sha256 cellar: :any, monterey:     "59cb2d5a525ac128baa2869b27343f448a2fb088010ccfd882a1c16de95fbc66"
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
