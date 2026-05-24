cask "cc-mac" do
  version "0.2.0"
  sha256 "aee16e6a5f6af44f47912c853f0c86652e0a763cbdddaba8ea43794db89f1a4b"
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
