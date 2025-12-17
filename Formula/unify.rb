# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Unify < Formula
  desc "u guess😄"
  homepage "https://github.com/peiyuanwang0/homebrew-unify"
  version "202512170252"
  license ""

# 针对 M1/M2/M3 (ARM64)
  if Hardware::CPU.arm?
    url "https://github.com/peiyuanwang0/homebrew-unify/releases/download/release-202512170252-darwin-arm64/unify-darwin-arm64.tgz"
    sha256 "b11f3e2677e2226a886806fab35507a119b63196097312ebf3c8ebb9634760aa"
  end

  # 针对 Intel (AMD64)
  if Hardware::CPU.intel?
    url "https://github.com/peiyuanwang0/homebrew-unify/releases/download/release-202512170252-darwin-amd64/unify-darwin-amd64.tgz"
    sha256 "b01448f1549b79c3315374ef2526360ea05cd430be0eae6c6dd69caefe3f8a85"
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
