# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Unify < Formula
  desc "u guess😄"
  homepage "https://github.com/peiyuanwang0/homebrew-unify"
  version "202512170304"
  license ""

# 针对 M1/M2/M3 (ARM64)
  if Hardware::CPU.arm?
    url "https://github.com/peiyuanwang0/homebrew-unify/releases/download/release-202512170304-darwin-arm64/unify-darwin-arm64.tgz"
    sha256 "d164c2ca6dec2c120e37192ee49f48c55c4c6ad266b7e1feeff1b3403b87eec8"
  end

  # 针对 Intel (AMD64)
  if Hardware::CPU.intel?
    url "https://github.com/peiyuanwang0/homebrew-unify/releases/download/release-202512170304-darwin-amd64/unify-darwin-amd64.tgz"
    sha256 "0cb134e30a7b2b9e04890355831b13d25845e4855ceb4a0008975984a701faf5"
  end
  # depends_on "cmake" => :build

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://docs.brew.sh/rubydoc/Formula.html#std_configure_args-instance_method
    # system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    if Hardware::CPU.arm?
      bin.install "unify-darwin-arm64" => "unify"
    else
      bin.install "unify-darwin-amd64" => "unify"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test unify`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
