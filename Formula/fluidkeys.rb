class Fluidkeys < Formula
  desc "Fluidkeys makes PGP simple"
  homepage "https://www.fluidkeys.com"
  url "https://download.fluidkeys.com/source/v0.3.0.tar.gz"
  version "0.3.0"
  sha256 "cfe69ce64af13af67065fe98b2fbe3e1a8e0c48a0367a7c210fe4b63a72beb7d"
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath/"gopath"
    dir = buildpath/"gopath/src/github.com/fluidkeys/fluidkeys"
    dir.install buildpath.children

    cd dir do
      system "make"
      bin.install "build/bin/fk"

      prefix.install_metafiles
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test fluidkeys`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
