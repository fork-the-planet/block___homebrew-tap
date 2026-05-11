class Aittributor < Formula
  desc "Git hook that adds AI agent attribution to commits"
  homepage "https://github.com/block/aittributor"
  license "Apache-2.0"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/block/aittributor/releases/download/v0.7.0/aittributor-aarch64-apple-darwin.bz2"
      sha256 "e53d04dc8c05008e947083a7437df8a539c19122a53041cf9d7fdf2073b3a1bb"
    else
      url "https://github.com/block/aittributor/releases/download/v0.7.0/aittributor-x86_64-apple-darwin.bz2"
      sha256 "a4e2a41009051e8f623bdb4f153a21982e4b83e8de9aea68120e24c14888e164"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/block/aittributor/releases/download/v0.7.0/aittributor-aarch64-unknown-linux-gnu.bz2"
      sha256 "528cf6558493d4892157be57a70d3960b47f42efe36ce14d2f7f091fdeb1874b"
    else
      url "https://github.com/block/aittributor/releases/download/v0.7.0/aittributor-x86_64-unknown-linux-gnu.bz2"
      sha256 "316450de0bff30c140084021a3ed55445fb345bdc22d543d32df1acfa7ebb10d"
    end
  end

  def install
    binary = buildpath.children.first
    binary.chmod 0755
    bin.install binary => "aittributor"
  end

  test do
    system bin/"aittributor", "--help"
  end
end
