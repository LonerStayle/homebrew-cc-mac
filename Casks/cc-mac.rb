cask "cc-mac" do
  version "0.3.0"
  sha256 "f94e16b0c5dd87d109c03aa675cafddfd0c30ee1bd1bda01b9a62b6ddaa530a7"
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
