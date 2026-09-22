class Sonixflasher < Formula
  desc "CLI-based flasher and diagnostics tool for Sonix SN32F2xx USB bootloader devices"
  homepage "https://github.com/SonixQMK/SonixFlasherC"
  url "https://github.com/SonixQMK/SonixFlasherC/archive/refs/tags/3.0.0.tar.gz"
  sha256 "2b8f377544f91e857e10dea35cbadd26062f81a17a71011145f1214b68428044"
  license "GPL-3.0-only"

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
