class Sonixflasher < Formula
  desc "CLI flasher and diagnostics for Sonix SN32F2xx and SN34F2xx USB bootloaders"
  homepage "https://github.com/SonixQMK/SonixFlasherC"
  url "https://github.com/SonixQMK/SonixFlasherC/archive/refs/tags/3.1.0.tar.gz"
  sha256 "61a8f603613a1b6996ba1f97f9cb9c540b30223810f9f0f804cfa3fdfc9e9864"
  license "GPL-3.0-only"

  bottle do
    root_url "https://ghcr.io/v2/sonixqmk/sonixqmk"
    sha256 cellar: :any, arm64_tahoe:   "57b88a81d7bda2bbe162829a3c5ed3766d96ad4342bf805b40e5790fea88fc0a"
    sha256 cellar: :any, arm64_sequoia: "17346f6e5850c70a9bc8dddb85283fde7ea2b3a2100f915abb05b61dc566e0a7"
    sha256 cellar: :any, arm64_sonoma:  "7416b993fdc37f32abe08a770edf72e49e5ce9bbd4c2990ddc21808109101882"
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
