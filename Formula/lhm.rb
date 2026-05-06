class Lhm < Formula
  desc "Merges global and repo lefthook configs"
  homepage "https://github.com/block/lhm"
  license "Apache-2.0"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/block/lhm/releases/download/v0.8.0/lhm-aarch64-apple-darwin.bz2"
      sha256 "1daf2bd0b04d88ec88f9f940e52271445243b1160804a413c8fd8b479170c466"
    else
      url "https://github.com/block/lhm/releases/download/v0.8.0/lhm-x86_64-apple-darwin.bz2"
      sha256 "9b8835e37d28dcd10fcb1c5887c3cd6d4b7ae6a41108840f654d3467ee09d640"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/block/lhm/releases/download/v0.8.0/lhm-aarch64-unknown-linux-gnu.bz2"
      sha256 "3ec63a7d5e382005a463cb8f764a301a01e6cd4a0aa0e0c26e2fe7b6e3f82ff6"
    else
      url "https://github.com/block/lhm/releases/download/v0.8.0/lhm-x86_64-unknown-linux-gnu.bz2"
      sha256 "4df06772f0c8fac643314800429bb7b8964b5d8fbe326dc79f0be33d81206aea"
    end
  end

  def install
    # bz2 is auto-extracted by Homebrew; the resulting file needs to be renamed
    binary = buildpath.children.first
    binary.chmod 0755
    bin.install binary => "lhm"
  end

  test do
    system bin/"lhm", "--help"
  end
end
