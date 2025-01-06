class Sonixflasher < Formula
  desc "CLI-based Flasher for Sonix SN32F2xx MCUs"
  homepage "https://github.com/SonixQMK/SonixFlasherC"
  url "https://github.com/SonixQMK/SonixFlasherC/archive/refs/tags/2.0.8.tar.gz"
  sha256 "fb84fca699d7a91e2bfcfe6aad00a5967f6ad08606c602d49d37d5a7a7fa0db8"
  license "GPL-3.0-only"

  bottle do
    root_url "https://ghcr.io/v2/sonixqmk/sonixqmk"
    sha256 cellar: :any, arm64_sequoia: "3061076268cd7c2194515afb6fb695eabd4215be3345a71b53cabfdaf4bdb9ed"
    sha256 cellar: :any, arm64_sonoma:  "5664effea348c5252f774dee19343a6cd39094d6389f7175e505099f81f62339"
    sha256 cellar: :any, ventura:       "fec301d557b2ec03b7c79a716977d91478d8dafa173b3365ad38e3e85e5d4b0e"
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
