class Sonixflasher < Formula
  desc "CLI-based Flasher for Sonix SN32F2xx MCUs"
  homepage "https://github.com/SonixQMK/SonixFlasherC"
  url "https://github.com/SonixQMK/SonixFlasherC/archive/refs/tags/2.0.6.tar.gz"
  sha256 "8fe59b56d4d5c5419034700ba43ccca85ee448ba631634c8189dcba59ddbdbcb"
  license "GPL-3.0-only"

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
