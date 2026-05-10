class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner (Nikto replacement)"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.8.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.0/cyweb-darwin-arm64"
      sha256 "4e95322c9291ef51fceb0c6130e60c9ccb18e37d37e1440921fba913ae5a0357"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.0/cyweb-darwin-amd64"
      sha256 "c4a0b9a30ea66b0bf616436d1a7b5353ffba6a2d88ba95ff897741c5dfdfba4c"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.0/cyweb-linux-arm64"
      sha256 "eeed9410c784b4f949c835a7fd0ab8204cbfb35d51fb4553f8465d30685c0172"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.0/cyweb-linux-amd64"
      sha256 "45902df3c70a35550f6c7e1482dd9c7bdf4a3c856fb1a20051dafe42ab3e83f1"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cyweb-darwin-arm64" => "cyweb"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cyweb-darwin-amd64" => "cyweb"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cyweb-linux-arm64" => "cyweb"
    else
      bin.install "cyweb-linux-amd64" => "cyweb"
    end
  end

  test do
    assert_match "cyweb", shell_output("#{bin}/cyweb version")
  end
end
