class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner (Nikto replacement)"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.7.2"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.7.2/cyweb-darwin-arm64"
      sha256 "c610382ca5a9f0312db09b18cecf061978de0210f5a7213e67b7590240616d28"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.7.2/cyweb-darwin-amd64"
      sha256 "60a5106bf19adc55fbb55a528638e729b9fb11081992412027965457a498093c"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.7.2/cyweb-linux-arm64"
      sha256 "9010d0daad87eb776df79887dff74b3d24eef7a0d513a99eb34a021d9db48def"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.7.2/cyweb-linux-amd64"
      sha256 "3966e94e52aa50eca8b94030a6a65463a0121d0833a5278f1b1047528f78de5b"
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
