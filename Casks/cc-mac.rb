cask "cc-mac" do
  version "0.1.0"
  sha256 "1c0fd4cbd7ae3a89e1c9bb66ee23d6fc8a3a7bd9c3574a16606a1538d0784839"
  url "https://github.com/LonerStayle/homebrew-cc-mac/releases/download/v#{version}/CCPendingMonitor-#{version}.zip"
  name "CCPendingMonitor"
  desc "여러 Claude Code 탭의 응답 대기 상황을 한눈에 보는 상황판"
  homepage "https://github.com/LonerStayle/homebrew-cc-mac"
  depends_on macos: ">= :sonoma"
  app "CCPendingMonitor.app"
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine",
                          "#{appdir}/CCPendingMonitor.app"],
                   sudo: false
  end
  uninstall quit: "com.cc-mac.pending-monitor",
            launchctl: "com.cc-mac.pending-monitor"
  zap trash: [
    "~/Library/Logs/CCPendingMonitor",
    "~/Library/LaunchAgents/com.cc-mac.pending-monitor.plist",
    "/tmp/cc-pending",
  ]
end
